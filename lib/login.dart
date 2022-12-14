import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled6/homepage.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}
class _loginState extends State<login> {
  final user_controller=TextEditingController();
  final pass_controller=TextEditingController();
  late SharedPreferences shared;
  late bool newuser;
  @override
  void initState() {
    checkpage();

  }
  void checkpage()async{
    shared=await SharedPreferences.getInstance();
    newuser=shared.getBool('login')??true;
    if(newuser==false){
      Navigator.pushReplacement((context), MaterialPageRoute(builder:(context)=>home()));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('shared prefference'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20,top: 150),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Login page',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              TextField(
                decoration: InputDecoration(
                  hintText: 'username'
                ),
                controller: user_controller,
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: 'password'
                ),
                controller: pass_controller,
              ),
              ElevatedButton(onPressed: (){
                String username=user_controller.text;
                String Password=pass_controller.text;
                if(username!=''&&Password!=''){
                  shared.setBool('login', false);
                  shared.setString('username', username);
                  Navigator.pushReplacement((context), MaterialPageRoute(builder: (context)=>home()));
                }
              }, child: Text('Login'))
            ],
          ),
        ),
      ),
    );
  }
}
