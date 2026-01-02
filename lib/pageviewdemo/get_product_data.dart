import 'package:tcslearnapp/pageviewdemo/fake_product_model.dart';

class GetProductData {
  List<FakeProductModel> prepareProductList(){
    List<FakeProductModel> productList = [];
    FakeProductModel productOne = FakeProductModel(
        productImageUrl: "https://fastly.picsum.photos/id/7/4728/316812345.jpg?hmac=c5B5tfYFM9blHHMhuu4UKmhnbZoJqrzNOP9xjkV4w3o",
        title: "Portrait",
        actualPrice: 3000,
        rating: 4.5,
        discountedPrice: 2000
    );

    FakeProductModel productTwo = FakeProductModel(
        productImageUrl: "https://fastly.picsum.photos/id/27/3264/1836.jpg?hmac=p3BVIgKKQpHhfGRRCbsi2MCAzw8mWBCayBsKxxtWO8g",
        title: "Man doing fishing",
        actualPrice: 400,
        rating: 4.5,
        discountedPrice: 350
    );

    FakeProductModel productThree = FakeProductModel(
        productImageUrl: "https://fastly.picsum.photos/id/26/4209/2769.jpg?hmac=vcInmowFvPCyKGtV7Vfh7zWcA_Z0kStrPDW3ppP0iGI",
        title: "Men's Accessories",
        actualPrice: 4000,
        rating: 4.5,
        discountedPrice: 3800
    );

    FakeProductModel productFour = FakeProductModel(
        productImageUrl: "https://fastly.picsum.photos/id/9/5000/3269.jpg?hmac=cZKbaLeduq7rNB8X-bigYO8bvPIWtT-mh8GRXtU3vPc",
        title: "Macbook",
        actualPrice: 93000,
        rating: 4.0,
        discountedPrice: 92000
    );

    FakeProductModel productFive = FakeProductModel(
        productImageUrl: "https://fastly.picsum.photos/id/21/3008/2008.jpg?hmac=T8DSVNvP-QldCew7WD4jj_S3mWwxZPqdF0CNPksSko4",
        title: "Female Shoes",
        actualPrice: 6000,
        rating: 3.5,
        discountedPrice: 5500
    );

    productList.add(productOne);
    productList.add(productTwo);
    productList.add(productThree);
    productList.add(productFour);
    productList.add(productFive);

    return productList;
  }
}