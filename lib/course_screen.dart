import 'package:flutter/material.dart';
import 'package:sqflite_todo/course_model.dart';
import 'package:sqflite_todo/database_helper.dart';

class CourseScreen extends StatelessWidget {
  final int userId;

  const CourseScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Courses"),
        centerTitle: true,
      ),
      body: FutureBuilder<List<UserCourse>?>(
        future: DatabaseHelper.getAllUserCourse(userId),
        builder: (context, AsyncSnapshot<List<UserCourse>?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data![index].courseTitle),
                    subtitle: Column(
                      children: [
                        Text(snapshot.data![index].courseCode),
                        Text(snapshot.data![index].courseCredit.toString()),
                      ],
                    ),
                  );
                });
          }
          return const SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          BottomSheet(onClosing: () { Navigator.pop(context); }, builder: (BuildContext context) {
            return Text("Jisan Saha");///have to change or update the bottomsheet///
          }
          );
        },
      ),
    );
  }
}
