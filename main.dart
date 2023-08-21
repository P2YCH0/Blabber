import 'package:flutter/material.dart';

void main() {
  runApp(const BlabbersApp());
}

class BlabbersUser {
  final String username;
  final String profileImage;
  final String postImage;
  final String postText;

  BlabbersUser({
    required this.username,
    required this.profileImage,
    required this.postImage,
    required this.postText,
  });
}

class  BlabbersApp extends StatelessWidget {
  const BlabbersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blabbers App',
      theme: ThemeData(fontFamily: 'Poppins'),
      home: const BlabbersHomePage(),

    );
  }
    
  }


class BlabbersHomePage extends StatefulWidget {
  const BlabbersHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BlabbersHomePageState createState() => _BlabbersHomePageState();
}

class _BlabbersHomePageState extends State<BlabbersHomePage> {
  List<BlabbersUser> users = [
    BlabbersUser(
      username: "User1",
      profileImage: "assets/images/profile1.jpeg",
      postImage: "assets/images/nachrichten1.jpeg",
      postText: "Dies ist der Beitrag von User1.",
    ),
    BlabbersUser(
      username: "User2",
      profileImage: "assets/images/profile2.jpeg",
      postImage: "assets/images/nachrichten2.jpeg",
      postText: "Dies ist der Beitrag von User2.",
    ),
      BlabbersUser(
      username: "User3",
      profileImage: "assets/images/profile3.jpeg",
      postImage: "assets/images/nachrichten3.jpeg",
      postText: "Dies ist der Beitrag von User3.",
    ),
    // Weitere Benutzer hinzufügen...
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(110.0), // erhöht die Appbar
        child: AppBar(
          centerTitle: true,
          title: Padding( // Logo bearbeiten
            padding: const EdgeInsets.only(top: 10.0), // Abbstand nach oben anpassbar
            child: Image.asset(
              "assets/images/Logo.png",
              fit: BoxFit.contain,
              height: 30,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.green),
          leading: Builder(
            builder: (context) => GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: const Padding( 
                padding: EdgeInsets.only(left: 10.0, top: 10.0), 
                child: CircleAvatar(
                  radius: 18,
                  backgroundImage: AssetImage("assets/images/P2YCH0.jpg"),
                ),
              ),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        // Implementieren Sie die Aktion für den "Follow" Button
                      },
                      child: const Text(
                        "Follow",
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        // Implementieren Sie die Aktion für den "For You" Button
                      },
                      child: Text(
                        "For you",
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.green,
                  thickness: 0.3,
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              var user = users[index];
              return Container(
                margin: EdgeInsets.all(3.0), // Rand des Containers
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.green, width: 0.6),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.2),
        spreadRadius: 1,
        blurRadius: 2,
        offset: Offset(1, 0), // Position des Schattens
      ),
    ],
                  ),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage(user.profileImage),
                          ),
                          SizedBox(width: 12),
                          Text(
                            user.username,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            icon: const Icon(Icons.share, color: Colors.green),
                            onPressed: () {
                              // Implementiere hier die Aktion für den "Teilen"-Button
                            },
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      user.postImage,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        user.postText,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: FittedBox(
                        fit: BoxFit.fitHeight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildRoundedButton(
                              Icons.comment,
                              const Color.fromARGB(167, 76, 175, 79),
                              () {
                                // Implementiere die Aktion für den "Kommentar"-Button
                              },
                            ),
                            _buildRoundedButton(
                              Icons.cached,
                              const Color.fromARGB(167, 76, 175, 79),
                              () {
                                // Implementiere die Aktion für den "Retweet"-Button
                              },
                            ),
                            _buildRoundedButton(
                              Icons.favorite,
                              Colors.red,
                              () {
                                // Implementiere die Aktion für den "Favorite"-Button
                              },
                            ),
                            _buildRoundedButton(
                              Icons.visibility,
                              const Color.fromARGB(167, 76, 175, 79),
                              () {
                                // Implementiere die Aktion für den "Zähler"-Button
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
      drawer: Drawer(
        // Wird jetzt erstellt
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PostPage()),
          );
        },
        child: Icon(Icons.add),
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
                // Implementieren Sie die Aktion für den Home Button
              },
            ),
            IconButton(
              icon: const Icon(Icons.search),
              color: Colors.white,
              onPressed: () {
                // Implementieren Sie die Aktion für den Message Button
              },
            ),
            IconButton(
              icon: const Icon(Icons.notifications),
              color: Colors.white,
              onPressed: () {
                // Implementieren Sie die Aktion für den Notifications Button
              },
            ),
            IconButton(
              icon: const Icon(Icons.email),
              color: Colors.white,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoundedButton(
    IconData icon,
    Color color,
    VoidCallback onPressed,
  ) {
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

  Future<void> _changeProfilePicture() async {
    // Hier wird später die Profilbildauswahl implementiert
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

  Widget _buildRoundedButton(
    IconData icon,
    Color color,
    VoidCallback onPressed,
  ) {
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