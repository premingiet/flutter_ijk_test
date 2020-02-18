import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class ListenerWidgetVideo extends ChangeNotifier {
  //============================ GLOBAL VARIABLES =============================
  final IjkMediaController _controller = IjkMediaController();
  String _localVideo = "/storage/emulated/0/Download/zh240.mp4";
  bool _autoPlay = true;
  //xxxxxxxxxxxxxxxxxxxxxxxxxxxx GLOBAL VARIABLES xxxxxxxxxxxxxxxxxxxxxxxxxxxxx

  //================================= GETTER ==================================
  IjkMediaController get controller => _controller;
  String get localVideo => _localVideo;
  bool get autoPlay => _autoPlay;
  //xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx GETTER xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

  //================================= SETTER ==================================
  set localVideo(String localvideopath) {
    _localVideo = localvideopath;
    changeVideo(localvideopath, autoPlay);
  }

  set autoPlay(bool val) {
    _autoPlay = val;
  }
  //xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx SETTER xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

  //================================= METHODS =================================
  getPermission() async {
    PermissionStatus permission = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.storage);
    if (permission != PermissionStatus.granted) {
      Map<PermissionGroup, PermissionStatus> permissions =
          await PermissionHandler()
              .requestPermissions([PermissionGroup.storage]);
      if (permissions.values.elementAt(0) == PermissionStatus.granted) {
        debugPrint("______Permission Granted_______");
      }
    }
  }

  pickLocalFile() async {
    await getPermission();
    File file = await FilePicker.getFile();
    localVideo = file.path;
  }

  changeVideo(String val, bool autoplay) async {
    await controller.reset();
    await controller.setDataSource(DataSource.network(val), autoPlay: autoplay);
  }
  //xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx METHODS xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

  //============================== CONSTRUCTOR ================================
  ListenerWidgetVideo() {
    getPermission();
  }
  //xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx CONSTRUCTOR xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

}
