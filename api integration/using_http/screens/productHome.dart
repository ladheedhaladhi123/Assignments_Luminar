import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_application1/api%20integration/using_http/controller/product%20controller.dart';
import 'package:project_application1/api%20integration/using_http/screens/productTile.dart';

void main(){
  runApp(MaterialApp(
    home: ProductHome(),));
}
class ProductHome extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  // Get.put(productController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text("Products"),
     ),
      body: SizedBox(
        child: Obx((){
          if(productController.isLoading.value){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else{
            return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
                itemCount: productController.productList.length,
                itemBuilder: (context, index){
              return ProductTile(productController.productList[index]);
                });
          }
        },)
      ),
    );
  }
}
