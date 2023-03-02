class HomeModel {
  String jamCuaca, kodeCuaca, humidity, cuaca, tempC, tempF;

  HomeModel(
      {required this.jamCuaca,
      required this.kodeCuaca,
      required this.humidity,
      required this.cuaca,
      required this.tempC,
      required this.tempF});

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
        cuaca: json['cuaca'],
        tempC: json['tempC'],
        jamCuaca: json['jamCuaca'],
        humidity: json['humidity'],
        kodeCuaca: json['kodeCuaca'],
        tempF: json['tempF']);
  }
}
