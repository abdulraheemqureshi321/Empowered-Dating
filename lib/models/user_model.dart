class UserModel {
  String? uid;
  String name;
  String location;
  String profileImageUrl;
  String job;
  String aboutMe;

  UserModel({
    required this.uid,
    required this.name,
    required this.location,
    required this.profileImageUrl,
    required this.job,
    required this.aboutMe,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      name: json['name'] ,
      location: json['location'] ,
      profileImageUrl: json['imageUrl'] ,
      job: json['job'] ,
      aboutMe : json['about_me']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'location': location,
      'imageUrl': profileImageUrl,
      'job': job,
      'about_me' : aboutMe
    };
  }
}
