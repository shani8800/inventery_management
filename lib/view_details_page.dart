import 'package:flutter/material.dart';

class ViewDetailsPage extends StatelessWidget {
  final String name;
  final int? age;
  final String sapId;
  final String degree;

  const ViewDetailsPage({
    Key? key,
    required this.name,
    required this.age,
    required this.sapId,
    required this.degree,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: $name',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'Age: ${age ?? 'N/A'}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'SAP ID: $sapId',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'Degree/Program Name: $degree',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
