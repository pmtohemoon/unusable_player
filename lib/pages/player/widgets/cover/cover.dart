import 'package:flutter/material.dart';
import 'package:unusable_player/unusable_player.dart' as up;

import 'cover_animated_artwork.dart';
import 'cover_animated_dots.dart';
import 'cover_controller.dart';

export 'cover_controller.dart';

class Cover extends StatelessWidget {
  const Cover({
    required this.controller,
    this.height = 189,
    Key? key,
  }) : super(key: key);

  final double height;

  final CoverController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: GestureDetector(
        onVerticalDragEnd: controller.verticalDragEndHandle,
        onVerticalDragUpdate: controller.verticalDragHandle,
        onVerticalDragStart: controller.verticalDragStartHandle,
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, child) => Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const up.Space3(),
              Expanded(
                child: CoverAnimatedArtwork(
                  triggerThreshold: controller.triggerThreshold,
                  animation: controller.artworkAnimation,
                  artwork: controller.artwork,
                  nextArtwork: controller.nextArtwork,
                  prevArtwork: controller.prevArtwork,
                ),
              ),
              SizedBox(
                width: up.Dimensions.paddingPage + up.Dimensions.space4,
                child: Align(
                  alignment: Alignment.center,
                  child: CoverAnimatedDots(
                    height: height,
                    width: up.Dimensions.space4,
                    controller: controller.dotsController,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}