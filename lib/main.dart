import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? errorMessage;
  bool czyZalogowano = false;

  void checkLogin() {
    final enteredEmail = emailController.text;
    final enteredPassword = passwordController.text;

    setState(() {
      if (enteredEmail == "aa" && enteredPassword == "aa") {
        czyZalogowano = true;
        errorMessage = null;

        print("Login successful");

        Future.delayed(Duration(seconds: 3), () {
          setState(() {
            czyZalogowano = false;
            errorMessage = null;
          });
        });
      } else {
        // Invalid credentials, show an error message.
        errorMessage = "Invalid email or password";
      }

      print(czyZalogowano);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Login Screen"),
        ),
        body: czyZalogowano == false
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Form(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 35),
                            child: TextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                hintText: 'Enter email',
                                prefixIcon: Icon(Icons.email),
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (String value) {},
                              validator: (value) {
                                return value!.isEmpty
                                    ? 'Please enter email'
                                    : null;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 35),
                            child: TextFormField(
                              controller: passwordController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                hintText: 'Enter password',
                                prefixIcon: Icon(Icons.password),
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (String value) {},
                              validator: (value) {
                                return value!.isEmpty
                                    ? 'Please enter password'
                                    : null;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 35),
                            child: MaterialButton(
                              minWidth: double.infinity,
                              onPressed: checkLogin,
                              child: Text("Login"),
                              color: Colors.teal,
                              textColor: Colors.white,
                            ),
                          ),
                          if (errorMessage != null)
                            Text(
                              errorMessage!,
                              style: TextStyle(color: Colors.red),
                            )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Logging in...",
                      style: TextStyle(color: Colors.teal, fontSize: 20),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
