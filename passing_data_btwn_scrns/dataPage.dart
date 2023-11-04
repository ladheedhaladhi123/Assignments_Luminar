import 'package:flutter/material.dart';
import 'package:project_application1/passing_data_btwn_scrns/statefullPage.dart';
import 'package:project_application1/passing_data_btwn_scrns/to_stateless_page.dart';

void main() {
  runApp(MaterialApp(
    home: DataPage(),
  ));
}

class DataPage extends StatelessWidget {
  String name = "Luminar";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Passing Data between Screens Using Constructor'),
      ),
      body: Container(
        alignment: Alignment.center,
        height: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => StatelessPage(
                          name: name,
                          location: "Kakkanad",
                          phone: 9876543210)));
                },
                child: const Text("To Stateless Page")),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => StatefulPage(
                          name: name,
                          location: "Kakkanad",
                          phone: 9876543210)));
                },
                child: const Text("To Stateful Page"))
          ],
        ),
      ),
    );
  }
}