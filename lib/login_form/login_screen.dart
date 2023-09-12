import 'package:flutter/material.dart';
import 'package:simple_login_form/login_form/home.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final _formfield = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();
  bool PassToggle = true;
  bool obscureText = true;
  RegExp emailRegExp = RegExp(
      r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$'); // Email validation regex
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 250),
          child: Form(
              key: _formfield,
              child: Column(
                children: [
                  // Image.asset(),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailcontroller,
                    decoration: InputDecoration(
                      labelText: "Email",
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || !emailRegExp.hasMatch(value)) {
                        return "  Enter valid email";
                      }

                      // You can add more validation logic here if needed
                      return null; // Return null if the input is valid
                    },
                  ),

                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: passcontroller,
                    obscureText: !PassToggle,
                    decoration: InputDecoration(
                      labelText: "Password",
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(),
                      suffix: InkWell(
                        onTap: () {
                          setState(() {
                            PassToggle = !PassToggle;
                          });
                        },
                        child: Icon(PassToggle
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter the password";
                      }
                      return null; // Return null if the input is valid
                    },
                  ),

                  SizedBox(
                    height: 50,
                  ),
                  InkWell(
                      onTap: () {
                        if (_formfield.currentState!.validate()) {
                          print("Sucess");
                          emailcontroller.clear();
                          passcontroller.clear();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => home(),
                              )); //is this how you navigate
                        }
                      },
                      child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                          ),
                          child: Center(
                              child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )))),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(" Don't have an account?  "),
                      InkWell(
                          onTap: () {},
                          child: Text(
                            "Signup",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 18,
                            ),
                          ))
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}
