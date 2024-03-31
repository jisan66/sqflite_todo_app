import 'package:flutter/material.dart';
import 'package:sqflite_todo/database_helper.dart';
import 'package:sqflite_todo/home_page.dart';
import 'package:sqflite_todo/model.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
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
        body: FutureBuilder<List<User>?>(
          future: DatabaseHelper.getAllUser(),
          builder: (context, AsyncSnapshot<List<User>?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else if (snapshot.hasData) {
              if (snapshot.data != null) {
                return ListView.builder(
                  itemCount: snapshot.data?.length ?? 0,
                  itemBuilder: (context, index) => Card(
                    child: InkWell(
                      onDoubleTap: (){
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=> MyHomePage(user: snapshot.data![index],)), (route) => true);
                      },
                      onLongPress: () async {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text(
                                    "Do you want to delete this user info?"),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () async {
                                        await DatabaseHelper.deleteUser(
                                            snapshot.data![index]);
                                        Navigator.pop(context);
                                        setState(() {});
                                      },
                                      child: const Text("Yes")),
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("No")),
                                ],
                              );
                            });
                      },
                      child: ListTile(
                        title: Text(snapshot.data![index].name),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(snapshot.data![index].phone),
                            Text(snapshot.data![index].address),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }
            }
            return const SizedBox();
          },
        ));
  }
}
