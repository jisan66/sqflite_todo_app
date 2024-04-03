import 'package:flutter/material.dart';
import 'package:sqflite_todo/course_model.dart';
import 'package:sqflite_todo/custom_button_widget.dart';
import 'package:sqflite_todo/database_helper.dart';
import 'package:sqflite_todo/input_field_widget.dart';

class CourseScreen extends StatefulWidget {
  final int userId;

  const CourseScreen({super.key, required this.userId});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  TextEditingController courseTitleController = TextEditingController();
  TextEditingController courseCodeController = TextEditingController();
  TextEditingController courseCreditController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Courses"),
        centerTitle: true,
      ),
      body: FutureBuilder<List<UserCourse>?>(
        future: DatabaseHelper.getAllUserCourse(widget.userId),
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
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
              context: context,
              builder: (context) {
                return SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                        height: 375,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25))),
                        child: Column(children: [
                          const SizedBox(height: 20,),
                          const Text("ADD INFORMATION"),
                          const SizedBox(height: 20,),
                          InputTextField(
                            labelText: 'Course Title',
                            textEditingController: courseTitleController,
                          ),
                          const SizedBox(height: 10,),
                          InputTextField(
                            labelText: 'Course Code',
                            textEditingController: courseCodeController,
                          ),
                          const SizedBox(height: 10,),
                          InputTextField(
                            labelText: 'Course Credit',
                            textEditingController: courseCreditController,
                          ),
                          const SizedBox(height: 20,),
                          isLoading? const Center(child: CircularProgressIndicator(),) : CustomButton(text: "Submit", height: 50, onPressed: () async{
                            setState(() {
                              isLoading = true;
                            });
                            final courseTitle = courseTitleController.value.text;
                            final courseCode = courseCodeController.value.text;
                            final courseCredit = double.parse(courseCreditController.value.text);
                            final UserCourse userCourse = UserCourse(userId: widget.userId, courseTitle: courseTitle, courseCode: courseCode, courseCredit: courseCredit);
                            await DatabaseHelper.addCourses(userCourse, widget.userId);
                            setState(() {
                              isLoading = false;
                            });
                            FocusManager.instance.primaryFocus!.unfocus();
                          })
                        ])),
                  ),
                );
              });
        },
      ),
    );
  }
}
