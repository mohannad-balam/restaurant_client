import '../../../../../core/utils/screens.dart';
import '../../../../core/constant/ui_values.dart';
import 'package:flutter/material.dart';
import 'package:screentasia/screentasia.dart';

class MainButton extends StatelessWidget {
  const MainButton(
      {super.key,
      required this.title,
      required this.onPressed,
      this.width,
      this.height,
      required this.borderStyle,
      this.color});
  final String title;
  final Function()? onPressed;
  final bool borderStyle;
  final double? width;
  final double? height;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          disabledBackgroundColor: borderStyle
              ? Theme.of(context).scaffoldBackgroundColor
              : color ?? color ?? Theme.of(context).colorScheme.primary,
          backgroundColor: borderStyle
              ? Theme.of(context).scaffoldBackgroundColor
              : color ?? color ?? Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(UIValues.radius),
              side: BorderSide(
                  color: color ?? Theme.of(context).colorScheme.primary,
                  width: 2.5)),
        ),
        child: 
        // AutoRouter.of(context).current.path == InitPageRoute.name &&
                context.isMobile 
            ? Center(
                child: Text(
                  title,
                  style: TextStyle(
                      color: borderStyle
                          ? color ?? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.secondary,
                      fontSize:    13.sp,
                      fontWeight: FontWeight.bold),
                ),
              )
            :context.isTablet ?
            Center(
                child: Text(
                  title,
                  style: TextStyle(
                      color: borderStyle
                          ? color ?? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.secondary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ):Center(
                child: Text(
                  title,
                  style: TextStyle(
                      color: borderStyle
                          ? color ?? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.secondary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              )
          
    
      ),
    );
  }
}
