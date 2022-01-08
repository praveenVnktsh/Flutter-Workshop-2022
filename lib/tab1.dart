import 'package:flutter/material.dart';

class Tab1 extends StatefulWidget {
  @override
  _Tab1State createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> {
  String token = "no_token";
  var queryResults = [];
  //SpeechRecognition _speech;
  bool _speechRecognitionAvailable = false;
  bool _isListening = false;
  String transcription = '';
  var tempSearchStore = [];
  bool show_search_results = false;
  int total_no_of_items = 0;
  int no_of_shops = 0;
  bool show_items = false;
  var final_items_after_search;
  var category_list_final;
  bool isfirstfiltertrue = true;
  bool issecondfiltertrue = false;
  bool isthirdfiltertrue = false;
  bool atleastoneresultfound = false;
  String searchResultsCount = "";
  double opacityforhellothere = 1;
  FocusNode fNode = new FocusNode();
  bool FocusOnSearch = false;
  bool sortByRating = true;
  int i = 0;
  TextEditingController controllerforSearch = new TextEditingController();
  //QuerySnapshot querySnapshot;
  Widget templ = Center(child: CircularProgressIndicator());
  @override
  void initState() {
    // activateSpeechRecognizer()
    fNode.addListener(focusChange);
    setState(() {
      opacityforhellothere = 1;
    });

    super.initState();
  }

  @override
  focusChange() {
    setState(() {
      FocusOnSearch = fNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget afterSearch = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        InkWell(
            onTap: () {
              setState(() {
                isfirstfiltertrue = true;
                issecondfiltertrue = false;
                isthirdfiltertrue = false;
              });
            },
            child: ChoiceChip(
              selected: isfirstfiltertrue,
              label: Icon(Icons.fastfood),
            )),
        SizedBox(
          width: 10,
        ),
        InkWell(
            onTap: () {
              setState(() {
                isfirstfiltertrue = false;
                issecondfiltertrue = true;
                isthirdfiltertrue = false;
              });
            },
            child: ChoiceChip(
              selected: issecondfiltertrue,
              label: Text("Category"),
            )),
        SizedBox(
          width: 10,
        ),
        InkWell(
            onTap: () {
              setState(() {
                isfirstfiltertrue = false;
                issecondfiltertrue = false;
                isthirdfiltertrue = true;
              });
            },
            child: ChoiceChip(
              selected: isthirdfiltertrue,
              label: Icon(Icons.store),
            )),
      ],
    );
    Widget beforeSearch = Container(
      child: const Text(
        "Feeling hungry? You have come to the right place. Explore and enjoy delicious food here.",
        style: TextStyle(fontSize: 15, color: Colors.white),
      ),
    );
    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      backgroundColor: Color.fromRGBO(255, 230, 204, 1),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                Container(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        height: 135,
                        width: double.infinity,
                        color: Colors.orange,
                      ),
                      Positioned(
                        bottom: 50,
                        left: 80,
                        child: Container(
                            width: 400,
                            height: 400,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(400)),
                                color: Colors.orangeAccent)),
                      ),
                      Positioned(
                        bottom: 40,
                        left: -40,
                        child: Container(
                            width: 100,
                            height: 100,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(400)),
                                color: Colors.orangeAccent)),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            const Text(
                              "Hi there!",
                              style: TextStyle(
                                  fontSize: 31,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            show_search_results && show_items
                                ? InkWell(
                                    onTap: () {
                                      setState(() {});
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.orange,
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 15),
                                      child: sortByRating
                                          ? Text(
                                              "Sort By : Rating",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )
                                          : Text(
                                              "Sort By : Price",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(18, 60, 0, 0),
                          //child: show_search_results?:
                          child: AnimatedCrossFade(
                            duration: Duration(milliseconds: 250),
                            firstChild: afterSearch,
                            secondChild: beforeSearch,
                            crossFadeState: FocusOnSearch
                                ? CrossFadeState.showFirst
                                : CrossFadeState.showSecond,
                          )),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 12, right: 12, bottom: 10, top: 110),
                        child: Material(
                          elevation: 2.0,
                          borderRadius: BorderRadius.circular(10),
                          child: TextField(
                            controller: controllerforSearch,
                            focusNode: fNode,
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 18,
                            ),
                            onChanged: (val) {
                              _search(val);
                              //notify a = new notify();
                            },
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: !show_search_results
                                    ? Icon(
                                        Icons.search,
                                        color: Colors.black45,
                                        size: 30,
                                      )
                                    : InkWell(
                                        child: Icon(
                                          Icons.close,
                                          color: Colors.black45,
                                          size: 20,
                                        ),
                                        onTap: () {
                                          _search("");
                                          setState(() {
                                            controllerforSearch.text = "";
                                          });
                                        },
                                      ),
                                contentPadding: EdgeInsets.only(
                                    left: 30, right: 5, bottom: 2, top: 12),
                                /*suffixIcon: InkWell(
                                  onTap: _speechRecognitionAvailable && !_isListening
                                      ? () => start()
                                      : null,
                                  child:Container(
                                    child:  Icon(Icons.mic,size: 30,color: Colors.deepOrange,),
                                  ),
                                ),*/

                                hintText: "Search..",
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                )),
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                //show_search_results ? Container(child: Text("Searching in "+no_of_shops.toString()+" shops"+", found "+total_no_of_items.toString()+" items."),):Container(child: Text(" "),)
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.all(12),
                      child: Text(
                        "Loading...",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton({String label = "SDF"}) => Padding(
      padding: EdgeInsets.all(12.0),
      child: TextButton(
        // color: Colors.cyan.shade600,
        onPressed: () {},
        child: Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
      ));
  // void start() => _speech
  //     .listen(locale: 'en_US')
  //     .then((result) => print('_MyAppState.start => result $result'));
  // void cancel() =>
  //     _speech.cancel().then((result) => setState(() => _isListening = result));
  // void stop() => _speech.stop().then((result) {
  //   setState(() => _isListening = result);
  // });
  // void onSpeechAvailability(bool result) =>
  //     setState(() => _speechRecognitionAvailable = result);
  void onCurrentLocale(String locale) {
    //print('_MyAppState.onCurrentLocale... $locale');
  }
  void onRecognitionStarted() => setState(() => _isListening = true);
  void onRecognitionResult(String txt) {
    setState(() {
      //transcription = txt;
      controllerforSearch.text = txt;
      _search(txt);
      FocusOnSearch = true;
    });
  }

  void _search(String val) {
    String searchquery = val.toLowerCase().trim();
    if (searchquery == "") {
      setState(() {
        show_search_results = false;
      });
    } else {
      //_fetch();

      /*GetData().get().then((QuerySnapshot docs) {
        int a = docs.documents.length;
        int num=0;
        List<String> shop_usernames_list = new List(a);
        for( var i = num ; i < a; i++ ) {
          String id = docs.documents[i].documentID.toString();
          shop_usernames_list[i]=id;
          if (i == a-1){
            SetList().set(shop_usernames_list);
            setState(() {
              no_of_shops  = a;
              show_search_results = true;
            });
            int total_no_of_items = 0;
            for(String shop_username in shop_usernames_list){
              GetData().getItemData(shop_username).then((QuerySnapshot docs2){
                  int no_of_items_one_shop = docs2.documents.length;
                  total_no_of_items+=no_of_items_one_shop;
                  if() {
                  }
              });
            }
          }
        }
      });*/
    }
  }
}
