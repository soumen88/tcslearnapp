import 'package:flutter/material.dart';
import 'package:tcslearnapp/pageviewdemo/ai_generated_card_item_widget.dart';
import 'package:tcslearnapp/pageviewdemo/fake_product_list_item_widget.dart';
import 'package:tcslearnapp/pageviewdemo/fake_product_model.dart';
import 'package:tcslearnapp/pageviewdemo/get_product_data.dart';

class PageThree extends StatelessWidget{
  List<FakeProductModel> productList = GetProductData().prepareProductList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page Three"),
        backgroundColor: Colors.deepOrange,
      ),
      //backgroundColor: Colors.greenAccent,
      body: Center(
        child: ListView.builder(
            itemCount: productList.length,
            itemBuilder: (BuildContext context, int index){
              FakeProductModel currentProductData = productList[index];
              return FakeProductListItemWidget(
                  currentProduct: currentProductData
              );
              //return AiGeneratedCardItemWidget(product: currentProductData);
            }
        )
      ),
    );
  }

}