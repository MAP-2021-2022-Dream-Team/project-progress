class Cart {
  dynamic medicine;
  Cart(this.medicine);

  Cart.fromJson(Map<String, dynamic> json) : medicine = json['medicine'];

  Map<String, dynamic> toJson() => {
        'medicine': medicine,
      };
}
