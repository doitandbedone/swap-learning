import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:swap_learning/swap_block.dart';
import 'package:swap_learning/swap_controls_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late AppLocalizations _localizations;
  bool _isFullscreen = false;

  @override
  void initState() {
    super.initState();
    // Add post draw callback
    WidgetsBinding.instance.addPostFrameCallback((_) => {
      _toggleFullscreen()
    });
  }

  @override
  Widget build(BuildContext context) {
    _localizations = AppLocalizations.of(context)!;
    return Scaffold(
        body: Center(child: _buildBody()));
  }

  Widget _buildBody() {
    return OrientationBuilder(builder: (context, orientation) {
      if (Orientation.landscape == orientation) {
        return _buildLandscape();
      } else {
        return _buildPortrait();
      }
    });
  }

  Widget _buildLandscape() {
    return Stack(
      children: const [
        SwapBlock(),
        Align(alignment: Alignment.bottomCenter, child: SwapControlsWidget())
      ],
    );
  }

  Widget _buildPortrait() {
    return Column(
      children: const [SwapBlock(), SwapControlsWidget()],
    );
  }

  _toggleFullscreen() {
    setState(() {
      _isFullscreen = !_isFullscreen;
      if (_isFullscreen) {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
      }
      else {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
      }
    });
  }
}
