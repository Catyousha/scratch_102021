import 'package:flutter/material.dart';

class PageBackground extends StatelessWidget {
  const PageBackground({
    Key? key,
    required this.imageSrc,
    required this.child,
  }) : super(key: key);
  final String imageSrc;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter: const ColorFilter.linearToSrgbGamma(),
          image: NetworkImage(imageSrc),
        ),
      ),
      child: child,
    );
  }
}
