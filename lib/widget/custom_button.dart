import 'package:book_collection/theme.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  const CustomButton({
    Key? key,
    required this.title,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          title,
          style: kMedium.copyWith(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
