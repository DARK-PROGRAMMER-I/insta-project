part of '../create_post_screen.dart';
class LoadingGif extends StatelessWidget {
  const LoadingGif({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Image(
            image: NetworkImage('https://th.bing.com/th/id/R.60e72028b41866ae64c5bd4711f81474?rik=5ed1XByDSyID5A&pid=ImgRaw&r=0'),
          ),
        ),
      ),
    );
  }
}
