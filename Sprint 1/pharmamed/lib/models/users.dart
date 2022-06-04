class Users {
  dynamic fname;
  dynamic uname;
  dynamic phone;
  dynamic role;

  Users(this.fname, this.uname, this.phone, this.role);

  Users.fromJson(Map<String, dynamic> json)
      : fname = json['fname'],
        uname = json['uname'],
        phone = json['phone'],
        role = json['role'];

  Map<String, dynamic> toJson() => {
        'fname': fname,
        'uname': uname,
        'phone': phone,
        'role': role,
      };
}
