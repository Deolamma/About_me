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

  var _nameController = TextEditingController();
  var _sexController = TextEditingController();
  var _emailController = TextEditingController();
  var _ageController = TextEditingController();
  var _occupationController = TextEditingController();

  var _emailFocusNode = FocusNode();
  var _sexFocusNode = FocusNode();
  var _ageFocusNode = FocusNode();
  var _occupationFocusNode = FocusNode();

  @override
  void dispose() {
    _nameController.dispose();
    _sexController.dispose();
    _emailController.dispose();
    _ageController.dispose();
    _occupationController.dispose();
    _emailFocusNode.dispose();
    _sexFocusNode.dispose();
    _ageFocusNode.dispose();
    _occupationFocusNode.dispose();

    super.dispose();
  }

  

  void _submitInput() {
    _name = _nameController.text;
    _sex = _sexController.text;
    _age = int.parse(_ageController.text);
    _occupation = _occupationController.text;
    _email = _emailController.text;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var currentFocus = FocusScope.of(context);
    return Container(
      width: size.width,
      height: size.height,
      padding: EdgeInsets.all(kDefaultPadding),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: _nameController,
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
              controller: _occupationController,
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
              controller: _emailController,
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
              controller: _sexController,
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
              controller: _ageController,
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
                child: _nameController.text.isEmpty ||
                        _ageController.text.isEmpty ||
                        _emailController.text.isEmpty ||
                        _sexController.text.isEmpty ||
                        _occupationController.text.isEmpty
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
