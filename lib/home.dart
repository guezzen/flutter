import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/salat.dart';
import 'package:untitled1/details.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/services.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: homeState(),
      navigatorObservers: [routeObserver],
    );
  }
}

class homeState extends StatefulWidget {
  @override
  homePage createState() => homePage();
}

class homePage extends State<homeState> with WidgetsBindingObserver {
  Map<salat, bool> _showLongPressedImagesMap = {};

  late AssetsAudioPlayer assetsAudioPlayer;
  bool ra7Wla = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
    assetsAudioPlayer = AssetsAudioPlayer.newPlayer();
    assetsAudioPlayer.open(Audio("assets/maher.mp3"));
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    assetsAudioPlayer.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive) {
      assetsAudioPlayer.pause();
    } else if (state == AppLifecycleState.resumed) {
      assetsAudioPlayer.play();
    }
  }

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

  void _showSalatDetails(BuildContext context, salat salatItem) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => details(salatItem: salatItem),
      ),
    ).then((value) {
      assetsAudioPlayer.play();
    });
  }

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
                        msg: "Nombre de raka3at de " +
                            salatItem.salatName +
                            " est " +
                            salatItem.raka3atNumber.toString(),
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                    },
                    onLongPress: () {
                      _showSalatDetails(context, salatItem);
                      assetsAudioPlayer.pause();
                      setState(() {
                        ra7Wla = true;
                        print(ra7Wla);
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
                        if (_showLongPressedImagesMap[salatItem] != true)
                          Image.asset(
                            salatItem.ImagePath,
                          ),
                        if (_showLongPressedImagesMap[salatItem] == true)
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
