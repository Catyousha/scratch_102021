import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:scratch_102021/firebase_auth_scratch/shared/theme.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    this.onPressed,
    this.primary = FlexColor.darkSurface,
    this.child,
  }) : super(key: key);

  final void Function()? onPressed;
  final Color primary;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.maxFinite, 0),
        primary: primary,
        padding: const EdgeInsets.all(20.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      onPressed: onPressed ?? () {},
      child: child,
    );
  }
}
