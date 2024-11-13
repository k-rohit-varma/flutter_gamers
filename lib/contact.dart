import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact us"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 40),
            const Text(
              'Contact Information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.phone),
              title: const Text('Phone'),
              subtitle: const Text('+91 9963300488'),
            ),
            ListTile(
              leading: const Icon(Icons.email),
              title: const Text('Email'),
              subtitle: const Text('rohit@gmail.com'),
            ),
            ListTile(
              leading: const Icon(Icons.location_on),
              title: const Text('Address'),
              subtitle: const Text('1234 Flutter St, App City, Flutterland'),
            ),
            Container(
              height: 20,
            ),
            Container(
              child: Text("Send Message",style: TextStyle(fontSize: 20),),
            ),

        const SizedBox(height: 20),
        const TextField(
          decoration: InputDecoration(
            labelText: 'Message',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.message),
          ),
          maxLines: 2,
        ),
            Center(child: ElevatedButton(onPressed: (){}, child: Text("Send")))
          ],
        ),
      ),
    );
  }
}
