import 'dart:js';

import 'package:flutter/material.dart';
import 'package:project_application1/passing_data_btwn_scrns/datailspage.dart';
import 'package:project_application1/passing_data_btwn_scrns/dummydata.dart';

void main(){
  runApp(MaterialApp(home: PrdctHome(),
  routes: {
    'details' :(context) => ProductDetails(),
  },
  ));
}

class PrdctHome extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Shop Now"),
      ),
      body: ListView(
        children: products.map((productonebyone) => Card(
          child: ListTile(
            leading: Container(
                height:100,
                width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(productonebyone["image1"])))
            ),
            title: Text(productonebyone["name"]),
            subtitle: Text('\$ ${productonebyone['price']}'),
            onTap: (){
              gotoNextPage(context,productonebyone['id']);
            }
          ),
        )).toList(),
      ),
    );
  }
}

void gotoNextPage(BuildContext context, productId) { //
 Navigator.pushNamed(context, 'details',arguments:productId);
}
