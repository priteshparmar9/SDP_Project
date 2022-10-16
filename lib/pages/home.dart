import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sdp_project/models/flights.dart';

class Home extends StatefulWidget {
  // const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Stream<List<Flight>> readFlights() => FirebaseFirestore.instance.collection('flights')
      .snapshots().map((snapshot)=>
        snapshot.docs.map((doc)=> Flight.fromJson(doc.data())).toList());

  Widget buildFlight(Flight flight) => ListTile(
      leading: CircleAvatar(child: Text( '${flight.company}')),
          title: Text(flight.source),
          subtitle: Text(flight.dateOfFlight)
  ) ;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body:
      Container(
        width: w * 0.42,
        child:
        Column(
          children: [
            StreamBuilder<List<Flight>>(
              stream: readFlights(),
              builder: ( context, snapshot) {
                if(snapshot.hasError){
                  return Text("Error occured!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!11");
                }
                else if (snapshot.hasData) {
                  final flights = snapshot.data;
                  return ListView(
                    children: flights!.map(buildFlight).toList(),
                  );
                }
                else{
                  return Center (child: CircularProgressIndicator());
                }
              }
            ),
          ],
        ),
      ),
    );
  }
}
