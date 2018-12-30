import 'package:biodata_app/model/biodata_model.dart';
import 'package:flutter/material.dart';

class BiodataDetail extends StatelessWidget {
  Biodata biodata;

  BiodataDetail(this.biodata);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Biodata Detail"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}
