class CountModel {
  CountModel({
    required this.dateJoined,
    required this.count,
  });

  final int? dateJoined;
  final int? count;

  CountModel copyWith({
    int? dateJoined,
    int? count,
  }) {
    return CountModel(
      dateJoined: dateJoined ?? this.dateJoined,
      count: count ?? this.count,
    );
  }

  factory CountModel.fromJson(Map<String, dynamic> json) {
    return CountModel(
      dateJoined: json["dateJoined"],
      count: json["count"],
    );
  }

  Map<String, dynamic> toJson() => {
        "dateJoined": dateJoined,
        "count": count,
      };
}
