import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sdp_project/models/tickets.dart';

class MainPage extends StatefulWidget {
  // const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Ticket> t = [
    Ticket("Rajkot", "Mumbai", DateTime.parse("2022-10-11"), 2.5, 125, 125,
        "Air India", "AI | 656", "Available", 5500),
    Ticket("Ahmedabad", "Goa", DateTime.parse("2022-10-12"), 2.5, 125, 125,
        "Air India", "AI | 646", "Available", 3500),
    Ticket("Delhi", "Chennai", DateTime.parse("2022-10-11"), 2.5, 125, 125,
        "Vistara", "VS | 654", "Available", 5500),
  ];

  Widget ticketTemplate(ticket, w, h) {
    return Card(
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
                        AssetImage('assets/images/' + ticket.company + '.png'),
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
                    child: Row(
                      children: [
                        Text(
                          ticket.source,
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 30,
                          ),
                        ),
                        Icon(
                          Icons.arrow_right_alt,
                          size: 40,
                          // color: Colors,
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
                  Divider(
                    thickness: 2,
                    color: Colors.black,
                  ),
                  Text(
                      "Price: ₹"+ ticket.base_price.toString(),
                      style: TextStyle(
                        fontSize: 20,
                      ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Flight tickets'),
      ),
      body: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: t.map((e) => ticketTemplate(e, w, h)).toList(),
          ),
          Spacer(),
          Column(
            children: [
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
                          child: Row(
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
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(context, "/login");
                                    },
                                    child: Icon(
                                      Icons.add_chart,
                                      size: w * 0.09,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              )
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
        ],
      ),
      // bottomNavigationBar:
    );
  }
}
