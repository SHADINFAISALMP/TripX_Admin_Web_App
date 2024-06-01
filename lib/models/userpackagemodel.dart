class Travelpackage {
  final List<Traveler>? adults;
  final List<Traveler>? children;
  final int? adultcount;
  final int? childrencount;
  final int? roomscount;

  Travelpackage({
    this.adults,
    this.children,
    this.adultcount,
    this.childrencount,
    this.roomscount,
  });

  factory Travelpackage.fromJson(Map<String, dynamic> json) {
    return Travelpackage(
      adults: (json['adults'] as List<dynamic>?)
          ?.map((e) => Traveler.fromJson(e as Map<String, dynamic>))
          .toList(),
      children: (json['children'] as List<dynamic>?)
          ?.map((e) => Traveler.fromJson(e as Map<String, dynamic>))
          .toList(),
      adultcount: json['adultsCount'] as int?,
      childrencount: json['childrenCount'] as int?,
      roomscount: json['roomsCount'] as int?,
    );
  }
}

class Traveler {
  final String name;
  final int age;

  Traveler({required this.name, required this.age});

  factory Traveler.fromJson(Map<String, dynamic> json) {
    return Traveler(
      name: json['name'] as String,
      age: json['age'] as int,
    );
  }
}
