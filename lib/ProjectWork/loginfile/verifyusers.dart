import 'package:flutter/material.dart';
import 'package:pw/style.dart';
class Verifycustomer extends StatefulWidget {
  @override
  _VerifycustomerState createState() => _VerifycustomerState();
}

class _VerifycustomerState extends State<Verifycustomer> {
  late TextEditingController _controller1;
  late TextEditingController _controller2;
  bool validate1 = true;
  bool validate2 = true;
  Widget button(String buttonText) {
    {
      return Container(
          height: 50,
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: ElevatedButton(
            child: Text(
              buttonText,
              style: TextStyle(fontSize: 18),
            ),
            onPressed: () {
              // showMessage(context, "Sorry, we currently do not support this feature");
            },
          ));
    }
  }

  Widget _inputData(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          textfield('Singpass ID', _controller1, false, validate: validate1),
          SizedBox(height: 10),
          textfield('Verification code', _controller2, false,
              validate: validate2),
          SizedBox(height: 10),
          button('Verify'),
        ],
      ),
    );
  }

  @override
  void initState() {
    _controller1 = TextEditingController();
    _controller1.text = '';
    _controller2 = TextEditingController();
    _controller2.text = "";
    super.initState();
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Verify account', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.green,
        ),
        body: Center(child: _inputData(context)));
  }
}

Widget textfield(
    String labeltext, TextEditingController controller, bool obscureText,
    {bool? validate, bool outlineBorder = false}) {
  InputDecoration inputDecoration;
  if (validate != null && outlineBorder == false) {
    inputDecoration = InputDecoration(
      labelText: labeltext,
      errorText: validate ? null : 'Field can\'t be empty',
    );
  } else if (validate != null && outlineBorder == true) {
    inputDecoration = InputDecoration(
      labelText: labeltext,
      border: OutlineInputBorder(),
      errorText: validate ? null : 'Field can\'t be empty',
    );
  } else if (validate == null && outlineBorder == false) {
    inputDecoration = InputDecoration(
      labelText: labeltext,
    );
  } else {
    inputDecoration = InputDecoration(
      labelText: labeltext,
      border: OutlineInputBorder(),
    );
  }
  return TextField(
    obscureText: obscureText,
    decoration: inputDecoration,
    controller: controller,
  );

}