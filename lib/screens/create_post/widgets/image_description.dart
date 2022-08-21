part of '../post_info_screen.dart';


class ImageAndDescription extends StatelessWidget {
  const ImageAndDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          color: Colors.white,
          width: Dimensions.width50,
          height: Dimensions.height50,
          child: Image.file(postProvider.imageFile!),
        ),

      ],
    );
  }
}
