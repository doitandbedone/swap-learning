import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SwapControlsWidget extends StatefulWidget {
  const SwapControlsWidget({super.key});

  @override
  State<StatefulWidget> createState() => SwapControlsWidgetState();
}

class SwapControlsWidgetState extends State<SwapControlsWidget> {
  late AppLocalizations _localizations;
  bool _isPlaying = false;

  @override
  Widget build(BuildContext context) {
    _localizations = AppLocalizations.of(context)!;
    return OrientationBuilder(builder: (context, orientation) {
      var color =
          orientation == Orientation.landscape ? Colors.white : Colors.black;
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () => _onButtonPressed(SwapControlsAction.back),
              icon: Icon(
                Icons.navigate_before_outlined,
                color: color,
              )),
          IconButton(
            onPressed: () => _onButtonPressed(SwapControlsAction.playPause),
            icon: _isPlaying
                ? Icon(
                    Icons.play_arrow,
                    color: color,
                  )
                : Icon(
                    Icons.pause,
                    color: color,
                  ),
          ),
          IconButton(
            onPressed: () => _onButtonPressed(SwapControlsAction.next),
            icon: Icon(
              Icons.navigate_next_outlined,
              color: color,
            ),
          )
        ],
      );
    });
  }

  _onButtonPressed(SwapControlsAction action) {
    switch (action) {
      case SwapControlsAction.playPause:
        setState(() {
          _isPlaying = !_isPlaying;
        });
        break;
      case SwapControlsAction.back:
        // TODO: Handle this case.
        break;
      case SwapControlsAction.next:
        // TODO: Handle this case.
        break;
    }
  }
}

enum SwapControlsAction { back, playPause, next }
