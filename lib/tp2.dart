import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/salat.dart';
import 'package:fluttertoast/fluttertoast.dart';

class tp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: homeState(),
    );
  }
}

class homeState extends StatefulWidget {
  @override
  homePage createState() => homePage();
}

class homePage extends State<homeState> {
  Map<salat, bool> _showLongPressedImagesMap = {};

  List<String> SalatDetails = ["assets/tel.png", "assets/tel.png", "assets/tel.png"];

  List<salat> salawet = [
    salat(
        salatName: "salat sobh",
        raka3atNumber: 2,
        ImagePath: "assets/tel.png",
        salatDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        ImagesPath: ["assets/tel.png", "assets/tel.png", "assets/tel.png"],
        audioPath: "assets/maher.mp3"
    ),
    salat(
        salatName: "salat dohr",
        raka3atNumber: 4,
        ImagePath: "assets/tel.png",
        salatDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        ImagesPath: ["assets/tel.png", "assets/tel.png", "assets/tel.png"],
        audioPath: "assets/maher.mp3"
    ),
    salat(
        salatName: "salat asr",
        raka3atNumber: 4,
        ImagePath: "assets/tel.png",
        salatDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        ImagesPath: ["assets/tel.png", "assets/tel.png", "assets/tel.png"],
        audioPath: "assets/maher.mp3"
    ),
    salat(
        salatName: "salat maghreb",
        raka3atNumber: 3,
        ImagePath: "assets/tel.png",
        salatDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        ImagesPath: ["assets/tel.png", "assets/tel.png", "assets/tel.png"],
        audioPath: "assets/maher.mp3"
    ),
    salat(
        salatName: "salat ishaa",
        raka3atNumber: 4,
        ImagePath: "assets/tel.png",
        salatDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        ImagesPath: ["assets/tel.png", "assets/tel.png", "assets/tel.png"],
        audioPath: "assets/maher.mp3"
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              for (var salatItem in salawet)
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: GestureDetector(
                    onTap: () {
                      Fluttertoast.showToast(
                        msg: "Nombre de raka3at de " + salatItem.salatName + " est " + salatItem.raka3atNumber.toString(),
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                    },
                    onLongPress: () {
                      setState(() {
                        _showLongPressedImagesMap.clear();
                        _showLongPressedImagesMap[salatItem] = true;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          salatItem.salatName,
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.pink,
                          ),
                        ),
                        if (_showLongPressedImagesMap[salatItem] != true) ...[
                          Image.asset(
                            salatItem.ImagePath,
                          ),
                        ],
                        if (_showLongPressedImagesMap[salatItem] == true) ...[
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: salatItem.ImagesPath.map((imagePath) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    imagePath,
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                        Divider(
                          color: Colors.lightBlueAccent,
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
