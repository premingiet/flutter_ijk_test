import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ijk_test/Listener/ListenerWidgetVideo.dart';
import 'WidgetVideo.dart';

class WidgetLaunchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ListenerWidgetVideo listen =
        Provider.of<ListenerWidgetVideo>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("Flutter Ijk Test"),
      ),
      body: Container(
        color: Colors.orange,
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    color: Colors.white54,
                    padding: EdgeInsets.all(30.0),
                    child: WidgetVideo(),
                  ),
                  Center(
                    child: RaisedButton.icon(
                      onPressed: () async{
                        debugPrint("______Browse local file______");
                        await listen.pickLocalFile();
                      },
                      icon: Icon(Icons.mouse),
                      label: Text("Choose Video"),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
