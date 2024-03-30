import 'package:flutter/material.dart';
import 'package:sqflite_todo/user_list.dart';

import 'custom_button_widget.dart';
import 'input_field_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _focusNode = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InputTextField(icons: Icons.person, labelText: 'Name',textEditingController: nameController,),
                const SizedBox(height: 16,),
                InputTextField(icons: Icons.phone, labelText: 'Phone',textEditingController: phoneController,),
                const SizedBox(height: 16,),
                InputTextField(icons: Icons.home, labelText: 'Address',maxLine: 3,textEditingController: addressController,),
                const SizedBox(height: 24,),
                const CustomButton(text: 'Submit', height: 42,)
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_)=>const UserListScreen()));
        },
        tooltip: 'Add New',
        child: const Icon(Icons.person),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
