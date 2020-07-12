import 'package:flutter/material.dart';
import 'package:health_calculator/BFP/bfp.dart';
import 'package:health_calculator/BMI/bmi.dart';
import 'package:health_calculator/BMR/bmr.dart';
import 'package:health_calculator/CaloricNeeds/caloricNeeds.dart';
import 'package:health_calculator/IdealWeight/idealWeight.dart';
import 'package:health_calculator/WaterIntake/waterIntake.dart';


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health Calculator'),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(11, 61, 145, 1.0),
      ),
      backgroundColor: Color.fromRGBO(235, 241, 246, 1.0),
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: CustomScrollView(
            slivers: <Widget>[menus()],
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
          ),
        ),
      ),
    );
  }
}

SliverGrid menus() {
  return SliverGrid(
    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: 200.0,
      mainAxisSpacing: 20.0,
      crossAxisSpacing: 0.0,
      childAspectRatio: 1.0,
    ),
    delegate: SliverChildBuilderDelegate(
      (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            //apply switch case
            var router = MaterialPageRoute(builder: (BuildContext context) {
              return getPage(index);
            });
            Navigator.of(context).push(router);
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Material(
              elevation: 6.0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Container(
                      child: Image.asset(getImage(index)),
                      height: 70,
                      width: 70,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      getText(index),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      childCount: 6,
    ),
  );
}

String getText(int index) {
  switch (index) {
    case 0:
      return 'BMI';
      break;
    case 1:
      return 'BMR';
      break;
    case 2:
      return 'Caloric Needs';
      break;

    case 3:
      return 'BFP';
      break;

    case 4:
      return 'Water Intake';
      break;

    case 5:
      return 'Ideal Weight';
      break;
  }
}

String getImage(int index) {
  switch (index) {
    case 0:
      return 'images/bmi.png';
      break;
    case 1:
      return 'images/bmr.png';
      break;
    case 2:
      return 'images/calories.png';
      break;
    case 3:
      return 'images/bfp.png';
      break;
    case 4:
      return 'images/water_intake.png';
      break;

    case 5:
      return 'images/ideal_weight.png';
      break;
  }
}

getPage(int index) {
  switch (index) {
    case 0:
      return Bmi();
      break;
    case 1:
      return Bmr();
      break;
    case 2:
      return CaloricNeeds();
      break;
    case 3:
      return Bfp();
      break;
    case 4:
      return WaterIntake();
      break;

    case 5:
      return IdealWeight();
      break;
  }
}
