import 'package:flutter/material.dart';

void main() => runApp(const MyHomePage());

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Log In Page'),
          ),
          body: Center(
              child: Column(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter your username',
                    ),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.all(15),
                    child: ElevatedButton(
                      onPressed: () async {
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(30),
                      ),
                      child: const Text('Log In'),
                    )),
              ])),
        ));
  }
}
