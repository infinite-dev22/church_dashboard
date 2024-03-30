class CountModel {
  CountModel({
    required this.dateJoined,
    required this.count,
  });

  final double dateJoined;
  final double count;

  factory CountModel.fromJson(Map<String, dynamic> json) {
    return CountModel(
      dateJoined: DateTime.fromMillisecondsSinceEpoch(json["dateJoined"] * 1000).month.toDouble(),
      count: double.parse(json["count"].toString()),
    );
  }

  Map<String, dynamic> toJson() => {
        "dateJoined": dateJoined,
        "count": count,
      };
}
