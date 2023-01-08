import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:users_firebase/model/user.model.dart';
class search extends StatefulWidget {

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<search> {
  String name='';
  String a = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Card(
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),hintText: 'search by class...'),
            onChanged: (val){
              setState(() {
                val = val.toLowerCase();
                name = val ;
              });
            },
            ),
          ),
        ),
      body: StreamBuilder<QuerySnapshot>(

        stream: (name != "" && name != null)
            ? FirebaseFirestore.instance.collection('users').where("searchKeywords",arrayContains: name)
            .snapshots()
            : FirebaseFirestore.instance.collection("users").snapshots(),
        builder: (context, snapshot){
          return (snapshot.connectionState == ConnectionState.waiting)
              ?Center(child: CircularProgressIndicator())
              :ListView.builder(
                itemCount: snapshot.data!.docs.length,
            itemBuilder: (context,index){
                  DocumentSnapshot data =snapshot.data!.docs[index];
                  return Container(
                    padding: EdgeInsets.only(top:16),
                    child: Column(
                      children: [

                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.white ,
                            child: Icon(Icons.account_circle_sharp,size: 32,color: Colors.indigo,),
                          ),
                          title: Text (  'Nom: '+ data['name']+
                        '\nClasse: '+data['classe'] +'\nEmail: '+data['email']),


                     /*     style :TextStyle(
                            fontSize: 20,fontWeight: FontWeight.bold)),*/







                        )





                          ],
                    ) );



            },
          );
        },
      ),
      );

  }
}
