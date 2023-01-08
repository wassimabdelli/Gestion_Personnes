import 'package:flutter/material.dart';
import 'package:users_firebase/model/user.model.dart';
import 'package:users_firebase/repository/user.repo.dart';
import 'package:users_firebase/screens/allusers.page.dart';
class ListUsers extends StatefulWidget {
    List<User> users;
    ListUsers({required this.users});


  @override
  State<ListUsers> createState() => _ListUsersState();
}

class _ListUsersState extends State<ListUsers> {
  @override
  Widget build(BuildContext context) {
    final allusers = widget.users;


    return  ListView.builder(
        itemCount: allusers.length,
        itemBuilder: (context,index){
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.indigo ,
                child: Text(allusers[index].name.substring(0,2).toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold),),
              ),
              title: Text(allusers[index].name,style: TextStyle(fontSize: 22),),
              subtitle: Text(allusers[index].classe,style: TextStyle(fontSize: 22),),
              trailing:Row(
                mainAxisSize: MainAxisSize.min,
                children: [

                  TextButton(
                    onPressed: (){
                      String n = allusers[index].name;
                      int a = allusers[index].age;
                      int nm = allusers[index].num;
                      String c = allusers[index].classe;
                      String m = allusers[index].email;
                      final _ctrupdatename = TextEditingController(text: n);
                      final _ctrupdateage = TextEditingController(text: a.toString());
                      final _ctrupdateclasse = TextEditingController(text: c);
                      final _ctrupdatenum = TextEditingController(text: nm.toString());
                      final _ctrupdatemail = TextEditingController(text: m);

                      showDialog(context: context, builder: (context)=>AlertDialog(
                        title: Text('Update: ${allusers[index].name}'),
                        content: SingleChildScrollView(
                          child: Container(
                            child: Column(
                              children: [
                                TextField(
                                  style: TextStyle(fontSize: 22,color: Colors.indigo),
                                  decoration: InputDecoration( hintText: n,
                                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(40))),
                                  ),
                                  controller:_ctrupdatename ,
                                ), //name
                                SizedBox(height: 20 ,),
                                TextField(
                                  style: TextStyle(fontSize: 22,color: Colors.indigo),
                                  decoration: InputDecoration( hintText: a.toString(),
                                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(40))) ),
                                  controller:_ctrupdateage ,
                                ),// age
                                SizedBox(height: 20 ,),
                                TextField(
                                  style: TextStyle(fontSize: 22,color: Colors.indigo),
                                  decoration: InputDecoration( hintText: m,
                                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(40))), ),
                                  controller:_ctrupdatemail ,
                                ),//email
                                SizedBox(height: 20 ,),
                                TextField(
                                  style: TextStyle(fontSize: 22,color: Colors.indigo),
                                  decoration: InputDecoration( hintText: c,
                                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(40))), ),
                                  controller:_ctrupdateclasse ,
                                ),//classe
                                SizedBox(height: 20 ,),
                                TextField(
                                  style: TextStyle(fontSize: 22,color: Colors.indigo),
                                  decoration: InputDecoration(
                                   hintText: nm.toString(),
                                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(40))), ),
                                  controller:_ctrupdatenum ,
                                ),// nul tel
                                SizedBox(height: 20 ,),
                                ElevatedButton(
                                    onPressed:(){
                                      final user = User(id: allusers[index].id,name: _ctrupdatename.text, email:_ctrupdatemail.text, age:int.parse(_ctrupdateage.text) , classe: _ctrupdateclasse.text, num:int.parse(_ctrupdatenum.text));
                                      updateUser(user);
                                    },
                                    child: Container(width: double.infinity,child:  Text('Update'),)),
                              ],
                            ),
                            ),
                        ),
                          actions: [
                            ElevatedButton(onPressed:(){
                              Navigator.pop(context,'Annuler');
                            }, child: Text('Annuler'))
                          ],
                        ),

                      );
                    },
                    child: Icon(Icons.edit,size: 32,color: Colors.green,),
                  ),
                  TextButton(
                    onPressed: (){
                      showDialog(context: context, builder: (context)=>AlertDialog(
                       title: Text('Vouler-vous vraiment suppriler ${allusers[index].name}?'),
                        actions: [
                          ElevatedButton(onPressed: (){
                            deleteUser(allusers[index].id);
                            Navigator.pop(context,'oui');
                          }, child: Text('Oui'),
                          ),
                          ElevatedButton(onPressed: (){
                            Navigator.pop(context,'annuler');
                          }, child: Text('Non'),

                          ),
                        ],
                      ));
                    },
                    child: Icon(Icons.delete,size: 32,color: Colors.red,),
                  ),
                ],
              ),


            ),
          );
        }
    );
  }
}

