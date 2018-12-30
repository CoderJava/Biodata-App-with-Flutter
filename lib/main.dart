import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MainScreen(),
    ));

class MainScreen extends StatefulWidget {
  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  var _genderValue = "";
  var _listDayBirth = List<DropdownMenuItem<int>>();
  var _listMonthBirth = List<DropdownMenuItem<int>>();
  var _listYearBirth = List<DropdownMenuItem<int>>();
  var _currentDayBirth = DateTime.now().day;
  var _currentMonthBirth = DateTime.now().month;
  var _currentYearBirth = DateTime.now().year;

  @override
  void initState() {
    initDropdownDateBirth();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Biodata"),
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Fullname",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            TextField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
            ),
            Divider(
              color: Colors.transparent,
              height: 24.0,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Gender",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Radio(
                        value: "male",
                        groupValue: _genderValue,
                        onChanged: (value) {
                          _handleChangedRadioGender(value);
                        },
                      ),
                      Text("Male"),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Radio(
                        value: "female",
                        groupValue: _genderValue,
                        onChanged: (value) {
                          _handleChangedRadioGender(value);
                        },
                      ),
                      Text("Female"),
                    ],
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.transparent,
              height: 24.0,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Birth of Date",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Row(
              children: <Widget>[
                DropdownButton(
                  items: _listDayBirth,
                  value: _currentDayBirth,
                  onChanged: (value) {
                    setState(() {
                      _currentDayBirth = value;
                    });
                  },
                ),
                Divider(color: Colors.transparent, indent: 16.0),
                DropdownButton(
                  items: _listMonthBirth,
                  value: _currentMonthBirth,
                  onChanged: (value) {
                    setState(() {
                      _currentMonthBirth = value;
                      bool isLeapYear = _checkIsLeapYear(_currentYearBirth);
                      _listDayBirth =
                          initListDayBirth(_currentMonthBirth, isLeapYear);
                      if (isLeapYear && _currentMonthBirth == 2) {
                        _currentDayBirth =
                            (_currentDayBirth > 29) ? 29 : _currentDayBirth;
                      } else if (_currentDayBirth > 30 &&
                          (_currentMonthBirth == 4 ||
                              _currentMonthBirth == 6 ||
                              _currentMonthBirth == 9 ||
                              _currentMonthBirth == 10)) {
                        _currentDayBirth = 30;
                      }
                    });
                  },
                ),
                Divider(color: Colors.transparent, indent: 16.0),
                DropdownButton(
                  items: _listYearBirth,
                  value: _currentYearBirth,
                  onChanged: (value) {
                    setState(() {
                      _currentYearBirth = value;
                      bool isLeapYear = _checkIsLeapYear(_currentYearBirth);
                      _listDayBirth =
                          initListDayBirth(_currentMonthBirth, isLeapYear);
                      if (isLeapYear && _currentMonthBirth == 2) {
                        _currentDayBirth =
                            (_currentDayBirth > 29) ? 29 : _currentDayBirth;
                      }
                    });
                  },
                ),
              ],
            ),
            Divider(
              color: Colors.transparent,
              height: 24.0,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Address",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            TextField(
              keyboardType: TextInputType.text,
            ),
          ],
        ),
      ),
    );
  }

  void _handleChangedRadioGender(value) {
    setState(() {
      _genderValue = value;
    });
  }

  void initDropdownDateBirth() {
    var now = DateTime.now();
    bool isLeapYear = _checkIsLeapYear(now.year);
    for (int a = 0; a < 100; a++) {
      int itemYear = now.year - a;
      _listYearBirth.add(DropdownMenuItem<int>(
        value: itemYear,
        child: Text("$itemYear"),
      ));
    }

    for (int a = 1; a <= 12; a++) {
      _listMonthBirth.add(DropdownMenuItem<int>(
        value: a,
        child: _buildChildTextMonth(a),
      ));
    }

    _listDayBirth = initListDayBirth(now.month, isLeapYear);
  }

  bool _checkIsLeapYear(int year) {
    return (year % 4 == 0 && year % 100 != 0) || year % 400 == 0;
  }

  List<DropdownMenuItem<int>> initListDayBirth(int month, bool isLeapYear) {
    /**
     * januari = 31 hari
     * februari = 28 hari (29 hari kabisat)
     * maret = 31 hari
     * april = 30 hari
     * mei = 31 hari
     * juni = 30 hari
     * juli = 31 hari
     * agustus = 31 hari
     * september = 30 hari
     * oktober = 31 hari
     * november = 30 hari
     * desember = 31 hari
     */
    List<DropdownMenuItem<int>> listDayBirthTemp =
        List<DropdownMenuItem<int>>();
    switch (month) {
      case 1:
      case 3:
      case 5:
      case 7:
      case 8:
      case 10:
      case 12:
        for (int a = 1; a <= 31; a++) {
          listDayBirthTemp.add(DropdownMenuItem<int>(
            value: a,
            child: Text("$a"),
          ));
        }
        break;
      case 2:
        for (int a = 1; a <= 28; a++) {
          listDayBirthTemp.add(DropdownMenuItem<int>(
            value: a,
            child: Text("$a"),
          ));
          if (a == 28 && isLeapYear) {
            listDayBirthTemp.add(DropdownMenuItem<int>(
              value: 29,
              child: Text("29"),
            ));
          }
        }
        break;
      default:
        for (int a = 1; a <= 30; a++) {
          listDayBirthTemp.add(DropdownMenuItem<int>(
            value: a,
            child: Text("$a"),
          ));
        }
    }
    return listDayBirthTemp;
  }

  _buildChildTextMonth(int month) {
    switch (month) {
      case 1:
        return Text("Januari");
      case 2:
        return Text("Februari");
      case 3:
        return Text("Maret");
      case 4:
        return Text("April");
      case 5:
        return Text("Mei");
      case 6:
        return Text("Juni");
      case 7:
        return Text("Juli");
      case 8:
        return Text("Agustus");
      case 9:
        return Text("September");
      case 10:
        return Text("Oktober");
      case 11:
        return Text("November");
      case 12:
        return Text("Desember");
      default:
        return Text("-");
    }
  }
}
