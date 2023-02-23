class PrecenseModel {
  final List<PrecenseItem>? dataPrecense;
  PrecenseModel({required this.dataPrecense});

  factory PrecenseModel.fromJson(Map<String, dynamic> json) => PrecenseModel(
      dataPrecense: List<PrecenseItem>.from((json['datas'] as List)
          .map((e) => PrecenseItem.fromJson(e))
          .where((data) => data.id != null)));
}

class PrecenseItem {
  final String? id;
  final String? status;
  final String? place;
  final String? inn;
  final String? date;
  final String? addres;

  PrecenseItem(
      {required this.id,
      required this.status,
      required this.place,
      required this.inn,
      required this.date,
      required this.addres});

  factory PrecenseItem.fromJson(Map<String, dynamic> json) => PrecenseItem(
      id: json['_id'],
      status: json['status'],
      place: json['place'],
      date: json['date'],
      inn: json['in'],
      addres: json['address']);
}
