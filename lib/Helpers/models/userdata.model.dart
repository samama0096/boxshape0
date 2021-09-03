import 'package:cloud_firestore/cloud_firestore.dart';

class Userdata {
  String? fullname;
  String? email;
  String? password;
  String? contact;
  String? username;

  Userdata(
      {this.fullname, this.email, this.password, this.contact, this.username});

  factory Userdata.fromDocument(DocumentSnapshot doc) {
    return Userdata(
        fullname: doc['fullname'],
        email: doc['email'],
        password: doc['password'],
        contact: doc['contact'],
        username: doc['username']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullname'] = this.fullname;
    data['email'] = this.email;
    data['password'] = this.password;
    data['contact'] = this.contact;
    data['username'] = this.username;
    return data;
  }
}
