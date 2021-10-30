import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

import 'package:unusable_player/unusable_player.dart' as up;

//TODO: redesign card

class AlbumCard extends StatelessWidget {
  const AlbumCard({
    required this.album,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final up.Album album;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return up.DoubleBottomCard(
      onTap: onTap,
      bottomHorizontalPadding: up.Dimensions.space5,
      padding: const EdgeInsets.all(up.Dimensions.space5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const up.Image.h2(
            AssetImage("assets/skeler.jpg"),
          ),
          Padding(
            padding: const EdgeInsets.all(up.Dimensions.space5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: context.bodyText2(
                        "${album.songNumber} songs",
                        softWrap: false,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                    const up.Space5.w(),
                    const Icon(up.Icons.play_circle_filled),
                  ],
                ),
                context.headline4(
                  album.artist.name,
                  softWrap: false,
                  overflow: TextOverflow.fade,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}