class Order {
  int? id;
  Cart? cart;
  String? email;
  String? phone;
  String? address;
  String? createdAt;

  Order(
      {this.id,
      this.cart,
      this.email,
      this.phone,
      this.address,
      this.createdAt});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cart = json['cart'] != null ? new Cart.fromJson(json['cart']) : null;
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.cart != null) {
      data['cart'] = this.cart!.toJson();
    }
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['created_at'] = this.createdAt;
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
