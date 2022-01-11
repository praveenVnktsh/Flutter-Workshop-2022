import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  String fullname = "Team InsIIT";
  String email = "team.insiit@iitgn.ac.in";
  int _selectedPage = 0;
  Color alphaWhite200 = Colors.white.withAlpha(200);
  Color lightGreen = Color(0xFF73cdbb);
  Color darkGreen = Color(0xFF1ca3a6);

  Widget getPanel() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Recommended",
                style: GoogleFonts.raleway(
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                    color: Colors.black.withAlpha(200)),
              ),
              // TextButton(
              //   onPressed: () {},
              //   child:
              // )
              Text(
                "See more",
                style: GoogleFonts.comfortaa(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: darkGreen),
              ),
            ],
          ),
        ),
        Container(
          height: 200,
          color: Colors.black,
          child: ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  width: 300,
                  color: (index % 2 == 0)
                      ? Colors.grey.withAlpha(100)
                      : Colors.white.withAlpha(100),
                );
              },
              itemCount: 10,
              scrollDirection: Axis.horizontal),
        )
      ],
    );
  }

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
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.shopping_bag_outlined, color: alphaWhite200))
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
          // title: Text("SDFSDf"),
          // centerTitle: true,
        ),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                    colors: [
                      // Color(0xf0000000),
                      lightGreen,
                      darkGreen,
                    ],
                    radius: 1.3,
                    center: Alignment(-1, 0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
              ),
              height: 1000,
              width: 500,
            ),
            Positioned(
              right: 0,
              top: 150,
              child: Container(
                decoration: BoxDecoration(
                  color: lightGreen.withAlpha(50),
                  shape: BoxShape.circle,
                ),
                height: 100,
                width: 100,
              ),
            ),
            Positioned(
              right: 250,
              top: 50,
              child: Container(
                decoration: BoxDecoration(
                  color: lightGreen.withAlpha(50),
                  shape: BoxShape.circle,
                ),
                height: 200,
                width: 200,
              ),
            ),
            Padding(
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
                    height: 16,
                  ),
                  TextField(
                    style: TextStyle(color: alphaWhite200),
                    cursorColor: alphaWhite200,
                    decoration: InputDecoration(
                        focusColor: Colors.white,
                        fillColor: const Color(0x5973cdbb),
                        filled: true,
                        hintText: "Search for food",
                        hintStyle: GoogleFonts.raleway(color: alphaWhite200),
                        prefixIcon: Icon(
                          Icons.search,
                          color: alphaWhite200,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: alphaWhite200, width: 0.0),
                            borderRadius: BorderRadius.circular(15)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.white.withAlpha(255), width: 0.0),
                            borderRadius: BorderRadius.circular(15)),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.white, width: 0.0),
                            borderRadius: BorderRadius.circular(15))),
                  ),
                ],
              ),
            ),
            SlidingUpPanel(
                maxHeight: 590.0,
                minHeight: 470.0,
                boxShadow: [BoxShadow(color: Colors.transparent)],
                parallaxEnabled: true,
                parallaxOffset: .1,
                panel: getPanel(),
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
