import 'package:flutter/material.dart';
import 'second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget
{
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text(
                "Orders", style: TextStyle(color: Colors.white, fontSize: 30)),
            titleSpacing: 00.0,
            centerTitle: true,
            toolbarHeight: 70,
            toolbarOpacity: 1,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20)),
            ),
            elevation: 0.00,
            backgroundColor: Colors.blueAccent[400],
          ),

          body: Column(
            children: [
              Divider(),
              GridView.builder(
                itemCount: 5,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return const SecondPage(title: 'SecondPage');
                                }
                                )
                            );
                          },
                          child: Container(
                              padding: const EdgeInsets.fromLTRB(
                                  30.0, 20.0, 30.0, 0.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        0.0, 8.0, 8.0, 8.0),
                                    child: Text(
                                      'Text',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.brown, fontSize: 20),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        0.0, 5.0, 8.0, 8.0),
                                    child: Text(
                                      'Answer',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.brown, fontSize: 20),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0.0, 5.0, 8.0, 8.0),
                                    child: IconButton(
                                      icon: const Icon(
                                          Icons.delete, color: Colors.brown,
                                          size: 40.0),
                                      tooltip: 'Delete',
                                      onPressed: () {},
                                    ),
                                  ),
                                ],
                              )
                          ),
                        ),

                      ],
                    ),
                  );
                },
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.red,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'Business',
                backgroundColor: Colors.green,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'School',
                backgroundColor: Colors.purple,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
                backgroundColor: Colors.pink,
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.amber[800],
            onTap: _onItemTapped,
          ),


        ));
  }}