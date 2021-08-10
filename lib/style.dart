import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_toolkit/flutter_ui_toolkit.dart';
import 'package:progress_state_button/iconed_button.dart';

import 'dart:math' as math;
import 'package:flutter/material.dart';
final inputStyle = UITextFieldDefaults(
    borderColor: Colors.black45,
    borderRadius: 8,
    borderType: UIBorderType.outlineBorder,
    borderWidth: 2.0,
    hintColor: Colors.black54,
    bgColor: Colors.white,
    focusBorderColor: Colors.indigo
);

final titleStyle = UIHeadingDefaults(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontSize: 22,
);

final textStyle = UIHeadingDefaults(
  color: Colors.black,
  fontSize: 18,
);

UIButtonDefaults buttonStyle({double width = 0.5, Color color = Colors.indigo}) => UIButtonDefaults(
  elevation: 10.0,
  borderRadius: 50.0,
  borderColor: color,
  borderWidth: 2.0,
  labelColor: color,
  bgColor: Colors.white,
  widthFactor: width,
);

UIButtonDefaults darkButtonStyle({double width = 0.5, Color color = Colors.indigo}) => UIButtonDefaults(
  elevation: 10.0,
  borderRadius: 50.0,
  borderColor: Colors.white,
  borderWidth: 2.0,
  labelColor: Colors.white,
  bgColor: color,
  widthFactor: width,
);

final errorContainer = UIContainerDefaults(
  padding: EdgeInsets.all(10),
  borderRadius: 10,
  widthFactor: 1.0,
  borderColor: Colors.red,
  borderWidth: 2.0,
  color: Colors.red.shade100,
);

final infoContainer = UIContainerDefaults(
  padding: EdgeInsets.all(10),
  borderRadius: 10,
  widthFactor: 1.0,
  borderColor: Colors.blue,
  borderWidth: 2.0,
  color: Colors.blue.shade100,
);

final successContainer = UIContainerDefaults(
  padding: EdgeInsets.all(10),
  borderRadius: 10,
  widthFactor: 1.0,
  borderColor: Colors.green,
  borderWidth: 2.0,
  color: Colors.green.shade100,
);

AwesomeDialog questionDialog({required BuildContext context, Function? okOnPress, Function? onCancelPress, String? title, String? description, Widget? body, Color? backgroundColor}) => AwesomeDialog(
    context: context,
    dialogType: DialogType.QUESTION,
    headerAnimationLoop: false,
    animType: AnimType.TOPSLIDE,
    title: title,
    desc: description,
    buttonsTextStyle: TextStyle(color: Colors.white),
    btnCancelOnPress: onCancelPress,
    btnOkOnPress: okOnPress,
    btnOkIcon: Icons.check_circle,
    btnOkColor: Colors.green,
    btnCancelIcon: Icons.cancel,
    btnCancelColor: Colors.red,
    keyboardAware: true,
    body: body == null ? null : Padding(padding: const EdgeInsets.all(8.0), child: body),
    dialogBackgroundColor: backgroundColor
);

AwesomeDialog infoDialog({required BuildContext context, Function? okOnPress, Function? onCancelPress, String? title, String? description, Widget? body, Color? backgroundColor}) => AwesomeDialog(
    context: context,
    dialogType: DialogType.INFO,
    headerAnimationLoop: false,
    animType: AnimType.TOPSLIDE,
    title: title,
    desc: description,
    buttonsTextStyle: TextStyle(color: Colors.white),
    btnCancelOnPress: onCancelPress,
    btnOkOnPress: okOnPress,
    btnOkIcon: Icons.check_circle,
    btnOkColor: Colors.green,
    btnCancelIcon: Icons.cancel,
    btnCancelColor: Colors.red,
    keyboardAware: true,
    body: body == null ? null : Padding(padding: const EdgeInsets.all(8.0), child: body),
    dialogBackgroundColor: backgroundColor
);

AwesomeDialog warningDialog({required BuildContext context, Function? okOnPress, Function? onCancelPress, String? title, String? description, Widget? body, Color? backgroundColor}) => AwesomeDialog(
    context: context,
    dialogType: DialogType.WARNING,
    headerAnimationLoop: false,
    animType: AnimType.TOPSLIDE,
    title: title,
    desc: description,
    buttonsTextStyle: TextStyle(color: Colors.white),
    btnCancelOnPress: onCancelPress,
    btnOkOnPress: okOnPress,
    btnOkIcon: Icons.check_circle,
    btnOkColor: Colors.green,
    btnCancelIcon: Icons.cancel,
    btnCancelColor: Colors.red,
    body: body == null ? null : Padding(padding: const EdgeInsets.all(8.0), child: body),
    dialogBackgroundColor: backgroundColor
);

AwesomeDialog errorDialog({required BuildContext context, Function? okOnPress, String? title, String? description, Widget? body, Color? backgroundColor}) => AwesomeDialog(
    context: context,
    dialogType: DialogType.ERROR,
    headerAnimationLoop: false,
    animType: AnimType.TOPSLIDE,
    title: title,
    desc: description,
    buttonsTextStyle: TextStyle(color: Colors.white),
    btnOkOnPress: okOnPress,
    btnOkIcon: Icons.cancel,
    btnOkColor: Colors.red,
    body: body == null ? null : Padding(padding: const EdgeInsets.all(8.0), child: body),
    dialogBackgroundColor: backgroundColor
);

