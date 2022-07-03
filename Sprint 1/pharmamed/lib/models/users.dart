class Users {
  dynamic fname;
  dynamic uname;
  dynamic phone;
  dynamic role;
  dynamic cartId;

  dynamic getCartId() {
    return cartId;
  }

  void setCartId(String id) {
    cartId = id;
  }

  Users(this.fname, this.uname, this.phone, this.role, this.cartId);

  Users.fromJson(Map<String, dynamic> json)
      : fname = json['fname'],
        uname = json['uname'],
        phone = json['phone'],
        role = json['role'],
        cartId = json['cart'];

  Map<String, dynamic> toJson() => {
        'fname': fname,
        'uname': uname,
        'phone': phone,
        'role': role,
        'cart': cartId,
      };
}
