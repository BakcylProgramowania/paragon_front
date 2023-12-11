import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData( 
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  
  @override
  State<MyHomePage> createState() => Login();
}

class Login extends State<MyHomePage>{

    final _formKey = GlobalKey<FormState>();
    @override
    Widget build(BuildContext context){
       return Scaffold(
      body: Center(
        child: Column(
        children:[
            Container(
              
            margin: const EdgeInsets.only(top:50),
            child: const Text(
              "PARAGON",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w600 ),
            ),
            ),
            Container(
              alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 80),
                child: const Text(
                  'Zaloguj sie',
                  style: TextStyle(fontSize: 20)
            ) 
            ),
             Form(
              key: _formKey,
              child: Column(
                
                children: [
                TextFormField(
                decoration: const InputDecoration(
                  labelText: "Login",
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Password",
                ),
              ),

              Container(
                margin: const EdgeInsets.only(top: 10),
                child: 
                ElevatedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
              )
              ]
              ),
            )
          ]
        ),
      ),
    );
    }
}
