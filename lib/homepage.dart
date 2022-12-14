import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled6/login.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  late SharedPreferences logindata;
  late String username;
  void initState(){
    checkpage();
  }
  void checkpage()async{
    logindata=await SharedPreferences.getInstance();
    setState(() {
      username=logindata.getString('username')!;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text('shared prefference'),
     ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('hai $username welcome to luminar'),
          ),
          ElevatedButton(onPressed: (){
            logindata.setBool('login', true);
            Navigator.pushReplacement((context), MaterialPageRoute(builder: (context)=>login()));
          },child: Text('Logout'))
        ],
      ),
    );
  }
}
