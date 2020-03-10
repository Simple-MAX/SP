import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:sharpnote/src/widgets/files.dart' as files;
import 'package:sharpnote/src/widgets/shared_files.dart' as shared_files;
import 'package:md2_tab_indicator/md2_tab_indicator.dart';

class Recordings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new RecordingsSubTab();
  }
}

class RecordingsSubTab extends StatefulWidget {
  @override
  RecordingsSubTabState createState() => new RecordingsSubTabState();
}

class RecordingsSubTabState extends State<RecordingsSubTab>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          titleSpacing: 5,
          elevation: 0.0,
          backgroundColor: Color(0xFF1D1A30),
          title: new Container(
            alignment: Alignment.topLeft,
            child: new TabBar(
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
              indicatorWeight: 10.0,
              indicatorSize: TabBarIndicatorSize.label, //makes it better
              labelColor: Color(0xFFFFFFFF),
              unselectedLabelColor: Color(0xFF8D8D8D), //niceish grey
              isScrollable: true, //up to your taste
              indicator: MD2Indicator(
                  //it begins here
                  indicatorHeight: 6,
                  //indicatorColor: Color(0xff1a73e8),
                  indicatorColor: Color(0xFFFFFFFF),
                  indicatorSize:
                      MD2IndicatorSize.full //3 different modes tiny-normal-full
                  ),
              controller: controller,
              tabs: <Widget>[
                new Container(
                  alignment: Alignment.topLeft,
                  child: new Tab(
                    text: 'Files',
                  ),
                ),
                new Container(
                  alignment: Alignment.topLeft,
                  child: new Tab(
                    text: 'Shared files',
                  ),
                ),
              ],
            ),
          )),
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new files.Files(),
          new shared_files.SharedFiles(),
        ],
      ),
    );
  }
}
