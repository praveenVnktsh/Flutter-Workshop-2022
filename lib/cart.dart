import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCartPage extends StatefulWidget {
  const MyCartPage({Key? key}) : super(key: key);

  @override
  State<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
  String fullname = "Team InsIIT";
  String email = "team.insiit@iitgn.ac.in";
  Color alphaWhite200 = Colors.white.withAlpha(200);
  Color lightGreen = Color(0xFF73cdbb);
  Color darkGreen = Color(0xFF1ca3a6);
  int _cartListSize = 3;

  Widget getCartList() {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: _cartListSize,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[100]),
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                          'https://res.cloudinary.com/swiggy/image/upload/f_auto,q_auto,fl_lossy/zy6ymtixm4vtjuhakijm')),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Masala Dosa",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: Colors.black.withAlpha(200),
                            )),
                        Text("2 Nos",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                              color: Colors.grey[600],
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 60,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, color: Colors.orange)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Cart", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 90, 16, 16),
        child: getCartList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.payment_rounded),
        elevation: 1,
        tooltip: "Pay and place order",
        backgroundColor: darkGreen,
        foregroundColor: Colors.white,
      ),
    );
  }
}
