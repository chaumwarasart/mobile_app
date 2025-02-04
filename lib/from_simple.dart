// import 'package:flutter/material.dart';

// class FromSimple extends StatelessWidget {
//   final _formKey = GlobalKey<FormState>();
//   String? _gender = 'Female';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Simple Form'),
//         ), //AppBar
//         body: Form(
//             key: _formKey,
//             child:
//                 Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//               Column(children: [
//                 RadioListTile(
//                   title: const Text('Male'),
//                   value: 'Male',
//                   groupValue: _gender,
//                   onChanged: (value) {
//                     setState(() {
//                       _gender = value.toString();
//                     });
//                   },
//                 ),
//                 RadioListTile(
//                   title: const Text('Female'),
//                   value: 'Female',
//                   groupValue: _gender,
//                   onChanged: (value) {
//                     setState(() {
//                       _gender = value.toString();
//                     });
//                   },
//                 ),
//               ]),
//             ])) //Column
//         );
//   }
// }
