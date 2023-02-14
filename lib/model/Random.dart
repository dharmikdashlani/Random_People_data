class Random {
  final String gender;
  final String title;
  final String firstname;
  final String lastname;
  final String streetname;
  final String city;
  final String state;
  final String country;
  final String email;
  final String dobdate;
  final int age;
  final String phone;
  final String largeImage;

  Random({
    required this.gender,
    required this.title,
    required this.firstname,
    required this.lastname,
    required this.streetname,
    required this.city,
    required this.state,
    required this.country,
    required this.email,
    required this.dobdate,
    required this.age,
    required this.phone,
    required this.largeImage,
  });

  factory Random.fromMap({required Map json}) {
    return Random(
      gender: json['results'][0]['gender'],
      title: json['results'][0]['name']['title'],
      firstname: json['results'][0]['name']['first'],
      lastname: json['results'][0]['name']['last'],
      streetname: json['results'][0]['location']['street']['name'],
      city: json['results'][0]['location']['city'],
      state: json['results'][0]['location']['state'],
      country: json['results'][0]['location']['country'],
      email: json['results'][0]['email'],
      dobdate: json['results'][0]['dob']['date'],
      age:  json['results'][0]['dob']['age'],
      phone: json['results'][0]['phone'],
      largeImage: json['results'][0]['picture']['large'],
    );
  }
}
