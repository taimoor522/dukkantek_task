import 'package:flutter/cupertino.dart';

class VerticalSpacing extends StatelessWidget {
  const VerticalSpacing({Key? key, required this.height}) : super(key: key);
  final double height;
  @override
  Widget build(BuildContext context) => SizedBox(height: height);
}

class HorizontalSpacing extends StatelessWidget {
  const HorizontalSpacing({Key? key, required this.width}) : super(key: key);
  final double width;
  @override
  Widget build(BuildContext context) => SizedBox(height: width);
}
