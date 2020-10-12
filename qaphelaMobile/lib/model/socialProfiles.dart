class SocialProfiles {
  int id;
  String name;
  String profilePage;

  SocialProfiles({this.id, this.name, this.profilePage});

  SocialProfiles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    profilePage = json['profile_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['profile_page'] = this.profilePage;
    return data;
  }
}