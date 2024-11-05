class Person {
  String name;
  int age;
  String country;

  Person({
    required this.name,
    required this.age,
    required this.country,
  });

  Person copyWith({
    String? name,
    int? age,
    String? country,
}){
    return Person(name: name ?? this.name, age: age ?? this.age, country: country ?? this.country);
  }

  Person clone(){
    return copyWith(name: name, age : age, country: country);
  }

  void setter({
    String? name,
    int? age,
    String? country,
  }){
    this.name = name ?? this.name;
    this.age = age ?? this.age;
    this.country = country ?? this.country;
  }
}
