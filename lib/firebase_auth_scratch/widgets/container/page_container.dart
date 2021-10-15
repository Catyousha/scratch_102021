import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class PageContainer extends StatelessWidget {
  const PageContainer({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Container(
            color: FlexColor.aquaBlueLightPrimary,
            padding: const EdgeInsets.all(18.0),
            child: child,
          ),
        ),
      ],
    );
  }
}
