import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../ui_helper.dart';
import '../icon/custom_icon.dart';
import 'platform_button.dart';

//TODO: Config according to designs

class CustomButton {
  ///Expanded Full Width Button
  ///
  ///Customizable with custom width
  ///
  ///[Default isLoading is false]
  static Widget expanded({
    required BuildContext context,
    required String text,
    required VoidCallback onPressed,
    bool isLoading = false,
    double? width,
  }) {
    return PlatformButton(
      width: width ?? double.infinity,
      backgroundColor: Colors.black,
      height: rh(40),
      padding: EdgeInsets.symmetric(horizontal: rw(8), vertical: rh(8)),
      borderRadius: BorderRadius.circular(0),
      onPressed: isLoading ? () {} : onPressed,
      child: isLoading
          ? const CircularProgressIndicator()
          : Text(
              text.toUpperCase(),
              style: Theme.of(context).textTheme.button!.copyWith(
                    color: Colors.white,
                    letterSpacing: 3,
                    fontWeight: FontWeight.w800,
                  ),
            ),
    );
  }

  ///Expanded Full Width Button
  ///
  ///Customizable with custom width
  ///
  ///[Default isLoading is false]
  static Widget expandedWithIcon({
    required BuildContext context,
    required String text,
    required IconData icon,
    required VoidCallback onPressed,
    bool isLoading = false,
    double? width,
  }) {
    return PlatformButton(
      width: width ?? double.infinity,
      padding: EdgeInsets.symmetric(horizontal: rw(8), vertical: rh(8)),
      backgroundColor: Theme.of(context).primaryColorDark,
      borderRadius: BorderRadius.circular(5),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.button,
          ),
          if (isLoading)
            const CircularProgressIndicator()
          else
            Icon(
              icon,
            ),
        ],
      ),
    );
  }

  ///Flexible button
  ///
  ///[Default isLoading is false]
  static Widget flexible({
    required BuildContext context,
    required String text,
    required VoidCallback onPressed,
    bool isLoading = false,
  }) {
    return PlatformButton(
      backgroundColor: Theme.of(context).primaryColorDark,
      borderRadius: BorderRadius.circular(5),
      padding: EdgeInsets.symmetric(horizontal: rw(8), vertical: rh(8)),
      onPressed: isLoading ? () {} : onPressed,
      child: isLoading
          ? const CircularProgressIndicator()
          : Text(
              text,
              style: Theme.of(context).textTheme.button,
            ),
    );
  }

  ///Expanded Full Width Button
  ///
  ///[Default isLoading is false]
  static Widget icon({
    required BuildContext context,
    required IconData icon,
    required String semanticLabel,
    required VoidCallback onPressed,
    Color? iconColor,
    bool isLoading = false,
    EdgeInsets? padding,
  }) {
    return PlatformButton(
      borderRadius: BorderRadius.circular(5),
      padding: padding ?? const EdgeInsets.all(0),
      onPressed: isLoading ? () {} : onPressed,
      child: isLoading
          ? const CircularProgressIndicator()
          : CustomIcon.fromMaterial(
              icon: icon,
              color: iconColor,
              semanticLabel: semanticLabel,
            ),
    );
  }

  ///Normal Text Button with default 8 padding
  ///
  ///[Default isLoading is false]
  static Widget text({
    required BuildContext context,
    required String text,
    required VoidCallback onPressed,
    bool isLoading = false,
  }) {
    return PlatformButton(
      padding: EdgeInsets.symmetric(horizontal: rw(8), vertical: rh(8)),
      borderRadius: BorderRadius.circular(5),
      onPressed: isLoading ? () {} : onPressed,
      child: isLoading
          ? const CircularProgressIndicator()
          : Text(
              text,
              style: Theme.of(context).textTheme.button,
            ),
    );
  }
}
