import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sdp_project/Services/controller.dart';
import 'package:sdp_project/models/flights.dart';

class BookNow extends StatefulWidget {
  // const BookNow({Key? key}) : super(key: key);

  @override
  State<BookNow> createState() => _BookNowState();
}

enum ClassOfFlight {business, economy}

class _BookNowState extends State<BookNow> {

  ClassOfFlight _class = ClassOfFlight.business;
  TextEditingController cmpCtl = TextEditingController();

  Controller ctrl = new Controller();
  num price = 0;
  num final_price = 0;
  num no_of_people = 1;

  @override
  Widget build(BuildContext context) {

    var dropdownItemList = [
      {
        'label': '1',
        'value': '1',
      },
      {
        'label': '2',
        'value': '2',
      },
      {
        'label': '3',
        'value': '3',
      },
      {
        'label': '4',
        'value': '4',
      },
      {
        'label': '5',
        'value': '5',
      }
    ];

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    Flight flight = ctrl.getFlightId();
    bool? isBusiness = true;

    @override
    void initState(){
      super.initState();
      price = int.parse(flight.bus_price);
      final_price = price;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Book Now',
        ),
      ),
      body: (flight == null)
          ? Text('No flights found')
          : Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Source',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(17),
                              border: Border.all(
                                width: 3,
                                color: Colors.blue,
                              ),

                          ),
                        ),
                        Text(
                          ' : ${flight.source}',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Destination',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17),
                            border: Border.all(
                              width: 3,
                              color: Colors.blue,
                            ),

                          ),
                        ),
                        Text(
                          ' : ${flight.destination}',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                      height: 70,
                      child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: ListTile(
                                  title: const Text('Business Class'),
                                  leading: Radio(
                                    value: ClassOfFlight.business,
                                    groupValue: _class,
                                    onChanged: (value) {
                                      setState(() {
                                        isBusiness = true;
                                        _class = ClassOfFlight.business;
                                        price = int.parse(flight.bus_price);
                                        final_price = price*no_of_people;
                                        print(price);
                                      });
                                    }),
                                ),
                              ),
                              Expanded(
                                child: ListTile(
                                  title: const Text('Economy Class'),
                                  leading: Radio(
                                      value: ClassOfFlight.economy,
                                      groupValue: _class,
                                      onChanged: (value) {
                                        setState(() {
                                          isBusiness = false;
                                          _class = ClassOfFlight.economy;
                                          price = int.parse(flight.eco_price);
                                          final_price = price*no_of_people;
                                          print(price);
                                        });
                                      }),
                                  ),
                              ),
                            ],
                          )

                      ),
                    ),
                  Padding(
                      padding: EdgeInsets.all(0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Price ',
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(17),
                                    border: Border.all(
                                      width: 3,
                                      color: Colors.blue,
                                    ),

                                  ),
                                ),
                                Text(
                                  ' : $price',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'No of People : ',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      CoolDropdown(
                        dropdownList: dropdownItemList,

                        onChange: (value) {
                          cmpCtl.text = value["label"];
                          setState(() {
                            no_of_people = int.parse(value['value']);
                            final_price = price*no_of_people;
                          });
                        },
                        defaultValue: dropdownItemList[0],
                        dropdownHeight: h * 0.33,
                        dropdownItemHeight: h * 0.07,
                        // placeholder: 'insert...',
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Total ',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17),
                            border: Border.all(
                              width: 3,
                              color: Colors.blue,
                            ),

                          ),
                        ),
                        Text(
                          ' : ${final_price}',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
    );
  }
}