import 'package:flutter/material.dart';
import 'package:red_tangerine/utils/responsive_size.dart';

class AppBackgroundWidget extends StatelessWidget {
  const AppBackgroundWidget({super.key, required this.body, this.padding});
  final Widget body;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: ResponsiveSize.width(double.infinity),
        height: ResponsiveSize.height(double.infinity),
        padding: padding ?? EdgeInsets.symmetric(horizontal: 20),
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage(AppImages.backgroundImage),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: SafeArea(child: body),
      ),
    );
  }
}
