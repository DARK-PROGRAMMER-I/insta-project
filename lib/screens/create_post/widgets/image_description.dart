part of '../post_info_screen.dart';


class ImageAndDescription extends StatelessWidget {
   ImageAndDescription({Key? key}) : super(key: key);
  TextEditingController desCtr = TextEditingController();
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
        TextFormField(
          controller:desCtr ,
          decoration: InputDecoration(
            hintText: 'Write a Caption'
          ),
        )

      ],
    );
  }
}
