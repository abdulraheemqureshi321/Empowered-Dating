class UserModel {
  String? uid;
  String name;
  String location;
  String profileImageUrl;
  String job;
  String aboutMe;
  String interest;
  String collage;
  String company;

  UserModel({
    required this.uid,
    required this.name,
    required this.location,
    required this.profileImageUrl,
    required this.job,
    required this.aboutMe,
    required this.interest,
    required this.collage,
    required this.company
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['Uid'],
      name: json['name'] ,
      location: json['location'] ,
      profileImageUrl: json['imageUrl'] ,
      job: json['job'] ,
      aboutMe : json['about_me'],
      interest : json['interest'],
      collage: json['collage'],
      company: json['company']
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
      'interest' : interest,
      'collage' : collage,
      'company' : company
    };
  }

  UserModel copyWith({
    String? uid,
    String? name,
    String? location,
    String? profileImageUrl,
    String? job,
    String? aboutMe,
    String? interest,
    String? collage,
    String? company,
}){
    return UserModel(
        uid: uid ?? this.uid,
        name: name ?? this.name,
        location: location ?? this.location,
        profileImageUrl: profileImageUrl ?? this.profileImageUrl,
        job: job ?? this.job,
        aboutMe: aboutMe ?? this.aboutMe,
        interest: interest ?? this.interest,
        collage: collage ?? this.collage,
        company: company ?? this.company
    );
}
}
