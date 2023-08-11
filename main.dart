import 'package:flutter/material.dart';

void main() {
  runApp(BlabbersApp());
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

class BlabbersHomePage extends StatefulWidget {
  @override
  _BlabbersHomePageState createState() => _BlabbersHomePageState();
}

class _BlabbersHomePageState extends State<BlabbersHomePage> {
  int _thumbUpCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  centerTitle: true,
  title: Image.asset(
    "assets/images/Logo.png",
    fit: BoxFit.contain,
    height: 30,
  ),
  backgroundColor: Colors.transparent,
  elevation: 0,
  iconTheme: IconThemeData(color: Colors.green),
  bottom: PreferredSize(
    preferredSize: Size.fromHeight(4.0), 
    child: Container(
      color: Colors.green, 
    ),
  ),
),
    
    
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              AssetImage("assets/images/profile.jpeg"),
                        ),
                        SizedBox(width: 16),
                        Text(
                          "Benutzername",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    "assets/images/nachrichten2.jpeg",
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Dies ist ein Beispieltext, der auf 160 Zeichen begrenzt ist. Dies ist ein Beispieltext, der auf 160 Zeichen begrenzt ist.',
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: FittedBox(
                      fit: BoxFit.fitHeight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildCountButton(Icons.thumb_up, Colors.green),
                          Text(
            '$_thumbUpCount',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
                          _buildRoundedButton(Icons.thumb_down, Colors.green, () {}),
                          _buildRoundedButton(Icons.comment, Colors.green, () {}),
                          _buildRoundedButton(Icons.send, Colors.green, () {}),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
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
            MaterialPageRoute(builder: (context) => PostPage()),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.green[600],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.green,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.home),
              color: Colors.white,
              onPressed: () {
                // Implement action for Home Button
              },
            ),
            IconButton(
              icon: const Icon(Icons.search),
              color: Colors.white,
              onPressed: () {
                // Implement action for Message Button
              },
            ),
            IconButton(
              icon: const Icon(Icons.notifications),
              color: Colors.white,
              onPressed: () {
                // Implement action for Notifications Button
              },
            ),
            IconButton(
              icon: const Icon(Icons.email),
              color: Colors.white,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }

  Widget _buildRoundedButton(IconData icon, Color color, VoidCallback onPressed) {
    return MaterialButton(
      onPressed: onPressed,
      color: color,
      shape: CircleBorder(),
      child: Icon(
        icon,
        color: Colors.white,
        size: 20,
      ),
    );
  }

  Widget _buildCountButton(IconData icon, Color color) {
    return MaterialButton(
      onPressed: () {
        setState(() {
          if (_thumbUpCount > 0) {
            _thumbUpCount--;
          } else {
            _thumbUpCount++;
          }
        });
      },
      color: color,
      shape: CircleBorder(),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
          SizedBox(width: 4),
          
        ],
      ),
    );
  }
}

class PostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
        ),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildRoundedButton(Icons.thumb_up, Colors.green, () {}),
              _buildRoundedButton(Icons.comment, Colors.green, () {}),
              _buildRoundedButton(Icons.send, Colors.green, () {}),
              SizedBox(height: 16),
              FloatingActionButton(
                onPressed: () {},
                child: Icon(Icons.create),
                backgroundColor: Colors.green[600],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoundedButton(IconData icon, Color color, VoidCallback onPressed) {
    return MaterialButton(
      onPressed: onPressed,
      color: color,
      shape: CircleBorder(),
      child: Icon(
        icon,
        color: Colors.white,
        size: 20,
      ),
    );
  }
}