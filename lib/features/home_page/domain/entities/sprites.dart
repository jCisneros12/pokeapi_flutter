class Sprites {
  String frontDefault;
  Other other;

  Sprites({
    this.frontDefault,
    this.other,
  });

  Sprites.fromJson(Map<String, dynamic> json) {
    frontDefault = json['front_default'];
    other = json['other'] != null ? new Other.fromJson(json['other']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['front_default'] = this.frontDefault;
    if (this.other != null) {
      data['other'] = this.other.toJson();
    }
    return data;
  }
}

class Other {
  DreamWorld dreamWorld;
  OfficialArtwork officialArtwork;

  Other({this.dreamWorld, this.officialArtwork});

  Other.fromJson(Map<String, dynamic> json) {
    dreamWorld = json['dream_world'] != null
        ? new DreamWorld.fromJson(json['dream_world'])
        : null;
    officialArtwork = json['official-artwork'] != null
        ? new OfficialArtwork.fromJson(json['official-artwork'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dreamWorld != null) {
      data['dream_world'] = this.dreamWorld.toJson();
    }
    if (this.officialArtwork != null) {
      data['official-artwork'] = this.officialArtwork.toJson();
    }
    return data;
  }
}

class DreamWorld {
  String frontDefault;
  Null frontFemale;

  DreamWorld({this.frontDefault, this.frontFemale});

  DreamWorld.fromJson(Map<String, dynamic> json) {
    frontDefault = json['front_default'];
    frontFemale = json['front_female'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['front_default'] = this.frontDefault;
    data['front_female'] = this.frontFemale;
    return data;
  }
}

class OfficialArtwork {
  String frontDefault;

  OfficialArtwork({this.frontDefault});

  OfficialArtwork.fromJson(Map<String, dynamic> json) {
    frontDefault = json['front_default'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['front_default'] = this.frontDefault;
    return data;
  }
}
