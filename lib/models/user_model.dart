class UserModel {
  String? uid;
  String name;
  String location;
  String profileImageUrl;
  String job;
  String aboutMe;
  String interest;

  UserModel({
    required this.uid,
    required this.name,
    required this.location,
    required this.profileImageUrl,
    required this.job,
    required this.aboutMe,
    required this.interest
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['Uid'],
      name: json['name'] ,
      location: json['location'] ,
      profileImageUrl: json['imageUrl'] ,
      job: json['job'] ,
      aboutMe : json['about_me'],
      interest : json['interest']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'location': location,
      'imageUrl': profileImageUrl,
      'job': job,
      'about_me' : aboutMe,
      'interest' : interest
    };
  }
}
