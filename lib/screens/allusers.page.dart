import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:users_firebase/model/user.model.dart';
import 'package:users_firebase/screens/widget/users.list.dart';
class allusers extends StatefulWidget {
  const allusers({Key? key}) : super(key: key);

  @override
  State<allusers> createState() => _allusersState();
}

class _allusersState extends State<allusers> {
  @override
  Widget build(BuildContext context) {
    List<User> allusers = [];
    return Scaffold(
    body: StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('users').orderBy('name').snapshots(),
      builder: (context,snp){
        if(snp.hasError){
          return Center(child: Text('Error'),);
        }
        if (snp.hasData){
          allusers = snp.data!.docs.map((doc) => User.fromjson(doc.data() as Map<String, dynamic>)).toList();
          return ListUsers(users: allusers);
        }else{
          return Center(child: CircularProgressIndicator());
        }
      },
    )  ,
    );
  }
}
