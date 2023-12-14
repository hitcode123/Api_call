import 'package:flutter/material.dart';
import 'package:internship_porject_api_call/Repository.dart';
import 'package:internship_porject_api_call/screens/DetailScreen.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  BikeItems? packet;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<BikeItems>(context).getbikedata();
// This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // TRY THIS: Try changing the color here to a specific color (to
          // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
          // change color while the other colors stay the same.
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: FutureBuilder(
            future: Provider.of<BikeItems>(context).getbikedata(),
            builder: (_, snap) {
              if (snap.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snap.connectionState == ConnectionState.done) {
                return Consumer<BikeItems>(
                    builder: (context, BikeData, child) => ListView.builder(
                          itemCount: BikeData.bikelist.length,
                          itemBuilder: (_, i) => Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => DetailScreen(
                                          Bikemodel: BikeData.bikelist[i])));
                                },
                                child: Container(
                                    child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Stack(children: [
                                      Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                  255, 229, 167, 240),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.930,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.22,
                                        ),
                                      ),
                                      Positioned(
                                          left: 13,
                                          top: 15,
                                          child: Text(
                                              BikeData.bikelist[i].displayname
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black,
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      Positioned(
                                          left: 20,
                                          bottom: 20,
                                          child: Text(
                                              "Rs." +
                                                  "  " +
                                                  BikeData
                                                      .bikelist[i].on_road_price
                                                      .toString(),
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black,
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      Positioned(
                                          right: 10,
                                          top: 12,
                                          child: Image.network(
                                            BikeData.bikelist[i].image
                                                .toString(),
                                            height: 120,
                                          ))
                                    ]),
                                    // SizedBox(width: 10),
                                  ],
                                )),
                              ),
                            ],
                          ),
                        ));
              }
              return CircularProgressIndicator();
            }));
  }
}
