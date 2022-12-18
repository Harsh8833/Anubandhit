class JobModel {
  int current_vacancy;
  String duration;
  List<dynamic> eligibility;
  String image;
  String location;
  String name;
  String pay;
  bool payment_verified;
  String start_date;
  int total_vacancy;
  String type;
  String company_name;
  JobModel(
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
      this.company_name);
}
