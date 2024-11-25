import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spotify Clone',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: SpotifyHomeScreen(),
    );
  }
}

class SpotifyHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.black,
            floating: false,
            pinned: true,
            expandedHeight: 60.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Boa Noite', style: TextStyle(color: Colors.white)),
            ),
            actions: [
              IconButton(
                  icon: Icon(Icons.notifications, color: Colors.white),
                  onPressed: () {}),
              IconButton(
                  icon: Icon(Icons.history, color: Colors.white),
                  onPressed: () {}),
              IconButton(
                  icon: Icon(Icons.settings, color: Colors.white),
                  onPressed: () {}),
            ],
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3.5,
                crossAxisSpacing: 6,
                mainAxisSpacing: 6,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Card(
                    color: Colors.grey[900],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Center(
                        child: Text('Música ${index + 1}',
                            style: TextStyle(color: Colors.white))),
                  );
                },
                childCount: 6,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('NOVO LANÇAMENTO DE',
                      style: TextStyle(color: Colors.grey, fontSize: 12)),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            NetworkImage('https://via.placeholder.com/60'),
                      ),
                      SizedBox(width: 16),
                      Text('Nome da Banda',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                    ],
                  ),
                  SizedBox(height: 8),
                  Card(
                    color: Colors.grey[900],
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Image.network('https://via.placeholder.com/100',
                              width: 100, height: 100),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Nome da Música',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                                Text('Álbum',
                                    style: TextStyle(color: Colors.grey)),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    Icon(Icons.favorite_border,
                                        color: Colors.white),
                                    SizedBox(width: 16),
                                    Icon(Icons.play_circle_filled,
                                        color: Colors.white, size: 32),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text('Recomendados para você',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Container(
                    height: 120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: Image.network(
                              'https://via.placeholder.com/120',
                              width: 120,
                              height: 120),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 60,
        color: Colors.grey[900],
        child: Row(
          children: [
            Image.network('https://via.placeholder.com/50',
                width: 50, height: 50),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Música Atual', style: TextStyle(color: Colors.white)),
                  Text('Artista', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            IconButton(
                icon: Icon(Icons.favorite_border, color: Colors.white),
                onPressed: () {}),
            IconButton(
                icon: Icon(Icons.play_arrow, color: Colors.white),
                onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
