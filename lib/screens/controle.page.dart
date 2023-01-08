import 'package:flutter/material.dart';
import 'package:users_firebase/screens/allusers.page.dart';
import 'package:users_firebase/screens/search.dart';

import 'package:users_firebase/screens/user.add.dart';
class Controlepage extends StatelessWidget {
  const Controlepage ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              title: Text('Gestion des utilisateurs'),
              bottom: TabBar(
                tabs: const [
                  Tab(icon: Icon(Icons.supervised_user_circle_sharp,size: 28,),text: 'Add',),
                  Tab(icon: Icon(Icons.edit_attributes,size: 28,),text: 'Users',),
                  Tab(icon: Icon(Icons.search,size: 28,),text: 'Search',),
                ],
              ),
            ),
            body: TabBarView(
              children:  [
                AddUserpage(),
                allusers(),
                search(),
              ],
            ),
        )
    );
  }
}
