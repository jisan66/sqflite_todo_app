  import 'package:flutter/material.dart';
  import 'package:sqflite_todo/database_helper.dart';
  import 'package:sqflite_todo/model.dart';
  import 'package:sqflite_todo/user_list.dart';
  import 'custom_button_widget.dart';
  import 'input_field_widget.dart';

  class MyHomePage extends StatefulWidget {
    User? user;

    MyHomePage({super.key, this.user});

    @override
    State<MyHomePage> createState() => _MyHomePageState();
  }

  class _MyHomePageState extends State<MyHomePage> {
    @override
    void initState() {
      if (widget.user != null) {
        nameController.text = widget.user!.name.toString();
        phoneController.text = widget.user!.phone.toString();
        addressController.text = widget.user!.address.toString();
      }
      super.initState();
      print("-------------------------${widget.user}");
    }

    // @override
    // void dispose() {
    //   nameController.dispose();
    //   phoneController.dispose();
    //   addressController.dispose();
    //   super.dispose();
    // }

    // final _focusNode = FocusNode();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    bool isLoading = false;

    @override
    Widget build(BuildContext context) {
      return GestureDetector(
        onTap: (){
          FocusManager.instance.primaryFocus!.unfocus();
        },
        child: Scaffold(
          appBar: widget.user == null
              ? null
              : AppBar(title: const Text('Update Profile')),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InputTextField(
                      icons: Icons.person,
                      labelText: widget.user != null ? nameController.text : 'Name',
                      textEditingController: nameController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    InputTextField(
                      icons: Icons.phone,
                      labelText:
                          widget.user != null ? nameController.text : 'Phone',
                      textEditingController: phoneController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    InputTextField(
                      icons: Icons.home,
                      labelText:
                          widget.user != null ? nameController.text : 'Address',
                      textEditingController: addressController,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    isLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : CustomButton(
                            onPressed: () async {
                              FocusManager.instance.primaryFocus!.unfocus();
                              setState(() {
                                isLoading = true;
                              });
                              final name = nameController.value.text;
                              final phone = phoneController.value.text;
                              final address = addressController.value.text;

                              if (name == "" || phone == "" || address == "") {
                                if (mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text("Please Submit All Data")));
                                }
                                setState(() {
                                  isLoading = false;
                                });
                                return;
                              } else {
                                final User userModel = User(
                                    phone: phone,
                                    name: name,
                                    address: address,
                                    id: widget.user?.id);
                                if (widget.user == null) {
                                  await DatabaseHelper.addUser(userModel);
                                } else {
                                  await DatabaseHelper.updateUser(userModel);
                                }
                                nameController.clear();
                                phoneController.clear();
                                addressController.clear();
                                if (mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              "User Data Added Successfully")));
                                }
                                setState(() {
                                  isLoading = false;
                                  widget.user = null;
                                });
                              }
                            },
                            text: widget.user != null ? 'Edit' : 'Submit',
                            height: 42,
                          )
                  ],
                ),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const UserListScreen()));
              setState(() {});
            },
            tooltip: 'Add New',
            child: const Icon(Icons.person),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ),
      );
    }
  }
