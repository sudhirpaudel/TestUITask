import 'dart:convert';

List<PartTimeJobModel> partTimeJobModelFromJson(String str) =>
    List<PartTimeJobModel>.from(
        json.decode(str).map((x) => PartTimeJobModel.fromJson(x)));

String partTimeJobModelToJson(List<PartTimeJobModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PartTimeJobModel {
  String jobName;
  String company;
  String salary;
  String date;
  String address;
  String transfortFee;
  String companyName;
  String imageUrl;
  bool favourite;

  PartTimeJobModel({
    required this.jobName,
    required this.company,
    required this.salary,
    required this.date,
    required this.address,
    required this.companyName,
    required this.imageUrl,
    required this.favourite,
    required this.transfortFee,
  });

  factory PartTimeJobModel.fromJson(Map<String, dynamic> json) =>
      PartTimeJobModel(
        jobName: json["jobName"],
        company: json["company"],
        salary: json["salary"],
        date: json["date"],
        address: json["address"],
        companyName: json["companyName"],
        imageUrl: json["imageUrl"],
        favourite:json["favourite"],
        transfortFee:json["transfortFee"]
      );

  Map<String, dynamic> toJson() => {
        "jobName": jobName,
        "company": company,
        "salary": salary,
        "date": date,
        "address": address,
        "companyName": companyName,
        "imageUrl": imageUrl,
        "favourite":favourite,
        "transfortFee":transfortFee
      };
}
