import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

const List<String> list = <String>['Food', 'Clothing', 'Shelter'];
FirebaseDatabase database = FirebaseDatabase.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  // fetchData();
  // Run app
  runApp(const Resources());
  print("finish app");
}



Future<List> fetchData() async{
  print("// Get a reference to the database");
  final reference = FirebaseDatabase.instance.ref();
  var resourcesTitle =  [];
  final snapshot = await reference.child('resources').get();
  if (snapshot.exists) {
    print(snapshot.value);
  } else {
    print('No data available.');
  }
  return resourcesTitle;
}


class Resources extends StatelessWidget {

  const Resources({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Resources',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.orangeAccent,
        ),

        body: const Center(
          child: ResourcesTable(),
        ),
      ),
    );
  }
}

class ResourcesTable extends StatefulWidget {
  const ResourcesTable({Key? key}) : super(key: key);
  @override
  State<ResourcesTable> createState() => _ResourcesTableExampleState();
}

final databaseReference = FirebaseDatabase.instance.reference();

List<String> resources = [];



class _ResourcesTableExampleState extends State<ResourcesTable> {
  String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: DropdownButton<String>(
            value: dropdownValue,
            icon: const Icon(Icons.arrow_downward),
            isExpanded: true,
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                dropdownValue = value!;
              });
            },
            items: list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 16.0),
        Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
          child: Table(
            border: TableBorder.all(),
            children: [
              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Name"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Location'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Job Title'),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('New Brunswick Free Food'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Rutgers C/D'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Food Pantry'),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Item 2'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('2'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('20'),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
