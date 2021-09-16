import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unusable_player/theme/theme.dart';

class Page extends StatelessWidget {
  const Page({
    this.padding = const EdgeInsets.symmetric(horizontal: AppDimensions.space2),
    this.appBar,
    this.body,
  });

  final EdgeInsetsGeometry padding;
  final PreferredSizeWidget? appBar;
  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      extendBody: true,
      backgroundColor: Get.theme.colorScheme.background,
      body: SingleChildScrollView(
        padding: padding,
        child: body,
      ),
    );
  }
}