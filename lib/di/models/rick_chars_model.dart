class MovieCharModel {
  int id;
  String name;
  String species;
  String type;
  String gender;
  MovieCharOriginModel origin;
  MovieCharLocation location;
  String imageURI;

  MovieCharModel(
      {this.name,
      this.id,
      this.gender,
      this.imageURI,
      this.location,
      this.origin,
      this.species,
      this.type});
}

class MovieCharOriginModel {
  String name;
  String url;

  MovieCharOriginModel({this.name, this.url});
}

class MovieCharLocation {
  String name;
  String url;

  MovieCharLocation({this.name, this.url});
}
