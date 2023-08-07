import 'package:flutter/material.dart';
void main() {
  runApp(BlabbersApp());
  final blabbers = Blabbers();
  blabbers.postBlabb('user1', 'Hallo, das ist mein erster Tweet!');
  blabbers.postBlabb('user2', 'Schön, dich zu treffen! #Willkommen');
  blabbers.postBlabb('user1', 'Danke! #Aufgeregt');
  final user1Blabbs = blabbers.getTweetsByUsername('user1');
  final timeline = blabbers.getTimeline();
  print("Blabbs from User1:");
  for (var blabb in user1Blabbs) {
    print('${blabb.username} (${blabb.timestamp}): ${blabb.content}');
  }
  print('\nTimeline:');
  for (var blabb in timeline) {
    print('${blabb.username} (${blabb.timestamp}): ${blabb.content}');
  }
}
class BlabbersApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blabbers App',
      theme: ThemeData(
        primaryColor: Colors.black38,
      ),
      home: BlabbersHomePage(),
    );
  }
}
class BlabbersHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // APP BAR
      appBar: AppBar(
        title: Image.asset("assets/images/Logo.png", fit: BoxFit.cover),
       leading: const Icon(
          Icons.account_circle_rounded,
          size: 36,
        ),
        leadingWidth: 100,
        iconTheme: const IconThemeData(
          color: Colors.black38,
        ),
        
        backgroundColor: Colors.white,
      ),
      body: const Center(
        child: Text(
          'BLABBERS',
          style: TextStyle(
              fontSize: 36, color: Colors.green, fontWeight: FontWeight.bold),
        ),
      ),
      // DRAWER
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Text(
                'User Name',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                // Implement action for Home
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // Implement action for Settings
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  NewPage())
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.green[600],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.home),
              color: Colors.black38,
              onPressed: () {
                // Implement action for Home Button
              },
            ),
            IconButton(
              icon: const Icon(Icons.search),
              color: Colors.black38,
              onPressed: () {
                // Implement action for Message Button
              },
            ),
            IconButton(
              icon: const Icon(Icons.notifications),
              color: Colors.black38,
              onPressed: () {
                // Implement action for Notifications Button
              },
            ),
            IconButton(
              icon: const Icon(Icons.email),
              color: Colors.black38,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
class Blabb {
  final String username;
  final String content;
  final DateTime timestamp;
  Blabb(this.username, this.content, this.timestamp);
}
class Blabbers {
  List<Blabb> _blabbs = [];
  void postBlabb(String username, String content) {
    final timestamp = DateTime.now();
    final tweet = Blabb(username, content, timestamp);
    _blabbs.add(tweet);
  }
  List<Blabb> getTweetsByUsername(String username) {
    return _blabbs.where((tweet) => tweet.username == username).toList();
  }
  List<Blabb> getTimeline() {
    return _blabbs.reversed.toList();
  }
}
class NewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
          FloatingActionButton(
        child: Icon(
          Icons.
        ),
        onPressed: () {
          //...
        },
        heroTag: null,
      ),
      SizedBox(
        height: 10,
      ),
      FloatingActionButton(           
        child: Icon(
          Icons.star
        ),
        onPressed: () {},
        heroTag: null,
      )
        ],
      ),
    );
  }
}









