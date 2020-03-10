import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:md2_tab_indicator/md2_tab_indicator.dart';
import 'package:sharpnote/src/widgets/recordings.dart' as recordings;

class ListItem extends StatelessWidget {
  const ListItem({
    this.title,
    this.date,
  });

  final String title;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: _ItemDescription(),
          )
        ],
      ),
    );
  }
}

class _ItemDescription extends StatelessWidget {
  const _ItemDescription({
    Key key,
    this.title,
    this.date,
  }) : super(key: key);

  final String title;
  final String date;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
        child: Stack(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 5.0, top: 15.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 18.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0, top: 25.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  date,
                  style:
                      const TextStyle(fontSize: 13.0, color: Color(0xFF707070)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0, top: 18.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.more_horiz,
                  size: 35.0,
                  color: Color(0xFFD1D1D1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StatelessListView extends StatelessWidget {
  StatelessListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      itemExtent: 75.0,
      children: <Widget>[
        _ItemDescription(
          title: 'Möte med Lisa',
          date: '14 dec 2018.',
        ),
      ],
    );
  }
}

class Record extends StatefulWidget {
  Record({Key key}) : super(key: key);

  _RecordState createState() => _RecordState();
}

class _RecordState extends State<Record> with SingleTickerProviderStateMixin {
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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: new Container(
          alignment: Alignment.centerLeft,
          child: new AppBar(
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
        children: <Widget>[
          new recordings.Recordings(),
        ],
      ),
    );
  }
}
