import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_2/Widget/displayItem.dart';

import '../constants.dart';

class InputDisplayWidget extends StatefulWidget {
  @override
  _InputDisplayWidgetState createState() => _InputDisplayWidgetState();
}

class _InputDisplayWidgetState extends State<InputDisplayWidget> {
  var _name = '';
  var _sex = '';
  var _email = '';
  var _age;
  var _occupation = '';

  var nameController = TextEditingController();
  var sexController = TextEditingController();
  var emailController = TextEditingController();
  var ageController = TextEditingController();
  var occupationController = TextEditingController();

  var _emailFocusNode = FocusNode();
  var _sexFocusNode = FocusNode();
  var _ageFocusNode = FocusNode();
  var _occupationFocusNode = FocusNode();

  @override
  // void initState() {
  //   nameController.addListener(() {
  //     setState(() {});
  //   });
  //   sexController.addListener(() {
  //     setState(() {});
  //   });
  //   ageController.addListener(() {
  //     setState(() {});
  //   });
  //   occupationController.addListener(() {
  //     setState(() {});
  //   });
  //   emailController.addListener(() {
  //     setState(() {});
  //   });

  //   super.initState();
  // }

  @override
  void dispose() {
    nameController.dispose();
    sexController.dispose();
    emailController.dispose();
    ageController.dispose();
    occupationController.dispose();
    _emailFocusNode.dispose();
    _sexFocusNode.dispose();
    _ageFocusNode.dispose();
    _occupationFocusNode.dispose();

    super.dispose();
  }

  void _submitInput() {
    _name = nameController.text;
    _sex = sexController.text;
    _age = int.parse(ageController.text);
    _occupation = occupationController.text;
    _email = emailController.text;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var currentFocus = FocusScope.of(context);
    return Container(
      width: size.width,
      height: size.height * 0.60,
      padding: EdgeInsets.all(kDefaultPadding),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: nameController,
              textInputAction: TextInputAction.next,
              onSubmitted: (_) {
                currentFocus.requestFocus(_occupationFocusNode);
              },
              decoration: InputDecoration(
                hintText: 'Fullname',
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.secondary)),
              ),
            ),
            TextField(
              controller: occupationController,
              textInputAction: TextInputAction.next,
              focusNode: _occupationFocusNode,
              onSubmitted: (_) {
                currentFocus.requestFocus(_emailFocusNode);
              },
              decoration: InputDecoration(
                hintText: 'What do you do?',
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.secondary)),
              ),
            ),
            TextField(
              controller: emailController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              focusNode: _emailFocusNode,
              onSubmitted: (_) {
                currentFocus.requestFocus(_sexFocusNode);
              },
              decoration: InputDecoration(
                hintText: 'Email address',
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.secondary)),
              ),
            ),
            TextField(
              controller: sexController,
              textInputAction: TextInputAction.next,
              focusNode: _sexFocusNode,
              onSubmitted: (_) {
                currentFocus.requestFocus(_ageFocusNode);
              },
              decoration: InputDecoration(
                hintText: 'Sex',
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.secondary)),
              ),
            ),
            TextField(
              controller: ageController,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.number,
              focusNode: _ageFocusNode,
              onSubmitted: (_) => _submitInput(),
              decoration: InputDecoration(
                hintText: 'Age',
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.secondary)),
              ),
            ),
            TextButton(
                onPressed: _submitInput,
                child: Container(
                  margin: EdgeInsets.all(kDefaultPadding - 10),
                  padding: EdgeInsets.all(kDefaultPadding - 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kDefaultPadding),
                    color: kPrimaryColor,
                  ),
                  width: size.width,
                  child: Text(
                    'Save Input',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                    )),
                  ),
                )),
            Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 5,
                ),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: nameController.text.isEmpty ||
                        ageController.text.isEmpty ||
                        emailController.text.isEmpty ||
                        sexController.text.isEmpty ||
                        occupationController.text.isEmpty
                    ? null
                    : DisplayItem(
                        name: _name,
                        age: _age,
                        emailAddress: _email,
                        sex: _sex,
                        occupation: _occupation,
                      ))
          ],
        ),
      ),
    );
  }
}
