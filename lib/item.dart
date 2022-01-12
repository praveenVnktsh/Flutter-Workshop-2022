import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cart.dart';

class MyItemPage extends StatefulWidget {
  const MyItemPage({Key? key}) : super(key: key);

  @override
  State<MyItemPage> createState() => _MyItemPageState();
}

class _MyItemPageState extends State<MyItemPage> {
  int _itemCount = 1;
  String fullname = "Team InsIIT";
  String email = "team.insiit@iitgn.ac.in";
  Color alphaWhite200 = Colors.white.withAlpha(200);
  Color lightGreen = Color(0xFF73cdbb);
  Color darkGreen = Color(0xFF1ca3a6);

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
                      fullname.substring(0, 1), //add insiit image here.
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
                  onTap: () {
                     Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MyCartPage()),
                    );
                  }),
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
          toolbarHeight: 60,
          leading: Padding(
            padding: const EdgeInsets.only(left: 16, top: 16),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back, color: Colors.grey[600])),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16, top: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: SizedBox(
                  width: 40,
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const MyCartPage()),
                        );
                      },
                      icon: Icon(Icons.shopping_bag_outlined, color: Colors.grey[600])),
                ),
              ),
            )
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
          // title: Text("SDFSDf"),
          // centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(8, 36, 8, 8),
          child: Column(
            children: [
              ClipRRect(
                borderRadius:
                    BorderRadius.circular(20.0),
                child: Image.network(
                    'https://res.cloudinary.com/swiggy/image/upload/f_auto,q_auto,fl_lossy/zy6ymtixm4vtjuhakijm'
                )
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Masala Dosa",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                            color: Colors.black.withAlpha(200)),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[100]
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.remove_circle,
                              color: Colors.orange,
                            )
                          ),
                          Text(
                            _itemCount.toString(),
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.black.withAlpha(200)),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.add_circle,
                              color: Colors.orange,
                            )
                          )

                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: Row(
                  children: [
                    const Icon(
                      Icons.star_rounded,
                      color: Colors.orange,
                    ),
                    Text("4.7",
                      style: GoogleFonts.inter(
                        fontWeight:
                            FontWeight.w600,
                      )
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: Row(
                  children: [
                    Text(
                      "Description",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      )
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        "Masala Dosa is very tasty. Order now! Masala Dosa is very tasty. Order now! Masala Dosa is very tasty. Order now!",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.normal,
                          fontSize: 18,
                          color: Colors.grey[600]
                        )
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyCartPage()),
            );
          },
          child: const Icon(Icons.add_shopping_cart),
          elevation: 1,
          tooltip: "Add to cart",
          backgroundColor: darkGreen,
          foregroundColor: Colors.white,
        ),
      );
  }
}
