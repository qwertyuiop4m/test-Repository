import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/accid.dart';

class AccidentScreen extends StatefulWidget {

  @override
  _AccidentScreenState createState() {
    return new _AccidentScreenState();
  }
}

class _AccidentScreenState extends State<AccidentScreen> {

  List<Accident> accident = [];
  bool isLoading = true;


  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("사고 http"),
      ),
      body: isLoading ? Center(child: const CircularProgressIndicator(),) :
      GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20
      ),
          itemCount: accident.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(accident[index].title),
                  Text(accident[index].description),
                ],
              ),
            );
          }),
    );
  }
}