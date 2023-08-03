import 'package:flutter/material.dart';

class GameTapScreen extends StatefulWidget {
  const GameTapScreen({super.key});

  @override
  State<GameTapScreen> createState() => _GameTapScreenState();
}

class _GameTapScreenState extends State<GameTapScreen> {
  double blue = 0.0;
  double ambar = 0.0;
  String? winner = "";
  var halfScreen =
      (MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height -
          MediaQueryData.fromWindow(WidgetsBinding.instance.window)
              .viewPadding
              .top) /
          2;
  bool isBegan = false;

  @override
  void initState() {
    super.initState();
    reset();
  }

  reset() {
    setState(() {
      blue = halfScreen;
      ambar = halfScreen;
      winner = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      blue += 10;
                      if (ambar - 10 > 0) {
                        ambar -= 10;
                      // } else {
                        ambar = 0;
                        blue = halfScreen * 2;
                        winner = "blue";
                      }
                    });
                  },
                  child: Container(
                    height: blue,
                    color: Colors.blue,
                  ),
                ),
                GestureDetector(

                  onTap: () {
                    setState(() {
                      ambar += 10;
                      if (blue - 10 > 0) {
                        blue -= 10;
                      } else {
                        blue = 0;
                        ambar = halfScreen * 2;
                        winner = "Ambar";
                      }
                    });
                    print(halfScreen * 2);
                    print(ambar);
                  },
                  child: Container(
                    height: ambar,
                    color: Colors.amberAccent,
                  ),
                ),
              ],
            ),
            Visibility(
              visible: winner != "",
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Winner",
                          style: TextStyle(
                            fontSize: 40,
                          ),
                        ),
                        Text(
                          winner!.toUpperCase(),
                          style: TextStyle(
                            color: winner == "blue" ? Colors.blue : Colors.amberAccent,
                            fontSize: 40,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            reset();
                          },
                          child: Text(
                            "RESET",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: !isBegan,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "TAP",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 40,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "BATTLE",
                              style: TextStyle(
                                color: Colors.amberAccent,
                                fontSize: 40,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isBegan = true;
                            });
                          },
                          child: Text(
                            "START",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}