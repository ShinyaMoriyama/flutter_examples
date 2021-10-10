import 'package:flutter/material.dart';
import './guide_class.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TutorialCoachMark Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, GlobalKey> guideKeyMap = {
    'keyButton': GlobalKey(),
    'keyButton1': GlobalKey(),
    'keyButton2': GlobalKey(),
    'keyButton3': GlobalKey(),
    'keyButton4': GlobalKey(),
    'keyButton5': GlobalKey(),
    'keyBottomNavigation1': GlobalKey(),
    'keyBottomNavigation2': GlobalKey(),
    'keyBottomNavigation3': GlobalKey(),
  };

  // @override
  // void initState() {
  //   // Future.delayed(Duration.zero, showTutorial);
  //   super.initState();
  //   print("before calling future delayed");
  //   Future.delayed(Duration.zero, () {
  //     print("begining of future delayed");

  //     guideClass = GuideClass(context: context);
  //     guideClass.show();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      GuideClass(guideKeyMap: guideKeyMap, context: context).show();
    });
    print("build");
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            // key: keyButton1,
            icon: Icon(Icons.add),
            onPressed: () {},
          ),
          PopupMenuButton(
            key: guideKeyMap["keyButton1"],
            icon: Icon(Icons.view_list, color: Colors.white),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text("Is this"),
              ),
              PopupMenuItem(
                child: Text("What"),
              ),
              PopupMenuItem(
                child: Text("You Want?"),
              ),
            ],
          )
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  key: guideKeyMap["keyButton"],
                  color: Colors.blue,
                  height: 100,
                  width: MediaQuery.of(context).size.width - 50,
                  child: Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      child: Icon(Icons.remove_red_eye),
                      onPressed: () {
                        // showTutorial();
                      },
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 50,
                height: 50,
                child: ElevatedButton(
                  key: guideKeyMap["keyButton2"],
                  onPressed: () {},
                  child: Container(),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: ElevatedButton(
                    key: guideKeyMap["keyButton3"],
                    onPressed: () {},
                    child: Container(),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: ElevatedButton(
                    key: guideKeyMap["keyButton4"],
                    onPressed: () {},
                    child: Container(),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: ElevatedButton(
                    key: guideKeyMap["keyButton5"],
                    onPressed: () {},
                    child: Container(),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Stack(
        children: [
          Container(
            height: 50,
            child: Row(
              children: [
                Expanded(
                    child: Center(
                  child: SizedBox(
                    key: guideKeyMap["keyBottomNavigation1"],
                    height: 40,
                    width: 40,
                  ),
                )),
                Expanded(
                    child: Center(
                  child: SizedBox(
                    key: guideKeyMap["keyBottomNavigation2"],
                    height: 40,
                    width: 40,
                  ),
                )),
                Expanded(
                  child: Center(
                    child: SizedBox(
                      key: guideKeyMap["keyBottomNavigation3"],
                      height: 40,
                      width: 40,
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'Business',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'School',
              ),
            ],
            // currentIndex: _selectedIndex,
            selectedItemColor: Colors.amber[800],
            onTap: (index) {
              print("pushed: $index");
            },
          ),
        ],
      ),
    );
  }
}
