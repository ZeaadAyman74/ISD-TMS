
class ValidationModel  {
  const ValidationModel({
    this.name,
    this.date,
  });

  final String? name;
  final String? date;

  factory ValidationModel.fromJson(Map<String, dynamic> json) {
    return ValidationModel(
      name: json["username"][0],
      date: json["date"][0],
    );
  }

  Map<String,dynamic>toJson()=>{
    'name':name,
    'date':date
  };

}
