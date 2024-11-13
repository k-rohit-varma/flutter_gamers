import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class AddCoins extends StatefulWidget {
  const AddCoins({super.key});

  @override
  _AddCoinsScreenState createState() => _AddCoinsScreenState();
}

class _AddCoinsScreenState extends State<AddCoins> {
  int _totalCoins = 0;
  final List<int> _coinList = []; // List to store added coins

  // Function to add coins
  void _addCoins(int coins) {
    setState(() {
      _totalCoins += coins;
      _coinList.add(coins); // Add the increment to the list
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Coins'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Total Coins: $_totalCoins',
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => _addCoins(20),
                  child: const Text('Add 20 Coins'),
                ),
                ElevatedButton(
                  onPressed: () => _addCoins(30),
                  child: const Text('Add 30 Coins'),
                ),
                ElevatedButton(
                  onPressed: () => _addCoins(40),
                  child: const Text('Add 40 Coins'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _coinList.isEmpty
                  ? const Center(
                child: Text('No coins added yet'),
              )
                  : ListView.builder(
                itemCount: _coinList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.monetization_on),
                    title: Text('Added ${_coinList[index]} coins'),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {

                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text('With draw'),
            ),
          ],
        ),
      ),
    );
  }
}
