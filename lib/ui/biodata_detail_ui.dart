import 'package:biodata_app/model/biodata_model.dart';
import 'package:flutter/material.dart';

class BiodataDetail extends StatelessWidget {
  Biodata _biodata;

  var _textEditingControllerFullname = TextEditingController();
  var _textEditingControllerGender = TextEditingController();
  var _textEditingControllerBirthDate = TextEditingController();
  var _textEditingControllerAddress = TextEditingController();

  BiodataDetail(this._biodata) {
    _textEditingControllerFullname.text = _biodata.fullname;
    _textEditingControllerGender.text = _biodata.gender;
    _textEditingControllerBirthDate.text = _biodata.dateOfBirth;
    _textEditingControllerAddress.text = _biodata.address;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Biodata Detail"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _textEditingControllerFullname,
                enabled: false,
                decoration: buildInputDecorationBiodata(
                  iconData: Icons.account_box,
                  labelText: "Fullname",
                ),
              ),
              Divider(
                height: 24.0,
                color: Colors.transparent,
              ),
              TextField(
                controller: _textEditingControllerGender,
                enabled: false,
                decoration: buildInputDecorationBiodata(
                  iconData: Icons.label,
                  labelText: "Gender",
                ),
              ),
              Divider(
                height: 24.0,
                color: Colors.transparent,
              ),
              TextField(
                controller: _textEditingControllerBirthDate,
                enabled: false,
                decoration: buildInputDecorationBiodata(
                  iconData: Icons.date_range,
                  labelText: "Birth Date",
                ),
              ),
              Divider(
                height: 24.0,
                color: Colors.transparent,
              ),
              TextField(
                controller: _textEditingControllerAddress,
                enabled: false,
                decoration: buildInputDecorationBiodata(
                  iconData: Icons.home,
                  labelText: "Address",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration buildInputDecorationBiodata(
      {IconData iconData, String labelText}) {
    return InputDecoration(
        icon: Icon(
          iconData,
          size: 24.0,
        ),
        border: InputBorder.none,
        labelText: labelText);
  }
}
