class Character {
  int? _id;
  String? _name;
  String? _status;
  String? _species;
  String? _type;
  String? _gender;
  Origin? _origin;
  Origin? _location;
  String? _image;
  List<String>? _episode;
  String? _url;
  String? _created;

  Character(
      {int? id,
        String? name,
        String? status,
        String? species,
        String? type,
        String? gender,
        Origin? origin,
        Origin? location,
        String? image,
        List<String>? episode,
        String? url,
        String? created}) {
    if (id != null) {
      _id = id;
    }
    if (name != null) {
      _name = name;
    }
    if (status != null) {
      _status = status;
    }
    if (species != null) {
      _species = species;
    }
    if (type != null) {
      _type = type;
    }
    if (gender != null) {
      _gender = gender;
    }
    if (origin != null) {
      _origin = origin;
    }
    if (location != null) {
      _location = location;
    }
    if (image != null) {
      _image = image;
    }
    if (episode != null) {
      _episode = episode;
    }
    if (url != null) {
      _url = url;
    }
    if (created != null) {
      _created = created;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get status => _status;
  set status(String? status) => _status = status;
  String? get species => _species;
  set species(String? species) => _species = species;
  String? get type => _type;
  set type(String? type) => _type = type;
  String? get gender => _gender;
  set gender(String? gender) => _gender = gender;
  Origin? get origin => _origin;
  set origin(Origin? origin) => _origin = origin;
  Origin? get location => _location;
  set location(Origin? location) => _location = location;
  String? get image => _image;
  set image(String? image) => _image = image;
  List<String>? get episode => _episode;
  set episode(List<String>? episode) => _episode = episode;
  String? get url => _url;
  set url(String? url) => _url = url;
  String? get created => _created;
  set created(String? created) => _created = created;

  Character.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _status = json['status'];
    _species = json['species'];
    _type = json['type'];
    _gender = json['gender'];
    _origin =
    json['origin'] != null ? Origin.fromJson(json['origin']) : null;
    _location =
    json['location'] != null ? Origin.fromJson(json['location']) : null;
    _image = json['image'];
    _episode = json['episode'].cast<String>();
    _url = json['url'];
    _created = json['created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = _id;
    data['name'] = _name;
    data['status'] = _status;
    data['species'] = _species;
    data['type'] = _type;
    data['gender'] = _gender;
    if (_origin != null) {
      data['origin'] = _origin!.toJson();
    }
    if (_location != null) {
      data['location'] = _location!.toJson();
    }
    data['image'] = _image;
    data['episode'] = _episode;
    data['url'] = _url;
    data['created'] = _created;
    return data;
  }
}

class Origin {
  String? _name;
  String? _url;

  Origin({String? name, String? url}) {
    if (name != null) {
      _name = name;
    }
    if (url != null) {
      _url = url;
    }
  }

  String? get name => _name;
  set name(String? name) => _name = name;
  String? get url => _url;
  set url(String? url) => _url = url;

  Origin.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      'name' : _name,
      'url' : _url,
    };
    return data;
  }
}

