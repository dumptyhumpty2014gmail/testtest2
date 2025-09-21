import 'package:flutter/material.dart';

class MyImage extends StatefulWidget {
  const MyImage({super.key, this.image});
  static const double size = 50.0;
  final Image? image;

  @override
  State<MyImage> createState() => _MyImageState();
}

class _MyImageState extends State<MyImage> {
  bool isHandleHover = false;
  @override
  Widget build(BuildContext context) {
    return FocusableActionDetector(
      onShowHoverHighlight: (value) => setState(() => isHandleHover = value),
      child: Stack(
        children: [
          SizedBox(
            width: MyImage.size,
            height: MyImage.size,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(999)),
                color: Colors.grey,
                border: Border.all(color: Colors.green, width: 1, style: BorderStyle.solid, strokeAlign: BorderSide.strokeAlignOutside),
              ),
              child: const Center(child: Text('II')),
            ),
          ),
          if (widget.image != null)
            AnimatedSize(
              duration: const Duration(milliseconds: 300), //здесь не стандартные 200 мс
              curve: Curves.easeInOut,
              child: SizedBox(
                width: MyImage.size * ((isHandleHover) ? 1.15 : 1.0),
                height: MyImage.size * ((isHandleHover) ? 1.15 : 1.0),
                child: widget.image,
              ),
            ),
        ],
      ),
    );
  }
}