AwesomeDialog successDialog({required BuildContext context, Function? okOnPress, String? title, String? description, Widget? body, Color? backgroundColor}) => AwesomeDialog(
    context: context,
    dialogType: DialogType.SUCCES,
    headerAnimationLoop: false,
    animType: AnimType.TOPSLIDE,
    title: title,
    desc: description,
    buttonsTextStyle: TextStyle(color: Colors.white),
    btnOkOnPress: okOnPress,
    btnOkIcon: Icons.check_circle,
    btnOkColor: Colors.green,
    body: body == null ? null : Padding(padding: const EdgeInsets.all(8.0), child: body),
    dialogBackgroundColor: backgroundColor
);

//progress button success state
IconedButton successPB = IconedButton(
    text: "Success",
    icon: Icon(Icons.check_circle,color: Colors.white,),
    color: Colors.green.shade400
);

//progress button failed state
IconedButton failedPB = IconedButton(
    text: "Failed",
    icon: Icon(Icons.cancel,color: Colors.white),
    color: Colors.red.shade300
);

Future<void> bottomSheet({required BuildContext context, bool hideHead = false, bool floatted = true, required Widget child} ) async {
  await UIBottomSheet.show(
    context: context,
    floatted: true,
    hideHead: false,
    content: child,
  );
}

Widget textInput({String? label, Color color = Colors.white, IconData? icon, double? borderRadius, TextEditingController? controller, int? minLines, int? maxLines, bool autofocus = true, bool obscureText = false, void Function(String)? onChanged, void Function()? onTap, void Function()? onEditingComplete, void Function(String)? onFieldSubmitted, void Function(String?)? onSaved, String? Function(String?)? validator, List<TextInputFormatter>? inputFormatters, bool? enabled}) => Material(
  elevation: 0,
  color: color,
  borderRadius:  borderRadius == null ? null : BorderRadius.all(Radius.circular(borderRadius)),
  child: TextFormField(
    autofocus: autofocus,
    controller: controller,
    minLines: minLines,
    maxLines: maxLines,
    obscureText: obscureText,
    onChanged: onChanged,
    onTap: onTap,
    onEditingComplete: onEditingComplete,
    onFieldSubmitted: onFieldSubmitted,
    onSaved: onSaved,
    validator: validator,
    inputFormatters: inputFormatters,
    enabled: enabled,
    style: TextStyle(fontSize: 16),
    decoration: InputDecoration(
      border: InputBorder.none,
      labelText: label,
      prefixIcon: icon == null ? null : Icon(icon),
      contentPadding: EdgeInsets.all(16),
      errorStyle: TextStyle(height: 0), //will not display error message
    ),
  ),
);


class ClickyButton extends StatefulWidget {
  final Duration _duration = const Duration(milliseconds: 70);
  final Widget child;
  final MaterialColor color;
  final GestureTapCallback onPressed;

  const ClickyButton({
    Key ? key,
    required this.child,
    this.color = Colors.green,
    required this.onPressed,
  })  : assert(onPressed != null),
        assert(child != null),
        super(key: key);

  @override
  _ClickyButtonState createState() => _ClickyButtonState();
}

class _ClickyButtonState extends State<ClickyButton> {
  double _faceLeft = 20.0;
  double _faceTop = 0.0;
  double _sideWidth = 20.0;
  double _bottomHeight = 20.0;
  Curve _curve = Curves.ease;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220.0,
      height: 80.0,
      child: GestureDetector(
        child: Stack(
          children: <Widget>[
            Positioned(
              child: Transform(
                origin: Offset(20, 0),
                transform: Matrix4.skewY(-0.79),
                child: AnimatedContainer(
                  duration: widget._duration,
                  curve: _curve,
                  width: _sideWidth,
                  height: 60.0,
                  color: widget.color[800],
                ),
              ),
              top: 0.2,
            ),
            Positioned(
              child: Transform(
                transform: Matrix4.skewX(-0.8),
                child: Transform(
                  origin: Offset(100, 10),
                  transform: Matrix4.rotationZ(math.pi),
                  child: AnimatedContainer(
                    duration: widget._duration,
                    curve: _curve,
                    width: 200.0,
                    height: _bottomHeight,
                    color: widget.color[800],
                  ),
                ),
              ),
              top: 60.0,
              left: 20.1,
            ),
            AnimatedPositioned(
              duration: widget._duration,
              curve: _curve,
              child: Container(
                alignment: Alignment.center,
                width: 200.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: widget.color,
                  border: Border.all(color: widget.color[800]!, width: 1),
                ),
                child: widget.child,
              ),
              left: _faceLeft,
              top: _faceTop,
            ),
          ],
        ),
        onTapDown: _pressed,
        onTapUp: _unPressedOnTapUp,
        onTapCancel: _unPressed,
      ),
    );
  }

  void _pressed(_) {
    setState(() {
      _faceLeft = 0.0;
      _faceTop = 20.0;
      _sideWidth = 0.0;
      _bottomHeight = 0.0;
    });
    widget.onPressed();
  }

  void _unPressedOnTapUp(_) => _unPressed();

  void _unPressed() {
    setState(() {
      _faceLeft = 20.0;
      _faceTop = 0.0;
      _sideWidth = 20.0;
      _bottomHeight = 20.0;
    });
  }
}