class JobModel {
  String? id;
  int current_vacancy;
  String duration;
  String eligibility;
  Future<String> image;
  String location;
  String name;
  String pay;
  bool payment_verified;
  String start_date;
  int total_vacancy;
  String type;
  final company;
  List enrolled;
  JobModel(
      this.id,
      this.current_vacancy,
      this.duration,
      this.eligibility,
      this.image,
      this.location,
      this.name,
      this.pay,
      this.payment_verified,
      this.start_date,
      this.total_vacancy,
      this.type,
      this.company,
      this.enrolled);
}
