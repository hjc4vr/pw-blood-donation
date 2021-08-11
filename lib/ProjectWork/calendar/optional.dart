import 'package:flutter/material.dart';
import 'package:pw/style.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:flutter_ui_toolkit/flutter_ui_toolkit.dart';
class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  late String _name;
  late String _email;
  late String _phoneNumber;
  String ?_dropdownvalue;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return UITextField(
        as: inputStyle,
        hint: 'Your name',
      validator: (String ?value) {
        if (value ==null) {
          return 'name is required';
        }
        return null;
      },
        prefix: Icon(Icons.person_rounded),
        onChanged: (value) => _name = value,
         );
  }
  Widget _buildEmail(){
    return UITextField(
      as: inputStyle,
      hint: 'Your email',
      validator: (String ?value) {
        if (value ==null) {
          return 'email is required';
        }

        if (!RegExp(
            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
        }

        return null;
      },
      prefix: Icon(Icons.email),
      onChanged: (value) => _email = value,
    );
  }

  Widget _buildPhoneNumber() {
    return UITextField(
      as: inputStyle,
      validator: (String ? value) {
      if (value == null) {
        return 'Phone number is Required';
      }

      return null;
    },
      hint: 'Your phone number',
      prefix: Icon(Icons.phone),
      onChanged: (value) => _phoneNumber = value,
    );
  }
  Widget _dropdown(){
    return DropdownButton(
      hint: _dropdownvalue == null
          ? Text('Select your preferred day!')
          : Text(
        _dropdownvalue as String,
        style: TextStyle(color: Colors.blue),
      ),
      isExpanded: true,
      iconSize: 30.0,
      style: TextStyle(color: Colors.blue),
      items: ['Monday', 'Tuesday', 'Wednesday',"Thursday","Friday","Saturday","Sunday"].map(
            (val) {
          return DropdownMenuItem<String>(
            value: val,
            child: Text(val),
          );
        },
      ).toList(),
      onChanged: (val) {
        setState(
              () {
            _dropdownvalue = val.toString();
          },
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Optional Calendar System"),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("This is an optional calendar system. You can indicate your preference for the day in a typical week, and the SRC will contact you once they want your blood!",
                style:TextStyle(color: Colors.deepOrange,fontWeight: FontWeight.bold,fontSize: 20)),
                SizedBox(height:50),
                _buildName(),
                _buildEmail(),
                _buildPhoneNumber(),
                _dropdown(),

                SizedBox(height: 100),
                RaisedButton(
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }

                    _formKey.currentState!.save();

                    print(_name);
                    print(_email);
                    print(_phoneNumber);
                    Navigator.pop(context);

                    //Send to API
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}