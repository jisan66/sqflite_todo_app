import 'package:flutter/material.dart';

import 'custom_button_widget.dart';
import 'input_field_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          "SQFLITE TO DO LIST",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InputTextField(icons: Icons.person, labelText: 'Name',),
            SizedBox(height: 16,),
            InputTextField(icons: Icons.phone, labelText: 'Phone',),
            SizedBox(height: 16,),
            InputTextField(icons: Icons.home, labelText: 'Address',),
            SizedBox(height: 24,),
            CustomButton(text: 'Submit', height: 42,)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add New',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
