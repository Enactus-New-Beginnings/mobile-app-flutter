import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late String _name;
  late String _email;
  late String _dateOfBirth;
  late String _location;
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[    Text('Profile Page'),    Text('Map'),    Text('Resume'),  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    // Set default values for profile information
    _name = 'John Doe';
    _email = 'john.doe@email.com';
    _dateOfBirth = '01/01/1990';
    _location = 'San Francisco, CA';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 100.0,
                  backgroundImage: NetworkImage(
                    'https://picsum.photos/200',
                  ),
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                  ),
                  initialValue: _name,
                  onChanged: (value) {
                    setState(() {
                      _name = value;
                    });
                  },
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                  initialValue: _email,
                  onChanged: (value) {
                    setState(() {
                      _email = value;
                    });
                  },
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Date of Birth',
                  ),
                  initialValue: _dateOfBirth,
                  onChanged: (value) {
                    setState(() {
                      _dateOfBirth = value;
                    });
                  },
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Location',
                  ),
                  initialValue: _location,
                  onChanged: (value) {
                    setState(() {
                      _location = value;
                    });
                  },
                ),
                SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: () {
                    // Add functionality for editing profile
                  },
                  child: Text('Edit Profile'),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: 'Map',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.description),
              label: 'Resume',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
