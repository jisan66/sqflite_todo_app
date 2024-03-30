import 'package:flutter/material.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        title: const Text("SQFLITE TO DO LIST"),
      ),
      body: Expanded(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => const Card(
            child: ListTile(
              title: Text("Hello this is Jisan"),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("This is sub 1"),
                  Text("This is sub 2"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
