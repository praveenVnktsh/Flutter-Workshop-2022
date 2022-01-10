import 'package:flutter/material.dart';

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
        drawer: Drawer(
          elevation: 0,
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text(
                      fullname.substring(0, 1),
                      style: TextStyle(fontSize: 35, color: Colors.black87),
                    ),
                  ),
                  accountName: Text(fullname,
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  accountEmail: Text(email,
                      style: TextStyle(fontSize: 15, color: Colors.white))),
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
          centerTitle: true,
          title: const Text("Food Ordering App",
              style: TextStyle(fontSize: 18, color: Colors.white)),
          elevation: 1,
        ),
        body: Container(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          mini: true,
          child: Container(child: Icon(Icons.add_shopping_cart)),
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
