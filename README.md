Flutter project created in Semester V for subject Smart Device Programming(SDP) by Pritesh Parmar and Rinil Parmar.
# Flight Ticket Booking App Flutter

##About Project
Our application has two types of users – admin user and normal user.

In this project, we have implemented functionalities like adding flight(for username = "admin" only!), signin, signup, home page(shows all flights), book flight page, history page. For database we have used firebase. 



## Dependencies used in project
Taken from : [pub.dev](https://pub.dev/packages)
```
dependencies:
  flutter:
    sdk: flutter
  get: ^4.6.5
  firebase_auth: ^3.11.0
  firebase_database: ^9.1.5
  cloud_firestore: ^3.1.4
  flutter_secure_storage: ^5.0.2
  cool_dropdown: ^1.4.2
  intl: any
  get_storage: ^2.0.3
  rflutter_alert: ^2.0.4
  ```
  
  ## Steps to follow
  ```
  git clone https://github.com/priteshparmar9/SDP_Project.git
  open folder with android studio
  apply pug get & pub upgrade
  change connection with firebase(If you want to use your db)
  connect to your device/AVD
  run the project
  ```
  
  We have used firebase in this project so you can use your own firebase for that you can refer the link below to connect your flutter project with firebase.
  [firebase.connect](https://firebase.google.com/docs/flutter/setup?platform=android)
