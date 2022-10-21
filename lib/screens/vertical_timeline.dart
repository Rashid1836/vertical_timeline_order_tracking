import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

const primaryColor1 = Color(0xff799c58);
const primaryColor2 = Color(0xffe8eee2);
const primaryColor3 = Color(0xfff4f7f1);
const primaryColor4 = Color(0xffbfd1ae);
const primaryColor5 = Color(0xffe8eee2);

class VerticalTimeline extends StatefulWidget {
  const VerticalTimeline({Key? key}) : super(key: key);

  @override
  State<VerticalTimeline> createState() => _VerticalTimelineState();
}

class _VerticalTimelineState extends State<VerticalTimeline> {
  List steps = [
    {"title": "Order Placed", "done": true},
    {"title": "Order Confirmed", "done": true},
    {"title": "Order in Progress", "done": false},
    {"title": "Order on the Way", "done": false},
    {"title": "Order Delivered", "done": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vertical Timeline"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: 300, width: 500,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                blurRadius: 10,
                // spreadRadius: 10,
                color: primaryColor5,
              ),
            ],
          ),
          margin: const EdgeInsets.symmetric(horizontal: 60),
          // color: Colors.red.withOpacity(0.2),
          // width: MediaQuery.of(context).size.width * 0.5,
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: steps.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 42,
                    child: TimelineTile(
                      isFirst: index == 0 ? true : false,
                      isLast: index == steps.length - 1 ? true : false,
                      beforeLineStyle:
                          steps[index]["done"] || steps[index - 1]["done"]
                              ? const LineStyle(
                                  color: primaryColor1, thickness: 1.5)
                              : const LineStyle(
                                  color: primaryColor2, thickness: 1.5),
                      afterLineStyle: steps[index]["done"]
                          ? const LineStyle(
                              color: primaryColor1, thickness: 1.5)
                          : const LineStyle(
                              color: primaryColor2, thickness: 1.5),
                      endChild: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          steps[index]["title"],
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: steps[index]["done"]
                                ? primaryColor4
                                : steps[index - 1]["done"]
                                    ? primaryColor1
                                    : primaryColor4,
                          ),
                        ),
                      ),
                      indicatorStyle: IndicatorStyle(
                        color: Colors.red,
                        indicator: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: steps[index]["done"] ||
                                        steps[index - 1]["done"]
                                    ? primaryColor1
                                    : primaryColor2,
                                width: 1.5),
                            color: steps[index]["done"]
                                ? primaryColor1
                                : steps[index - 1]["done"]
                                    ? Colors.white
                                    : primaryColor3,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Visibility(
                            visible: steps[index]["done"],
                            child: const Center(
                              child: Icon(
                                Icons.done_rounded,
                                size: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
