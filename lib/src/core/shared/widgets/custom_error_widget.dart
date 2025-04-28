import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final VoidCallback? onTap;
  const CustomErrorWidget({this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: IconButton(
      icon: const Icon(Icons.refresh),
      onPressed: onTap,
      iconSize: 24,
    ));
  }
}
