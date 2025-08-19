import 'package:delivery_app/Core/Styles/colors.dart';
import 'package:flutter/material.dart';

class Components {
  Widget platformLoginButtons({
    required Widget child,
    required Function() onTap,
    required Icon icon,
    required bool border,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: border ? BoxBorder.all(color: Colors.black, width: 1) : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 10),
            child,
          ],
        ),
      ),
    );
  }

  Widget customButton({
    required Widget child,
    double width = double.infinity,
    double height = 60,
    required Function() onTap,
    required Color color,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(35),
        ),
        child: Center(child: child),
      ),
    );
  }

  Widget customTextFormField({
    required TextEditingController controller,
    required String? Function(String?) validator,

    required String title,
    required String hintText,
    required TextInputType keyboardType,
    required bool obscureText,
    required bool isPassword,
    required Function() onSuffixIconPressed,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: ColorsStyle.typographyColor,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 5),
        TextFormField(
          obscureText: obscureText,
          keyboardType: keyboardType,
          style: TextStyle(color: ColorsStyle.typographyColor),

          validator: validator,
          controller: controller,
          cursorColor: ColorsStyle.typographyColor,
          cursorHeight: 20,
          cursorWidth: 1.5,
          decoration: InputDecoration(
            suffixIcon: isPassword
                ? obscureText
                      ? IconButton(
                          onPressed: onSuffixIconPressed,
                          icon: Icon(
                            Icons.visibility,
                            color: ColorsStyle.grayColor,
                          ),
                        )
                      : IconButton(
                          onPressed: onSuffixIconPressed,
                          icon: Icon(
                            Icons.visibility_off,
                            color: ColorsStyle.grayColor,
                          ),
                        )
                : null,
            hintText: hintText,
            hintStyle: TextStyle(color: ColorsStyle.grayColor),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: ColorsStyle.grayColor50, width: .5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: ColorsStyle.primaryColor, width: 1),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.red, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.red, width: 1),
            ),
          ),
        ),
      ],
    );
  }
}
