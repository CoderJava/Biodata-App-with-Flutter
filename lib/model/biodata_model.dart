class Biodata {
  String _fullname;
  String _gender;
  String _dateOfBirth;
  String _address;

  Biodata(
      {String fullname = "",
      String gender = "",
      String dateOfBirth = "",
      String address = ""}) {
    this._fullname = fullname;
    this._gender = gender;
    this._dateOfBirth = dateOfBirth;
    this._address = address;
  }
}
