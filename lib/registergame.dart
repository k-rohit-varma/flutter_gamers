
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class registergame extends StatelessWidget {
  const registergame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register",style: TextStyle(color: Colors.red),),
      ),
      body: Container(
        
        child: Column(
          children: [
            
            Container(
              child: Image.asset('asstes/images/img.png'),
            )
            
          ],
        ),
        
      ),
    );
  }
}
