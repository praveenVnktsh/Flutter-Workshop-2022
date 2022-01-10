import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

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

  String fullname = "Team InsIIT";
  String email = "team.insiit@iitgn.ac.in";
  int _selectedPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        drawer: Drawer(
          elevation: 0,
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text(
                      fullname.substring(0, 1),
                      style:
                          const TextStyle(fontSize: 35, color: Colors.black87),
                    ),
                  ),
                  accountName: Text(fullname,
                      style:
                          const TextStyle(fontSize: 20, color: Colors.white)),
                  accountEmail: Text(email,
                      style:
                          const TextStyle(fontSize: 15, color: Colors.white))),
              ListTile(
                title: const Text(
                  "Past Orders",
                  style: TextStyle(fontSize: 15),
                ),
                leading: const Icon(
                  Icons.list,
                ),
                onTap: () {},
              ),
              ListTile(
                  title: const Text(
                    "My Cart",
                    style: TextStyle(fontSize: 15),
                  ),
                  leading: const Icon(
                    Icons.add_shopping_cart,
                  ),
                  onTap: () {}),
              ListTile(
                  title: const Text(
                    "Feedback",
                    style: TextStyle(fontSize: 15),
                  ),
                  leading: const Icon(
                    Icons.feedback,
                  ),
                  onTap: () {}),
              const Divider(),
              ListTile(
                  title: const Text(
                    "Developers",
                    style: TextStyle(fontSize: 15),
                  ),
                  leading: const Icon(
                    Icons.account_circle,
                  ),
                  onTap: () {}),
              ListTile(
                title: const Text(
                  "Sign Out",
                  style: TextStyle(fontSize: 15),
                ),
                leading: const Icon(Icons.power_settings_new),
                // onTap: _signOut,
                onTap: () {},
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: const Icon(
            Icons.hourglass_bottom,
            color: Colors.white,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          // title: Text("SDFSDf"),
          // centerTitle: true,
        ),
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                    colors: [
                      // Color(0xf0000000),
                      Color(0xFF73cdbb),
                      Color(0xFF1ca3a6),
                    ],
                    radius: 1.3,
                    center: Alignment(-1, 0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    Text("Hungry? Delicious food is just a tap away.",
                        style: GoogleFonts.raleway(
                          fontWeight: FontWeight.bold,
                          // fontStyle: FontStyle.italic,
                          height: 1.5,
                          color: Colors.white,
                          fontSize: 23,
                        )),
                    const SizedBox(
                      height: 30,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          hintText: "Search for items",
                          hintStyle: GoogleFonts.raleway(
                              // fontStyle: FontStyle.italic,
                              ),
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 0.0),
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ],
                ),
              ),
              height: 1000,
              width: 500,
            ),
            SlidingUpPanel(
                maxHeight: 610.0,
                minHeight: 500.0,
                parallaxEnabled: true,
                parallaxOffset: .1,
                panel: Container(),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(18.0),
                    topRight: Radius.circular(18.0))),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          mini: true,
          child: Container(child: const Icon(Icons.add_shopping_cart)),
          elevation: 1,
          backgroundColor: Colors.white,
          foregroundColor: Colors.orange,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPage,
          fixedColor: Colors.orange,
          // backgroundColor: Colors.white,
          items: [
            const BottomNavigationBarItem(
                icon: Icon(Icons.search), label: 'Explore'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.store), label: 'All Stores'),
            BottomNavigationBarItem(
                icon: Stack(
                  children: const <Widget>[
                    Icon(Icons.shopping_cart),
                  ],
                ),
                label: 'Orders'),
          ],
          onTap: (int index) {
            setState(() {
              _selectedPage = 0;
            });
          },
        ));
  }
}
