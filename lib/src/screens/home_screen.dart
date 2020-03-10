import 'package:flutter/material.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';
import 'package:sharpnote/src/widgets/recordings.dart' as recordings;

class HomeScreen extends StatelessWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainTab(),
    );
  }
}

class MainTab extends StatefulWidget {
  @override
  MainTabState createState() => new MainTabState();
}

class MainTabState extends State<MainTab> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 1);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: new Container(
          alignment: Alignment.centerLeft,
          child: new AppBar(
            titleSpacing: 5,
            elevation: 0.0,
            backgroundColor: Color(0xFF1D1A30),
            centerTitle: false,
            title: new TabBar(
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28.0,
              ),
              indicatorSize: TabBarIndicatorSize.label, //makes it better
              labelColor: Color(0xFFFFFFFF), //Google's sweet blue
              unselectedLabelColor: Color(0xFF8D8D8D), //niceish grey
              isScrollable: true, //up to your taste
              indicator: MD2Indicator(
                  //it begins here
                  indicatorHeight: 2,
                  indicatorColor: Color(0xFF1D1A30),
                  indicatorSize: MD2IndicatorSize
                      .normal //3 different modes tiny-normal-full
                  ),
              controller: controller,
              tabs: <Widget>[
                new Tab(
                  text: 'Recordings',
                ),
              ],
            ),
          ),
        ),
      ),
      body: new TabBarView(
        controller: controller,
        children: <Widget>[new recordings.Recordings()],
      ),
    );
  }
}
