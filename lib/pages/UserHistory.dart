import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sdp_project/Services/controller.dart';


class UserHistory extends StatefulWidget {
  // const Users({Key? key}) : super(key: key);

  @override
  State<UserHistory> createState() => _UserHistoryState();
}

class _UserHistoryState extends State<UserHistory> {
  Controller ctrl = new Controller();
  double w = 0, h = 0;
  final CollectionReference _tickets =
  FirebaseFirestore.instance.collection('tickets');

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'History',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              height: h*0.82,
              child: StreamBuilder(
                stream: _tickets.snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                  if (streamSnapshot.hasData) {

                    return
                      ListView.builder(
                        itemCount: streamSnapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          final DocumentSnapshot documentSnapshot =
                          streamSnapshot.data!.docs[index];

                          return
                            // (documentSnapshot['username']==ctrl.getLogin())?
                            Card(
                              margin: const EdgeInsets.all(10),
                              color: Color.fromRGBO(202, 240, 248, 1),
                              child:Card(
                                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                color: Color.fromRGBO(202, 240, 248, 1),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                  child: IntrinsicHeight(
                                    child: Row(
                                      children: [
                                        Column(
                                          children: [
                                            Image(
                                              image:
                                              AssetImage('assets/images/' + documentSnapshot['company'] + '.png'),
                                              height: h * 0.15,
                                              width: w * 0.25,
                                            )
                                          ],
                                        ),
                                        VerticalDivider(
                                          thickness: 2,
                                          color: Colors.blueAccent,
                                        ),
                                        Column(
                                          children: [
                                            IntrinsicHeight(
                                              child: Column(
                                                children: [
                                                  Text(
                                                    documentSnapshot['source'],
                                                    style: TextStyle(
                                                      color: Colors.blue,
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.keyboard_double_arrow_down_sharp,
                                                    size: 40,
                                                    // color: Colors,
                                                  ),
                                                  Text(
                                                    documentSnapshot['destination'],
                                                    style: TextStyle(
                                                      color: Colors.blue,
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                  Text(
                                                    documentSnapshot['dateandtime'],
                                                    style: TextStyle(
                                                      color: Colors.blue,
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'No of People : ',
                                                        style: TextStyle(
                                                          color: Colors.blue,
                                                          fontSize: 20,
                                                        ),
                                                      ),
                                                      Text(
                                                        documentSnapshot['people'].toString(),
                                                        style: TextStyle(
                                                          color: Colors.blue,
                                                          fontSize: 20,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    'Username : ',
                                                    style: TextStyle(
                                                      color: Colors.blue,
                                                      fontSize: 20,
                                                    ),
                                                  ),Text(
                                                      documentSnapshot['username'].toString(),
                                                    style: TextStyle(
                                                      color: Colors.blue,
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Divider(
                                              thickness: 2,
                                              color: Colors.black,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                          );
                          // :Text(
                          //       ''
                          //   );

                        });
                  } else {
                    return Image.asset('asset/images/Gif1.gif');
                  }
                },
              ),
            ),
            Container(
              child: InkWell(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, h * 0.01, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                        child:
                        ctrl.IsAdmin()?

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  0, h * 0.01, 0, h * 0.01),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.search,
                                    size: w * 0.09,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                            Column(children: [
                              Container(
                                child: Icon(
                                  Icons.account_circle_rounded,
                                  size: w * 0.09,
                                  color: Colors.white,
                                ),
                                color: Colors.black,
                              ),
                            ],
                            ),
                            (ctrl.IsLoggedIn() == false) ? Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, "/login");
                                  },
                                  child: Icon(
                                    Icons.login,
                                    size: w * 0.09,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ):
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, "/login");
                                  },
                                  child: Icon(
                                    Icons.logout,
                                    size: w * 0.09,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, "/addFlight");
                                  },
                                  child: Icon(
                                    Icons.add_box,
                                    size: w * 0.09,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            )
                          ],
                        ):
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  0, h * 0.01, 0, h * 0.01),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.search,
                                    size: w * 0.09,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                            Column(children: [
                              Container(
                                child: Icon(
                                  Icons.account_circle_rounded,
                                  size: w * 0.09,
                                  color: Colors.white,
                                ),
                                color: Colors.black,
                              ),
                            ]),
                            (ctrl.IsLoggedIn() == false) ? Column(
                              children: [
                                GestureDetector(
                                  onTap: () {

                                    Navigator.pushNamed(context, "/login");
                                  },
                                  child: Icon(
                                    Icons.login,
                                    size: w * 0.09,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ):
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, "/login");
                                  },
                                  child: Icon(
                                    Icons.logout,
                                    size: w * 0.09,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}