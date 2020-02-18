import 'package:flutter/material.dart';
import 'package:flutter_ijk_test/Listener/ListenerWidgetVideo.dart';
import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';
import 'package:provider/provider.dart';

class WidgetVideo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child:
        Consumer<ListenerWidgetVideo>(builder: (context, listener, child) {
          return Container(
            width: 300,
            height: 200,
            child: IjkPlayer(
              mediaController: listener.controller,
            ),
          );
    }));
  }
}
