import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class AssetThumbnail extends StatelessWidget {
  const AssetThumbnail({
    Key? key,
    required this.asset,
    required this.onSelect,
    this.selected = false,
  }) : super(key: key);

  final AssetEntity? asset;
  final Function()? onSelect;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List?>(
      future: asset!.thumbnailData,
      builder: (_, snapshot) {
        final bytes = snapshot.data;
        if (bytes == null) return CircularProgressIndicator();
        return GestureDetector(
          onTap: onSelect,
          child: Stack(
            children: [
              Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: MemoryImage(bytes), fit: BoxFit.cover))),
              if (selected)
                Positioned(
                  top: 5,
                  right: 5,
                  child: SizedBox(
                      height: 20,
                      width: 20,
                      // child: Image.asset(GHImages.checkIcon)
                  ),
                )
            ],
          ),
        );
      },
    );
  }
}
