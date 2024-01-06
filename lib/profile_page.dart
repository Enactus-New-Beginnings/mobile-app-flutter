import 'package:flutter/material.dart';

void main() {
  runApp(const mainPage());
}

class mainPage extends StatelessWidget {
  const mainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  final PageController pageController = PageController();
  int currentPageIndex = 0;

  void onPageChanged(int index) {
    currentPageIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: <Widget>[
          ProfileForm(),
          MapPage(),
          ResumePage(),
        ],
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
        currentIndex: currentPageIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (index) {
          pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 500),
            curve: Curves.ease,
          );
        },
      ),
    );
  }
}

class ProfileForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 100.0,
          backgroundImage: NetworkImage(
            'https://picsum.photos/200',
          ),
        ),
        SizedBox(height: 10.0),
        ProfileTextField(label: 'Name', initialValue: 'John Doe'),
        SizedBox(height: 10.0),
        ProfileTextField(label: 'Email', initialValue: 'john.doe@email.com'),
        SizedBox(height: 10.0),
        ProfileTextField(label: 'Date of Birth', initialValue: '01/01/1990'),
        SizedBox(height: 10.0),
        ProfileTextField(label: 'Location', initialValue: 'San Francisco, CA'),
        SizedBox(height: 10.0),
        ElevatedButton(
          onPressed: () {
            // Add functionality for editing profile
          },
          child: Text('Edit Profile'),
        ),
      ],
    );
  }
}

class ProfileTextField extends StatelessWidget {
  final String label;
  final String initialValue;

  const ProfileTextField({
    required this.label,
    required this.initialValue,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
      ),
      initialValue: initialValue,
    );
  }
}

class MapPage extends StatelessWidget {
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
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter your username',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter your password',
                    ),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.all(15),
                    child: ElevatedButton(
                      onPressed: () {

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

class ResumePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resume'),
      ),
      body: Center(
        child: Text('Resume Page Content'),
      ),
    );
  }
}

