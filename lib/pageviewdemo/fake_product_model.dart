class FakeProductModel {
  String productImageUrl;
  String title;
  int actualPrice;
  double rating;
  int discountedPrice;

  FakeProductModel({
    required this.productImageUrl,
    required this.title,
    required this.actualPrice,
    required this.rating,
    required this.discountedPrice
  });

  @override
  String toString() {
    return "Product details title $title and its price $actualPrice";
  }

}