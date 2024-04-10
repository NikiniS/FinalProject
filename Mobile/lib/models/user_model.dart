class Profile {
  String? username;
  String? email;
  String? address;


  Profile({this.username, this.email, this.address});

  Profile.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    address = json['address'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['email'] = this.email;
    data['address'] = this.address;

    return data;
  }
}