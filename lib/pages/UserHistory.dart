import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sdp_project/Services/controller.dart';
import 'package:sdp_project/models/tickets.dart';

class UserHistory extends StatefulWidget {
  // const UserHistory({Key? key}) : super(key: key);

  @override
  State<UserHistory> createState() => _UserHistoryState();
}

class _UserHistoryState extends State<UserHistory> {

  Controller ctrl = new Controller();


  Widget buildTicket(Ticket ticket) => Card(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Color.fromRGBO(202, 240, 248, 1),
      child: Padding(
        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
        child: IntrinsicHeight(
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Image(
                    image: AssetImage(
                        'assets/images/' + ticket.company + '.png'),
                    height: h * 0.15,
                    width: w * 0.30,
                  )
                ],
              ),
              VerticalDivider(
                thickness: 2,
                color: Colors.blueAccent,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IntrinsicHeight(
                              child: Column(
                                children: [
                                  Text(
                                    ticket.source,
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 30,
                                    ),
                                  ),
                                  Icon(
                                    Icons.keyboard_double_arrow_down_sharp,
                                    size: 35,
                                    // color: Color.fromRGBO(0, 200, , 1),
                                  ),
                                  Text(
                                    ticket.destination,
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 30,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
  );

  Stream<List<Ticket>> readTickets() => FirebaseFirestore.instance
      .collection('tickets')
      .snapshots()
      .map((snapshot) =>
      snapshot.docs.map((doc) => Ticket.fromJson(doc.data())).toList());




  num w = 0, h = 0;
  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Air Liners",
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: Container(
        child:
        Column(
          children: [
            Container(
              height: h*0.82,
              child: StreamBuilder<List<Ticket>>(
                  stream: readTickets(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final tickets = snapshot.data;
                      return ListView(
                        children: tickets!.map(buildTicket).toList(),
                      );
                    } else {
                      return Center(child: Image.asset('assets/images/Gif1.gif'));
                    }
                  }),
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
                              Icon(
                                Icons.account_circle_rounded,
                                size: w * 0.09,
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
                              Icon(
                                Icons.account_circle_rounded,
                                size: w * 0.09,
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
