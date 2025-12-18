import 'package:flutter/material.dart';

class MaterialWrapper extends StatelessWidget {
  const MaterialWrapper({
    super.key,
    this.color,
    this.radius,
    required this.child,
    this.onTap,
  });

  final Color? color;
  final BorderRadius? radius;
  final void Function()? onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      borderRadius: radius,
      child: InkWell(
        borderRadius: radius,
        onTap: onTap,
        child: child,
      ),
    );
  }
}
