class Catatan {
  int _id;
  String _persamaan;
  String _akar1;
  String _akar2;
  
  Catatan(this._persamaan, this._akar1, this._akar2);

  Catatan.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._persamaan = map['persamaan'];
    this._akar1 = map['akar1'];
    this._akar2 = map['akar2'];
  }

  // getter
  int get id => _id;
  String get persamaan => _persamaan;
  String get akar1 => _akar1;
  String get akar2 => _akar2;

  // setter
  set persamaan(String value) {
    _persamaan = value;
  }

  set akar1(String value) {
    _akar1 = value;
  }

  set akar2(String value) {
    _akar2 = value;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['persamaan'] = persamaan;
    map['akar1'] = akar1;
    map['akar2'] = akar2;
    return map;
  }
}