import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({Key? key, required this.url}) : super(key: key);
  final String url;

  static const _buttonPadding = EdgeInsets.symmetric(vertical: 5, horizontal: 10);

  static const _textStyle = TextStyle(
    fontSize: 16,
    color: Colors.black
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image(
          image: CachedNetworkImageProvider(url),
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 10,
          right: 10,
          child: ElevatedButton(
            onPressed: (){
              print("Shared");
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              padding: _buttonPadding,
              minimumSize: Size.zero
            ),
            child: const Text("Share", style: _textStyle),
          )
        ),
        Positioned(
          top: 10,
          left: 10,
          child: ElevatedButton(
            onPressed: (){
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              padding: _buttonPadding,
              minimumSize: Size.zero
            ),
            child: const Text("Back", style: _textStyle),
          )
        ),
      ],
    );
  }
}