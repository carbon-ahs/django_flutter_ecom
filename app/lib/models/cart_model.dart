class CartModel {
  int? id;
  int? user;
  int? total;
  bool? isComplete;
  String? createdAt;
  List<CartProducts>? cartProducts;

  CartModel(
      {this.id,
      this.user,
      this.total,
      this.isComplete,
      this.createdAt,
      this.cartProducts});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    total = json['total'];
    isComplete = json['is_complete'];
    createdAt = json['created_at'];
    if (json['cart_products'] != null) {
      cartProducts = <CartProducts>[];
      json['cart_products'].forEach((v) {
        cartProducts!.add(new CartProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user'] = this.user;
    data['total'] = this.total;
    data['is_complete'] = this.isComplete;
    data['created_at'] = this.createdAt;
    if (this.cartProducts != null) {
      data['cart_products'] =
          this.cartProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CartProducts {
  int? id;
  Cart? cart;
  List<Product>? product;
  int? price;
  int? quantity;
  int? subtotal;

  CartProducts(
      {this.id,
      this.cart,
      this.product,
      this.price,
      this.quantity,
      this.subtotal});

  CartProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cart = json['cart'] != null ? new Cart.fromJson(json['cart']) : null;
    if (json['product'] != null) {
      product = <Product>[];
      json['product'].forEach((v) {
        product!.add(new Product.fromJson(v));
      });
    }
    price = json['price'];
    quantity = json['quantity'];
    subtotal = json['subtotal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.cart != null) {
      data['cart'] = this.cart!.toJson();
    }
    if (this.product != null) {
      data['product'] = this.product!.map((v) => v.toJson()).toList();
    }
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['subtotal'] = this.subtotal;
    return data;
  }
}

class Cart {
  int? id;
  int? user;
  int? total;
  bool? isComplete;
  String? createdAt;

  Cart({this.id, this.user, this.total, this.isComplete, this.createdAt});

  Cart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    total = json['total'];
    isComplete = json['is_complete'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user'] = this.user;
    data['total'] = this.total;
    data['is_complete'] = this.isComplete;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class Product {
  int? id;
  String? title;
  String? createdAt;
  String? image;
  int? marketPrice;
  int? sellingPrice;
  String? description;
  Category? category;

  Product(
      {this.id,
      this.title,
      this.createdAt,
      this.image,
      this.marketPrice,
      this.sellingPrice,
      this.description,
      this.category});

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
