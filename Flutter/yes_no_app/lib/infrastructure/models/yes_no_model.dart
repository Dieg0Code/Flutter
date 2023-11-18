class YesNoModel {
  String answer;
  bool forced;
  String imageUrl;

  YesNoModel({
    required this.answer,
    required this.forced,
    required this.imageUrl,
  });

  factory YesNoModel.fromJson(Map<String, dynamic> json) {
    return YesNoModel(
      answer: json['answer'],
      forced: json['forced'],
      imageUrl: json['image'],
    );
  }
}
