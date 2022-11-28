import 'package:flutter/material.dart';

class SwapBlock extends StatefulWidget {
  const SwapBlock({Key? key}) : super(key: key);

  @override
  State<SwapBlock> createState() => SwapBlockState();
}

class SwapBlockState extends State<SwapBlock> {
  @override
  Widget build(BuildContext context) {
    var padding = MediaQuery.of(context).padding;
    var mediaQuerySize = MediaQuery.of(context).size;
    var safeHeight = mediaQuerySize.height - padding.bottom - padding.top;
    return OrientationBuilder(builder: (context, orientation) {
      return Align(
          alignment: Alignment.topCenter,
          child: Container(
            color: Colors.black,
            width: double.infinity,
            height: orientation == Orientation.landscape
                ? safeHeight
                : safeHeight / 2,
          ));
    });
  }
}
