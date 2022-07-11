//import 'dart:js_util';

import 'package:flower_selling_app/home/screens/buy/add.dart';
import 'package:flutter/material.dart';
class buy extends StatelessWidget {
  const buy({Key? key}) : super(key: key);

  @override
  Widget build (BuildContext context) {
     return Scaffold(
      
      
      body: const Center (child: Text(
                "No Adds",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> addt()));


          
          
        },
        label: Text('Add items'),
        icon: Icon(Icons.add),

        backgroundColor: Color.fromARGB(255, 236, 0, 0),
        
)

     );
    
  }
}
