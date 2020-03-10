import 'package:flutter/material.dart';
import 'package:sharpnote/src/widgets/listView.dart' as listView;

class SharedFiles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // dismiss the keybord
    FocusScope.of(context).requestFocus(new FocusNode());

    return new Scaffold(
      body: new Container(
        child: new Center(
          child: RefreshIndicator(
            backgroundColor: Color(0xFF201D37),
            child: new listView.StatelessListView(),
            onRefresh: () async {
              await new Future.delayed(const Duration(seconds: 1));
            },
          ),
        ),
      ),
      floatingActionButton: new Container(
        height: 70,
        width: 70,
        child: new RawMaterialButton(
          shape: new CircleBorder(),
          elevation: 3.0,
          fillColor: Colors.white,
          child: new Container(
            height: 60,
            width: 60,
            child: new RawMaterialButton(
              shape: new CircleBorder(),
              elevation: 1.0,
              fillColor: Color(0xFFF00000),
              //fillColor: Color(0xFFFD1D1D),
              onPressed: () {},
            ),
          ),
          onPressed: () {},
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      /*floatingActionButton: new FloatingActionButton(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        onPressed: () {},
        shape: CircularNotchedRectangle(),
        notchMargin: 2.0,
      ),
      */
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        notchMargin: 2.0,
        child: Container(
          height: 40,
        ),
      ),
      /*bottomNavigationBar: Opacity(
        opacity: 0.0,
        child: Container(
          decoration: BoxDecoration(
            // Box decoration takes a gradient
            gradient: LinearGradient(
              // Where the linear gradient begins and ends
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              // Add one stop for each color. Stops should increase from 0 to 1
              //stops: [0.1, 0.5, 0.7, 0.9],
              colors: [
                // Colors are easy thanks to Flutter's Colors class.
                Colors.red,
                Colors.transparent,
              ],
            ),
          ),
          child: Container(
            height: 75.0,
          ),
        ),
      ),*/
    );
  }
}
