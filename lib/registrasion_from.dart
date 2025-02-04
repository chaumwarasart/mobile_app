import 'package:flutter/material.dart';

class FormSimple extends StatefulWidget {
  const FormSimple({super.key});
  @override
  State<FormSimple> createState() => _FromSimple();
}

class _FromSimple extends State<FormSimple> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedItem;
  bool? _isChecked = false;
  String? _selectedGender;
  String? _selectedProvince;
  bool _acceptedTerms = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Register Form (650710234)'),
          centerTitle: true,
        ), //AppBar
        body: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Full Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                Row(
                  children: [
                    Radio<String>(
                      value: "Male",
                      groupValue: _selectedGender,
                      onChanged: (value) {
                        setState(() {
                          _selectedGender = value;
                        });
                      },
                    ),
                    const Text("Male"),
                    const SizedBox(width: 20),
                    Radio<String>(
                      value: "Female",
                      groupValue: _selectedGender,
                      onChanged: (value) {
                        setState(() {
                          _selectedGender = value;
                        });
                      },
                    ),
                    const Text("Female"),
                    const SizedBox(width: 20),
                    Radio<String>(
                      value: "LGBT+",
                      groupValue: _selectedGender,
                      onChanged: (value) {
                        setState(() {
                          _selectedGender = value;
                        });
                      },
                    ),
                    const Text("LGBT+"),
                  ],
                ),
                DropdownButtonFormField<String>(
                  decoration:
                      const InputDecoration(labelText: 'Province'),
                  value: _selectedItem,
                  items: ['Bangkok', 'Chiang Mai', 'Phuket', 'Khon Kaen']
                      .map((item) =>
                          DropdownMenuItem(value: item, child: Text(item)))
                      .toList(),
                  onChanged: (value) {
                    _selectedItem = value;
                  },
                  validator: (value) =>
                      value == null ? 'Please select an option' : null,
                ),
                CheckboxListTile(
                  title: const Text('Accept Terms & Conditions'),
                  value: _isChecked,
                  onChanged: (value) {
                    setState(() {
                      _isChecked = value!;
                    });
                  },
                ),
                Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() && _acceptedTerms) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Form Submitted")),
                      );
                    }
                  },
                  child: const Text("Submit"),
                ),
              ),
            ],
          ),
              
            ), //Column
    
    );
  }
}
