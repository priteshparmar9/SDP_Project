import 'package:sdp_project/models/tickets.dart';

class Ticket{
  final String username;
  final String source;
  final String destination;
  final String dateandtime;
  final String company;
  final String aircraft;
  final String people;
  final String economy;

  Ticket(this.username,this.source, this.destination, this.dateandtime,this.aircraft,
      this.people ,this.company, this.economy);

  Map<String, dynamic> toJson()=>{
    'username': username,
    'source': source,
    'destination': destination,
    'dateandtime': dateandtime,
    'aircraft': aircraft,
    'people': people,
    'company': company,
    'economy': economy,
  };

  static Ticket fromJson(Map<String, dynamic> json) => Ticket (
    json['usernmae'],
    json['source'],
    json['destination'],
    json['dateandtime'],
    json['aircraft'],
    json['people'],
    json['company'],
    json['economy'],
  );

}