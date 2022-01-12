import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cart.dart';

class MyItemPage extends StatefulWidget {
  int index = 0;
  MyItemPage(int index) {
    this.index = index;
  }

  @override
  State<MyItemPage> createState() => _MyItemPageState();
}

class _MyItemPageState extends State<MyItemPage> {
  int _itemCount = 0;
  Color alphaWhite200 = Colors.white.withAlpha(200);
  Color lightGreen = Color(0xFF73cdbb);
  Color darkGreen = Color(0xFF1ca3a6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
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
                        MaterialPageRoute(
                            builder: (context) => const MyCartPage()),
                      );
                    },
                    icon: Icon(Icons.shopping_bag_outlined,
                        color: Colors.grey[600])),
              ),
            ),
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 36, 8, 8),
          child: Column(
            children: [
              Hero(
                tag: widget.index.toString(),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.network(
                        'https://res.cloudinary.com/swiggy/image/upload/f_auto,q_auto,fl_lossy/zy6ymtixm4vtjuhakijm')),
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
                          color: Colors.grey[100]),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                _itemCount = _itemCount - 1;
                                if (_itemCount <= 0) {
                                  _itemCount = 0;
                                }
                                setState(() {});
                              },
                              icon: const Icon(
                                Icons.remove_circle,
                                color: Colors.orange,
                              )),
                          Text(
                            _itemCount.toString(),
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.black.withAlpha(200)),
                          ),
                          IconButton(
                              onPressed: () {
                                _itemCount += 1;
                                setState(() {});
                              },
                              icon: const Icon(
                                Icons.add_circle,
                                color: Colors.orange,
                              ))
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
                          fontWeight: FontWeight.w600,
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: Row(
                  children: [
                    Text("Description",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                          "Masala dosa is a variation of the popular South Indian dosa, which has its origins in Tuluva Udupi cuisine of Karnataka.[1] It is made from rice, lentils, potato, fenugreek, ghee and curry leaves, and served with chutneys and sambar. It is popular in South India,[2] it can be found in all other parts of the country[3][4] and overseas.[5][6] In South India, preparation of masala dosa varies from city to city.[3] There are variations in Masala dosa like Mysore masala dosa, Rava masala dosa, Onion masala dosa, Paper masala dosa, Cheese masala dosa etc.",
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                              color: Colors.grey[600])),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
