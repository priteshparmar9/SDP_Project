import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cool_dropdown/cool_dropdown.dart';

class AddFlight extends StatelessWidget {
  // const AddFlight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        title: Text(
          "Add Flight",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: StateFulAddFlight(),
    );
  }
}

class StateFulAddFlight extends StatefulWidget {
  // const StateFulAddFlight({Key? key}) : super(key: key);

  @override
  State<StateFulAddFlight> createState() => _StateFulAddFlightState();
}

class _StateFulAddFlightState extends State<StateFulAddFlight> {
  TextEditingController dateCtl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    var dropdownItemList = [
      {
        'label': 'Air India',
        'value': 'aindia',
        'icon': Container(
          // if you want to use icon, you have to declare key as 'icon'
          key: UniqueKey(), // you have to use UniqueKey()
          height: 40,
          width: 40,
          child: Image.asset("assets/images/Air India.png"),
        ),
      }, // label is required and unique
      {
        'label': 'Vistara',
        'value': 'vistara',
        'icon': Container(
          // if you want to use icon, you have to declare key as 'icon'
          key: UniqueKey(), // you have to use UniqueKey()
          height: 40,
          width: 40,
          child: Image.asset("assets/images/Vistara.png"),
        ),
      },
      {
        'label': 'Emirates',
        'value': 'emirates',
        'icon': Container(
          // if you want to use icon, you have to declare key as 'icon'
          key: UniqueKey(), // you have to use UniqueKey()
          height: 40,
          width: 40,
          child: Image.asset("assets/images/emirates.png"),
        ),
      },
      {'label': 'None of Above', 'value': 'non'},
    ];

    return Scaffold(
      body: Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     fit: BoxFit.fill,
        //     image: AssetImage("assets/images/background.jpeg"),
        //   )
        // ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Add Flight",
                  style: TextStyle(
                    fontSize: w * 0.075,
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.fromLTRB(w * 0.06, h * 0.01, w * 0.06, h * 0.01),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(0, 0, 255, 1),
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    labelText: "Source",
                    labelStyle: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.fromLTRB(w * 0.06, h * 0.01, w * 0.06, h * 0.01),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(0, 0, 255, 1),
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    labelText: "Destination",
                    labelStyle: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.fromLTRB(w * 0.06, h * 0.01, w * 0.06, h * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Company: ",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    CoolDropdown(
                      dropdownList: dropdownItemList,
                      onChange: (_) {},
                      defaultValue: dropdownItemList[3],
                      dropdownHeight: h * 0.33,
                      dropdownItemHeight: h * 0.07,
                      // placeholder: 'insert...',
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.fromLTRB(w * 0.06, h * 0.01, w * 0.06, h * 0.01),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(0, 0, 255, 1),
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    labelText: "Flight ID",
                    labelStyle: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.fromLTRB(w * 0.06, h * 0.01, w * 0.06, h * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Image(image: AssetImage("assets/images/Gif1.gif"),
                    //   width: 1*w,
                    // ),
                    Column(
                      children: [
                        Text(
                          "Economy class",
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: w * 0.42,
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: "Seats",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: w * 0.42,
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: "Price",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        )
                        // Field
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Business Class",
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: w * 0.42,
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: "Seats",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: w * 0.42,
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: "Price",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(
                      w * 0.06, h * 0.01, w * 0.06, h * 0.01),
                  child: TextFormField(
                    controller: dateCtl,
                    decoration: InputDecoration(
                      labelText: "Date of flight",
                      border: OutlineInputBorder(),
                    ),
                    onTap: () async {
                      DateTime? date = DateTime(1900);
                      FocusScope.of(context).requestFocus(new FocusNode());

                      date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100));

                      dateCtl.text = date.toString();
                    },
                  )
                  // child:showTimePicker(context: context, initialTime: DateTime(2022,10,12,0,0,0,0,0,0))
                  )
            ],
          ),
        ),
      ),
    );
  }
}
