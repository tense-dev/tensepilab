class ProfileModel {
  //Filed
  String title, url;

  //Construtor
  ProfileModel(this.title, this.url);

  ProfileModel.fromAPI(Map<String, dynamic> fromJson) {
    title = fromJson['title'];
    url = fromJson['url'];
  }
}
