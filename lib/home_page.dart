import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'progress_panel.dart';
import 'map_widget.dart';
import 'review_panel.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  PanelController _panelController ;
  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry radius = BorderRadius.only(
      topLeft: Radius.circular(34.0),
      topRight: Radius.circular(34.0),
    );
    return Scaffold(
      body: SlidingUpPanel(
          onPanelOpened: () {},
          onPanelClosed: () {},
          controller:_panelController ,
          color: Colors.orange,
          borderRadius: radius,
          minHeight: 50.0,
          maxHeight: 280.0,
          panel: ProgressPanel(),
          body: MapWidget()),


    );

  }



}
