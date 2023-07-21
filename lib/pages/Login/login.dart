import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/const.dart';
import 'package:food_app/pages/Home.dart';
import 'package:food_app/pages/Login/Signin.dart';
import 'package:food_app/pages/Login/Signin.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();
  bool login = true;
  bool signIn = false;

  void Login() async {
    String emailCon = emailControler.text.trim();
    String passwordCon = passwordControler.text.trim();
    if (emailCon == '' || passwordCon == '') {
      const message = SnackBar(
        content: Text(
          'The fields can not be empty',
          style: TextStyle(
            fontFamily: 'Mukta',
            fontSize: 20,
          ),
        ),
        duration: Duration(seconds: 3),
        backgroundColor: mainColor,
      );
      ScaffoldMessenger.of(context).showSnackBar(message);
    } else {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: emailCon, password: passwordCon);
        if (userCredential.user != null) {
          Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Home()));
        }
      } on FirebaseAuthException catch (e) {
        print(e.code.toString());
        final message = SnackBar(
          content: Text(
            '${e.code.toString()}',
            style: const TextStyle(
              fontFamily: 'Mukta',
              fontSize: 20,
            ),
          ),
          duration: const Duration(seconds: 3),
          backgroundColor: mainColor,
        );
        ScaffoldMessenger.of(context).showSnackBar(message);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(55),
                bottomRight: Radius.circular(55)),
            child: Hero(
              tag: 1,
              child: Image.asset(
                'Images/Background1.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: 340,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  blurRadius: 1,
                )
              ],
              color: Color(0xFFF2F2F2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          login = true;
                          signIn = false;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 35, bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: login
                              ? Color(0xFF719f4b)
                              : Color.fromARGB(255, 189, 189, 189),
                        ),
                        height: 30,
                        width: 80,
                        // margin: EdgeInsets.only(bottom: 10),
                        child: const Center(
                            child: Text(
                          'Login',
                          style: TextStyle(fontFamily: 'Mukta'),
                        )),
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    GestureDetector(
                      onTap: () {
                        signIn = true;
                        login = false;
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignIn()));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 35, bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: signIn
                              ? mainColor
                              : Color.fromARGB(255, 189, 189, 189),
                        ),
                        height: 30,
                        width: 80,
                        //margin: EdgeInsets.only(bottom: 10),
                        child: const Center(
                          child: Text(
                            'Sign In',
                            style: TextStyle(fontFamily: 'Mukta'),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 5),
                  child: TextField(
                    controller: emailControler,
                    decoration: const InputDecoration(
                        enabled: true,
                        focusedBorder: focusBorder,
                        enabledBorder: enableBorder,
                        labelText: 'Email Address',
                        labelStyle:
                            TextStyle(color: Color(0xFFBBBBBB), fontSize: 16),
                        hintText: 'Enter your Email',
                        hintStyle: TextStyle(fontSize: 15)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 5),
                  child: TextField(
                    controller: passwordControler,
                    decoration: const InputDecoration(
                        enabled: true,
                        focusedBorder: focusBorder,
                        enabledBorder: enableBorder,
                        labelText: 'Password',
                        labelStyle:
                            TextStyle(color: Color(0xFFBBBBBB), fontSize: 16),
                        hintText: 'Enter your Password',
                        hintStyle: TextStyle(fontSize: 15)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 5),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: InkWell(
                      onTap: () {
                        print('Forget Password');
                      },
                      child: const Text(
                        'Forget Password ?',
                        style: TextStyle(
                            fontFamily: 'Mukta',
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Login();
                    print('Login');
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 45,
                    width: 120,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(blurRadius: 5, color: Colors.black),
                      ],
                      borderRadius: BorderRadius.circular(22),
                      color: Color(0xFF719f4b),
                    ),
                    child: Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontFamily: 'Mukta',
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 22,
          ),
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45),
              topRight: Radius.circular(45),
            ),
            child: Image.asset('Images/Background2.jpg'),
          ),
        ],
      ),
    ));
  }
}
