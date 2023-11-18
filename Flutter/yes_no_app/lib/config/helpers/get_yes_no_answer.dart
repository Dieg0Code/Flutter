// String yesNoModelToJson(YesNoModel data) => json.encode(data.toJson());

class YesNoModel {
  YesNoModel({
    required this.answer,
    required this.forced,
    required this.imageUrl,
  });

  String answer;
  bool forced;
  String imageUrl;

  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        imageUrl: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": imageUrl,
      };
}
