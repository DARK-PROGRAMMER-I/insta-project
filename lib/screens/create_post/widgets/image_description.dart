part of '../post_info_screen.dart';


class ImageAndDescription extends StatefulWidget {
   ImageAndDescription({Key? key}) : super(key: key);

  @override
  State<ImageAndDescription> createState() => _ImageAndDescriptionState();
}

class _ImageAndDescriptionState extends State<ImageAndDescription> {
  TextEditingController desCtr = TextEditingController();

  @override
  void dispose() {
    desCtr.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        postProvider.imageFile == null ? Utils.spinKit():
        Container(
          color: Colors.white,
          width: Dimensions.width50,
          height: Dimensions.height50,
          child: Image.file(postProvider.imageFile!),
        ),
        Expanded(
          child: TextFormField(
            controller:desCtr ,
            decoration: InputDecoration(
              hintText: 'Write a Caption...',
              contentPadding: EdgeInsets.symmetric(horizontal: Dimensions.width20, vertical: Dimensions.height30),
              disabledBorder: InputBorder.none,
              enabledBorder: InputBorder.none,

            ),
            textInputAction: TextInputAction.newline,
            onChanged: (val){
              postProvider.getDesText(val);
            },
          ),
        )

      ],
    );
  }
}
