import 'package:flutter/material.dart';
import 'package:pw/style.dart';
import 'verifyusers.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:flutter_ui_toolkit/flutter_ui_toolkit.dart';
import 'package:pw/ProjectWork/homepage.dart';
class Login extends StatefulWidget {
  // Passwords are "12345678". They are encrypted at database.
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String curusername = "";
  String curpassword = "";
  bool hidePassword = true;
  ButtonState bs1 = ButtonState.idle;
  ButtonState bs2 = ButtonState.idle;
  ButtonState bs3 = ButtonState.idle;
  ButtonState bs4 = ButtonState.idle;
  ButtonState bs5 = ButtonState.idle;
  //final int loginPageButtonMinWidth = 58;
  final double loginPageButtonMaxWidth = 160;

  //var dao = new DAO();

  Widget titleContainer(String title) {
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        child: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30),
        ));
  }

  Widget loginContainer() {
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        child: Text(
          'Log in',
          style: TextStyle(fontSize: 20),
        ));
  }

  passwordiconOnpressed() {
    setState(() {
      hidePassword = !hidePassword;
    });
  }

  loginbuttononPressed() {
    if (curusername == "" || curpassword == "") {
      showMessage(context, "Please enter Singpass ID and password.");
      return false;
    }
    return true;
  }

  signUpOnPressed() {
    showMessage(context, "Sorry, we currently do not support this feature");
  }

  verifyOnPressed() {
    showMessage(context, "Sorry, we currently do not support this feature");
  }

  defaultLogin() {
    Navigator.of(context).pop();
    // /*Navigator.of(context).push(
    //   MaterialPageRoute(builder: (context) => Home()),
    // );
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => HomeScreen())
        );

  }

  Future<void> showMessage(BuildContext context, String message,
      {String title = "Error"}) async {
    if (title == "Error") {
      await errorDialog(
        context: context,
        title: title,
        description: message,
        okOnPress: () {},
      ).show();
    } else if (title == "Success") {
      await successDialog(
          context: context,
          title: title,
          description: message,
          okOnPress: () {})
          .show();
    } else {
      await infoDialog(
          context: context,
          title: title,
          description: message,
          okOnPress: () {})
          .show();
    }
    // final myalert =
    //     AlertDialog(title: Text(title), content: Text(message), actions: [
    //   TextButton(
    //     child: Text("Ok"),
    //     onPressed: () {
    //       Navigator.of(context).pop();
    //     },
    //   )
    // ]);
    // await showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return myalert;
    //     });
    // return;
  }

  Widget forgotPasswordButton() {
    return ProgressButton.icon(
        iconedButtons: {
          ButtonState.idle: IconedButton(
              text: "Reset password",
              icon: Icon(Icons.restart_alt, color: Colors.white),
              color: Colors.cyan),
          ButtonState.loading:
          IconedButton(text: "Loading", color: Colors.amber),
          ButtonState.fail: failedPB,
          ButtonState.success: successPB
        },
        onPressed: () async {
          showMessage(context,
              "Sorry, we currently do not support this feature");
        },
        //minWidth: loginPageButtonMinWidth,
        maxWidth: loginPageButtonMaxWidth,
        state: bs2);
    //longButton(loginbuttononPressed, 'Login');
  }

  Widget loginButton() {
    return ProgressButton.icon(
        iconedButtons: {
          ButtonState.idle: IconedButton(
              text: "Login",
              icon: Icon(Icons.login, color: Colors.white),
              color: Colors.green),
          ButtonState.loading:
          IconedButton(text: "Loading", color: Colors.amber),
          ButtonState.fail: failedPB,
          ButtonState.success: successPB
        },
        onPressed: ()  {
          defaultLogin();
        },
        state: bs1);
    //longButton(loginbuttononPressed, 'Login');
  }

  Widget signUpButton() {
    return ProgressButton.icon(
        iconedButtons: {
          ButtonState.idle: IconedButton(
              text: "Verify NRIC",
              icon: Icon(Icons.account_box, color: Colors.white),
              color: Colors.amber[800]!),
          ButtonState.loading:
          IconedButton(text: "Loading", color: Colors.amber),
              ButtonState.fail: failedPB,
              ButtonState.success: successPB
        },
        onPressed: () {
          signUpOnPressed();
        },
        //minWidth: loginPageButtonMinWidth,
        maxWidth: loginPageButtonMaxWidth,
        state: bs3);
  }

  Widget verifyButton() {
    return ProgressButton.icon(
        iconedButtons: {
          ButtonState.idle: IconedButton(
              text: "Use QR Code",
              icon: Icon(Icons.qr_code, color: Colors.white),
              color: Colors.amber[800]!),
          ButtonState.loading:
          IconedButton(text: "Loading", color: Colors.amber),
          ButtonState.fail: failedPB,
          ButtonState.success: successPB
        },
        onPressed: () {
          verifyOnPressed();
        },
        //minWidth: loginPageButtonMinWidth,
        maxWidth: loginPageButtonMaxWidth,
        state: bs4);
  }

  Widget signupVerifyRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        signUpButton(),
        SingleChildScrollView(
            child: verifyButton(), scrollDirection: Axis.horizontal),
      ],
    );
  }

  Widget resetBypassRow() {
    return SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            forgotPasswordButton(),
            SingleChildScrollView(
                child: defaultLoginButton(), scrollDirection: Axis.horizontal),
          ],
        ));
  }

  Widget defaultLoginButton() {
    return ProgressButton.icon(
      iconedButtons: {
        ButtonState.idle: IconedButton(
            text: "Developer bypass",
            icon: Icon(Icons.developer_mode, color: Colors.white),
            color: Colors.red),
        ButtonState.loading: IconedButton(text: "Loading", color: Colors.amber),
        ButtonState.fail: failedPB,
        ButtonState.success: successPB
      },
      onPressed: () {
        defaultLogin();
      },
      //minWidth: loginPageButtonMinWidth,
      maxWidth: loginPageButtonMaxWidth,
      state: bs5,
    );
  }

  Widget passwordTextField() {
    return UITextField(
        as: inputStyle,
        hint: 'Password',
        prefix: Icon(Icons.password),
        onChanged: (value) => curpassword = value,
        obscureText: hidePassword,
        suffix: IconButton(
            icon: Icon(hidePassword ? Icons.visibility_off : Icons.visibility),
            onPressed: () {
              setState(() {
                hidePassword = !hidePassword;
              });
            }));

    //   obscureText: hidePassword,
    // controller: controller,
    // decoration: InputDecoration(
    //     border: OutlineInputBorder(),
    //     labelText: 'Password',
    //     suffixIcon: IconButton(
    //         icon:
    //             Icon(hidePassword ? Icons.visibility_off : Icons.visibility),
    //         onPressed: () {
    //           onPressed();
    //         })));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
            padding: EdgeInsets.all(20),
            child: ListView(
              children: <Widget>[
                //SizedBox(height:90),
                SizedBox(
                  height: 300,
                  child:Image.asset("images/Singapore_Red_Cross.jpg"),
                ),
                //loginContainer(),
                SizedBox(height: 16),
                UITextField(
                    as: inputStyle,
                    hint: 'Singpass ID',
                    prefix: Icon(Icons.person),
                    onChanged: (value) => curusername = value),
                SizedBox(height: 10),
                passwordTextField(),
                SizedBox(height: 16),
                loginButton(),
                SizedBox(height: 16),
                signupVerifyRow(),
                SizedBox(height: 12),
                resetBypassRow(),
              ],
            )));
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
}