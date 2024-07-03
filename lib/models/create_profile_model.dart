class CreateProfile {
  String id;
  String name;
  String location;
  String job;
  String company;
  String collage;
  String interest;
  String aboutMe;
  String imageUrl;


  CreateProfile(
      {required this.id,
      required this.name,
      required this.location,
      required this.job,
      required this.company,
      required this.aboutMe,
      required this.collage,
      required this.imageUrl,
      required this.interest
      });

  factory CreateProfile.fromMap(Map<String, dynamic> data , String documentId){
    return CreateProfile(
        id: documentId,
        name: data['name'],
        location: data['location'],
        job: data['job'],
        company: data['company'],
        aboutMe: data['aboutMe'],
        collage: data['college'],
        imageUrl: data['imageUrl'],
        interest: data['interest']);
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'location' : location,
      'job': job,
      'company' : company,
      'aboutMe' : aboutMe,
      'college' : collage,
      'interest' : interest,
      'imageUrl': imageUrl,
    };
  }
}
