import 'package:flutter/material.dart';

import 'coins.dart';
import 'contact.dart';

class Match {
  final String teamA;
  final String teamB;
  final String date;
  final String time;
  final String imageUrl;

  Match({
    required this.teamA,
    required this.teamB,
    required this.date,
    required this.time,
    required this.imageUrl,
  });
}


class Games extends StatefulWidget {
  const Games({super.key});

  @override
  State<Games> createState() => _GamesState();
}

class _GamesState extends State<Games> {
  List<Widget> widgetList = const [
    ScheduledMatchesScreen(),
    AddCoins(),
    Contact(),
  ];
  int cindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: widgetList,
        index: cindex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        onTap: (index) {
          setState(() {
            cindex = index;
          });
        },
        currentIndex: cindex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Matches", backgroundColor: Colors.green),
          BottomNavigationBarItem(icon: Icon(Icons.monetization_on), label: "Coins", backgroundColor: Colors.amber),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Contact", backgroundColor: Colors.blue),
        ],
      ),
    );
  }
}


class ScheduledMatchesScreen extends StatelessWidget {
  const ScheduledMatchesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Match> scheduledMatches = [
      Match(
        teamA: 'Team A',
        teamB: 'Team B',
        date: '2024-10-20',
        time: '3:00 PM',
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTf9_ZSE8EQuLUa1GaMAMBCQKnNVMYcSTMjmA&s',
      ),
      Match(
        teamA: 'Team C',
        teamB: 'Team D',
        date: '2024-10-21',
        time: '5:00 PM',
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTf9_ZSE8EQuLUa1GaMAMBCQKnNVMYcSTMjmA&s',
      ),
      Match(
        teamA: 'Team E',
        teamB: 'Team F',
        date: '2024-10-22',
        time: '1:00 PM',
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTf9_ZSE8EQuLUa1GaMAMBCQKnNVMYcSTMjmA&s',
      ),
      Match(
        teamA: 'Team G',
        teamB: 'Team H',
        date: '2024-10-23',
        time: '4:00 PM',
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTf9_ZSE8EQuLUa1GaMAMBCQKnNVMYcSTMjmA&s',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Scheduled Matches'),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: scheduledMatches.length,
          itemBuilder: (context, index) {
            final match = scheduledMatches[index];
            return Container(
              margin: EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  children: [
                    // Gradient background
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.blue, Colors.lightBlueAccent],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    ),
                    // Match details
                    ListTile(
                      contentPadding: EdgeInsets.all(20),
                      leading: ClipOval(
                        child: Image.network(
                          match.imageUrl,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        '${match.teamA} vs ${match.teamB}',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 8),
                          Text(
                            'Date: ${match.date}',
                            style: TextStyle(fontSize: 16, color: Colors.white70),
                          ),
                          Text(
                            'Time: ${match.time}',
                            style: TextStyle(fontSize: 16, color: Colors.white70),
                          ),
                        ],
                      ),
                      trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
                      onTap: () {
                        // Navigate to JoinScreen when a match is clicked
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => JoinScreen(match: match),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class JoinScreen extends StatelessWidget {
  final Match match;

  const JoinScreen({Key? key, required this.match}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Join Match'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              '${match.teamA} vs ${match.teamB}',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Date: ${match.date}',
              style: TextStyle(fontSize: 20, color: Colors.grey[700]),
            ),
            Text(
              'Time: ${match.time}',
              style: TextStyle(fontSize: 20, color: Colors.grey[700]),
            ),
            SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                match.imageUrl,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Implement join match functionality
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Joined the match!')),
                );
              },
              child: Text('Join Match'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

