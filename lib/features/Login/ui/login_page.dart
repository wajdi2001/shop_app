import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/features/leading/ui/leadingPage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 233, 230, 230)),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Center(
              child: ListView(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Icon(
                Icons.lock,
                weight: 100,
                size: 130,
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                textAlign: TextAlign.center,
                "Welcome back you've been missed!",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(
                height: 25,
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: "Username",
                    hintStyle: const TextStyle(color: Colors.blueGrey),
                    enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.grey.shade400)),
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.blueGrey))),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: const TextStyle(color: Colors.blueGrey),
                    enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.grey.shade400)),
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.blueGrey))),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(15)),
                height: 60,
                width: double.infinity,
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    print("test sign in");
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LeadingPage()));
                  },
                  child: const Text(
                    "Sign In",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                textAlign: TextAlign.center,
                "________ Or continue with ________",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    
                    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(8)),
                      child: IconButton(
                    onPressed: () {},
                    icon: Image.asset("assets/facebook.png"),
                    iconSize: 50,
                  )),
                  const SizedBox(width: 15,),
                  Container(
                    height: 50,
                    width: 50,
                    
                    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(8)),
                      child: IconButton(
                    onPressed: () {},
                    icon: Image.asset("assets/google.png"),
                    iconSize: 50,
                  ))
                ],
              ),
              const SizedBox(height:45 ,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                const  Text(
              "Not a member?",
                style: TextStyle(color: Colors.grey),
              ),
              TextButton(onPressed: (){}, child: const Text(
              "Register Now",
                style:TextStyle(color: Colors.blue),
              ),)
                ],
              )
            ],
          )),
        ),
      ),
    );
  }
}
