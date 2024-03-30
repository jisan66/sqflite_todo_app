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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InputTextField(icons: Icons.person, labelText: 'Name',),
              SizedBox(height: 16,),
              InputTextField(icons: Icons.phone, labelText: 'Phone',),
              SizedBox(height: 16,),
              InputTextField(icons: Icons.home, labelText: 'Address',maxLine: 3,),
              SizedBox(height: 24,),
              CustomButton(text: 'Submit', height: 42,)
            ],
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
