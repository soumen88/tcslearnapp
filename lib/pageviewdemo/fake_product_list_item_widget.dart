import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:tcslearnapp/pageviewdemo/fake_product_model.dart';

class FakeProductListItemWidget extends StatelessWidget{
  FakeProductModel currentProduct;

  FakeProductListItemWidget({required this.currentProduct});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12)
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    currentProduct.productImageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (BuildContext context, Object exception, stackTrace){
                      return Icon(
                          Icons.cancel,
                          size: 40,
                          color: Colors.red,
                      );
                    },
                  ),
                ),
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        currentProduct.title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500
                        ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: StarRating(
                        size: 20.0,
                        rating: currentProduct.rating,
                        color: Colors.orange,
                        borderColor: Colors.grey,
                        allowHalfRating: true,
                        //starCount: 5,
                      ),
                    ),
                    Text(
                      "At Discount Price: ${currentProduct.discountedPrice}",
                      style: TextStyle(
                          fontSize: 12,
                      ),
                    ),
                    Text(
                      "Actual Price: ${currentProduct.actualPrice}",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey
                      ),
                    ),
                  ],
                )
            )
          ],
        ),
      )
    );
  }

}