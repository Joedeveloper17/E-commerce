import 'package:apk/producttile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

import 'product_controler.dart';

class HomePage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  
  var StaggeredTile;

   HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        
        appBar: AppBar(
          
          elevation: 0,
          leading: Icon(
            Icons.arrow_back_ios,
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
              
              },
            )
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'ShopX',
                      style: TextStyle(
                          fontFamily: 'avenir',
                          fontSize: 32,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  IconButton(
                      icon: Icon(Icons.view_list_rounded), onPressed: () {
                        
                        
                      }),
                  IconButton(icon: Icon(Icons.grid_view), onPressed: () {}),
                  IconButton(onPressed: (){
                 
                  }, icon: Icon(Icons.card_membership))
                ],
              ),
            ),
            Expanded(
              
              child: Obx(() {
                if (productController.isLoading.value)
                  return Center(child: CircularProgressIndicator());
                else {
               
                  return MasonryGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 16,
      itemCount: productController.productList.length,
      crossAxisSpacing: 16,
      itemBuilder: (context, index) {
      return ProductTile(productController.productList[index]);
      },
      
       
    );
                }
              }),
            )
          ],
        ),
      ),
    );
  }
}
