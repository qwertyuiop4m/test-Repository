import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:httpapi/provider/providers.dart';
import '../model/accid.dart';
void main() {
  runApp(const AccidentScreen());
}
class AccidentScreen extends StatefulWidget {
  const AccidentScreen({Key? key}) : super(key: key);

  @override
  State<AccidentScreen> createState() => _AccidentScreenState();
}

class _AccidentScreenState extends State<AccidentScreen> {
  List<Accident> accident=[];
  bool isLoading=true;
  AccidentProviders accidentProviders=AccidentProviders();
  Future initAccident()async{
    accident=await accidentProviders.getAccident();
  }
  @override
  void initState(){
    super.initState();
    initAccident().then((_) {
      setState(() {
        isLoading=false;
      });
    });
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'test',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.amber,
        accentColor: Colors.amber,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('사고 메시지'),
        ),
        body: isLoading? Center(child: const CircularProgressIndicator(),):
            GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 2/3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20
            ),
                itemCount: accident.length,
              itemBuilder: (context,index){
                return Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(accident[index].title),
                      Text(accident[index].description),
                    ],
                  ),
                );
                }
            )
      ),
    );
  }
}