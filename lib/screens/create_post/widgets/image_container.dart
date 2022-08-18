part of '../create_post_screen.dart';
class ImageContainer extends StatelessWidget {
  final File? file;
  final bool isFull;
  final Function()? onTap;
  ImageContainer({
    Key? key, this.file ,
    this.isFull = false,
    this.onTap

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: isFull
              ? Dimensions.pageHeight
              : Dimensions.pageHeight / 2,
          width: Dimensions.pageWidth,
          color: AppColors.mobileBackgroundColor,
          alignment: Alignment.center,
          child: Image.file(
            file!,
            height: isFull
                ? Dimensions.pageHeight
                : Dimensions.pageHeight / 2,
            width: Dimensions.pageWidth,
          ),
        ),
        if (isFull)
          Positioned(
              right: 10,
              top: 15,
              child: customCard(
                  child: IconButton(
                    icon: const Icon(
                      Icons.camera,
                      color: Colors.white,
                    ),
                    onPressed: onTap,
                  )))
      ],
    );
  }
  Widget customCard({required Widget child, Color? cardColor, double? curve}) {
    return Card(
      elevation: 5,
      color: cardColor ?? Colors.white,
      shadowColor: Colors.blueGrey.withOpacity(0.2),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(curve ?? 10.0)),
      child: child,
    );
  }
}
