class Product {
  int? id;
  String? title;
  String? createdAt;
  String? image;
  int? marketPrice;
  int? sellingPrice;
  String? description;
  Category? category;
  bool? isFavorite;

  Product(
      {this.id,
      this.title,
      this.createdAt,
      this.image,
      this.marketPrice,
      this.sellingPrice,
      this.description,
      this.category,
      this.isFavorite});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    createdAt = json['created_at'];
    image = json['image'];
    marketPrice = json['market_price'];
    sellingPrice = json['selling_price'];
    description = json['description'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    isFavorite = json['is_favorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['created_at'] = this.createdAt;
    data['image'] = this.image;
    data['market_price'] = this.marketPrice;
    data['selling_price'] = this.sellingPrice;
    data['description'] = this.description;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['is_favorite'] = this.isFavorite;
    return data;
  }
}

class Category {
  int? id;
  String? title;
  String? createdAt;

  Category({this.id, this.title, this.createdAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['created_at'] = this.createdAt;
    return data;
  }
}
