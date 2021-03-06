import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cart.dart';
import 'order/order_item_model.dart';

class MyItemPage extends StatefulWidget {
  OrderItemModel model = OrderItemModel();
  MyItemPage(OrderItemModel model) {
    this.model = model;
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
                tag: widget.model.item_id,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.network(
                      widget.model.url,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.model.item_name,
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
                                widget.model.item_quantity = _itemCount;
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
                                widget.model.item_quantity = _itemCount;
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Rs. " + widget.model.cost.toString(),
                      style: GoogleFonts.raleway(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: darkGreen,
                      ),
                    ),
                    Row(
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
                      child: Text(widget.model.description,
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
