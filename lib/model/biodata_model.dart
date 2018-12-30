class Biodata {
  String fullname;
  String gender;
  String dateOfBirth;
  String address;

  Biodata(
      {String fullname = "",
      String gender = "",
      String dateOfBirth = "",
      String address = ""}) {
    this.fullname = fullname;
    this.gender = gender;
    this.dateOfBirth = dateOfBirth;
    this.address = address;
  }
}
