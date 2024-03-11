import 'package:flutter/material.dart';
import 'package:untitled1/salat.dart'; // Assuming the Salat class is defined in salat.dart

class details extends StatelessWidget {
  late salat salatItem;

  details({required this.salatItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(salatItem.salatName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Salat Name: ${salatItem.salatName}',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Raka3at Number: ${salatItem.raka3atNumber}',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Salat description:${salatItem.salatDescription}",
              style: TextStyle(fontSize: 20),

            )
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}
