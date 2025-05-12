import 'package:flutter/material.dart';
import 'package:varkkeys_app/src/core/theme/colors.dart';

class AppBtn extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;

  const AppBtn({super.key, required this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: AppColors.buttonShadowColor,
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
