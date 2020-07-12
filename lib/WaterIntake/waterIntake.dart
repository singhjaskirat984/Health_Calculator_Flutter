import 'package:flutter/material.dart';

class WaterIntake extends StatefulWidget {
  @override
  _WaterIntakeState createState() => _WaterIntakeState();
}

class _WaterIntakeState extends State<WaterIntake> {
  double _finalresult = 0.0;

  final TextEditingController _weightcontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WATER INTAKE'),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(11, 61, 145, 1.0),
      ),
      backgroundColor: Color.fromRGBO(235, 241, 246, 1.0),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
              child: Material(
                color: Colors.white,
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0)),
                child: ListTile(
                  title: TextField(
                    controller: _weightcontroller,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: 'Weight In Kg',
                        icon: Image.asset(
                          'images/measuring.png',
                          height: 50.0,
                          width: 50.0,
                        )),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, left: 10.0, right: 10.0, bottom: 10.0),
              child: Material(
                color: Colors.white,
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0)),
                child: ListTile(
                  title: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
                        child: Text(
                          'Your daily Water Intake Suggestion',
                          style: TextStyle(
                              color: Color.fromRGBO(11, 61, 145, 1.0),
                              fontSize: 25.0,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          '$_finalresult Ltr',
                          style: TextStyle(
                              color: Color.fromRGBO(11, 61, 145, 1.0),
                              fontSize: 20.0,
                              fontFamily: 'Roboto'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        height: MediaQuery.of(context).size.height / 10,
        width: MediaQuery.of(context).size.width,
        child: FlatButton(
            child: Text(
              'CALCULATE',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
            color: Color.fromRGBO(11, 61, 145, 1.0),
            onPressed: _calculate),
      ),
    );
  }

  _calculate() {
    _finalresult = _calculateiweight(_weightcontroller.text);
    setState(() {});
  }

  //calculation for ideal weight
  double _calculateiweight(String weight) {
    double w;
    double waterIntake;

    w = double.parse(weight);

    waterIntake = w / 30;

    return waterIntake;
  }
}
