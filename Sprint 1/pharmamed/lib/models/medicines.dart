class Medicine {
  dynamic _id;
  dynamic _name;
  dynamic _generic;
  dynamic _price;
  dynamic _quantity;
  dynamic _description;
  dynamic _image;

  dynamic get id => id;

  set id(dynamic id) {
    _id = id;
  }

  dynamic get name => _name;

  set name(dynamic name) {
    _name = name;
  }

  dynamic get generic => _generic;

  set generic(dynamic generic) {
    _generic = generic;
  }

  dynamic get price => _price;

  set price(dynamic price) {
    _price = price;
  }

  dynamic get quantity => _quantity;

  set quantity(dynamic quantity) {
    _quantity = quantity;
  }

  dynamic get description => _description;

  set description(dynamic description) {
    _description = description;
  }

  dynamic get image => _image;

  set image(dynamic image) {
    _image = image;
  }

  Medicine(this._name, this._generic, this._price, this._quantity,
      this._description, this._image);

  Medicine.fromJson(Map<String, dynamic> json)
      : _name = json['name'],
        _generic = json['generic'],
        _price = json['price'],
        _quantity = json['quantity'],
        _description = json['description'],
        _image = json['image'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'generic': generic,
        'price': price,
        'quantity': quantity,
        'description': description,
        'image': image,
      };
}
