import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ReviewPanel extends StatefulWidget {
  @override
  _ReviewPanelState createState() => _ReviewPanelState();
}

class _ReviewPanelState extends State<ReviewPanel> {
  double rating = 3.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 20,
          ),
          Text(
            "Mahmoud Sallam",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
          Container(
            height: 10,
          ),
          SmoothStarRating(
            size: 35,
            rating: rating,
            filledIconData: Icons.star,
            halfFilledIconData: Icons.star_half,
            allowHalfRating: true,
            color: Colors.white,
            borderColor: Colors.white,
            onRatingChanged: (value) {
              setState(() {
                rating = value;
              });
            },
          ),
          Container(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Pickup Time ",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                  ),
                  Container(
                    height: 10.0,
                  ),
                  Text(
                    "Delivery Time ",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "10:00 PM",
                    style: TextStyle(fontSize: 14.0),
                  ),
                  Container(
                    height: 10.0,
                  ),
                  Text(
                    "10:30 PM",
                    style: TextStyle(fontSize: 14.0),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                height: 60,
              ),
              Column(
                children: <Widget>[
                  Text(
                    "Total ",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    width: 180.0,
                  ),
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "\$30.00",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                      child: Center(
                          child: Text(
                        "Submit",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                      width: 100.0,
                      height: 40.0,
                      decoration: new BoxDecoration(
                          color: Colors.white,
                          borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(10.0),
                            topRight: const Radius.circular(10.0),
                            bottomLeft: const Radius.circular(10.0),
                            bottomRight: const Radius.circular(10.0),
                          ))),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
