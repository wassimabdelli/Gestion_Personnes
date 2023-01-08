import 'package:flutter/material.dart';
import 'package:users_firebase/model/user.model.dart';
import 'package:users_firebase/repository/user.repo.dart';


class  AddUserpage extends StatelessWidget {
  const  AddUserpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _Ctrname = TextEditingController();
    final _Ctrage = TextEditingController();
    final _Ctremail = TextEditingController();
    final _Ctrnum = TextEditingController();
    final _Ctrclasse = TextEditingController();

    return Scaffold(

      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(height: 20,),
              TextField(
                controller: _Ctrname,
                style: TextStyle(fontSize: 22),
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(40)))
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                controller: _Ctremail,
                style: TextStyle(fontSize: 22),
                decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(40)))
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                controller: _Ctrage,
                style: TextStyle(fontSize: 22),
                decoration: InputDecoration(
                    labelText: 'Age',
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(40)))
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                controller: _Ctrnum,
                style: TextStyle(fontSize: 22),
                decoration: InputDecoration(
                    labelText: 'num tel',
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(40)))
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                controller: _Ctrclasse,
                style: TextStyle(fontSize: 22),
                decoration: InputDecoration(
                    labelText: 'classe',
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(40)))
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: (){
                    /*
                      for (int i =0 ; i<_Ctrclasse.toString().length;){
                        tab[i] =
                        tab[i+1] = t[i] + t[i+1]
                      }*/
                    final user = User(name:_Ctrname.text, email:_Ctremail.text, age:int.parse(_Ctrage.text),num:int.parse(_Ctrnum.text),classe:_Ctrclasse.text);
                    addUser(user);
                  },
                  child: Container(width: double.infinity,child: Icon(Icons.add_circle,size: 32,),))
            ],
          ),
        ),
      ),
    );
  }
}
