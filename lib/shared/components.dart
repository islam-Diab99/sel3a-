import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/shared/constants.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton(
      {Key? key,
      this.colour,
      this.title,
      required this.onPressed,
      required this.width,
      required this.height})
      : super(key: key);
  final Color? colour;
  final String? title;
  final VoidCallback onPressed;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: colour,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      onPressed: onPressed,
      minWidth: width,
      height: height,
      child: Text(title!,
          style: const TextStyle(
            color: Colors.white,
          )),
    );
  }
}

Widget defaultFormField({
  required TextEditingController controller,
  @required TextInputType? inputType,
  var suffixPressed,
  var onSubmit,
  var onChange,
  var onTap,
  String? labelText,
  var isPassword = false,
  required String? Function(String? value)? validate,
  IconData? prefix,
  IconData? suffix,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: inputType,
    onFieldSubmitted: onSubmit,
    onChanged: onChange,
    validator: validate,
    obscureText: isPassword,
    onTap: onTap,
    decoration: InputDecoration(
      suffixIcon: IconButton(
        onPressed: suffixPressed,
        icon: Icon(suffix),
      ),
      labelText: labelText,
      prefixIcon: Icon(prefix),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
    ),
  );
}

Widget defaultTextButton(
        {@required function,
        required String text,
        Color textColor = defaultColor,

        }) =>
    TextButton(
      child: Text(
        text.toUpperCase(),
        style: TextStyle(color: textColor,),


      ),
      onPressed: function,
    );

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (context) => widget),
        (Route<dynamic> route) {
      return false;
    });
void showToast(String message) => Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    textColor: Colors.white,
    timeInSecForIosWeb: 5,
    fontSize: 16);
