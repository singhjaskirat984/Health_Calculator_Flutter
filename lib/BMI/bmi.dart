import 'package:flutter/material.dart';

import 'BmiTipPage.dart';

class Bmi extends StatefulWidget {
  @override
  _BmiState createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  double _finalresult = 0.0;
  String _remark = "";
  final TextEditingController _heightcontroller = new TextEditingController();
  final TextEditingController _weightcontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI'),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(11, 61, 145, 1.0),
        actions: <Widget>[
          FloatingActionButton(
            backgroundColor: Color.fromRGBO(11, 61, 145, 1.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0)),
            child: Image.asset(
              'images/idea.png',
              height: 30.0,
              width: 30.0,
            ),
            onPressed: () {
              var router = MaterialPageRoute(builder: (BuildContext context) {
                return BmiTipPage(_remark);
              });
              Navigator.of(context).push(router);
            },
          )
        ],
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
                  const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
              child: Material(
                color: Colors.white,
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0)),
                child: ListTile(
                  leading: Image.asset(
                    'images/idea.png',
                    height: 45.0,
                    width: 45.0,
                  ),
                  title: Text(
                    'Body Mass Index (BMI) is a measure of body fat based '
                    'on your weight in relation to your height',
                    style: TextStyle(
                        color: Color.fromRGBO(143, 144, 156, 1.0),
                        fontSize: 17.0,
                        fontFamily: 'Roboto'),
                  ),
                ),
              ),
            ),
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
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: 'Age',
                        icon: Icon(
                          Icons.person,
                          size: 50.0,
                          color: Color.fromRGBO(11, 61, 145, 1.0),
                        )),
                  ),
                ),
              ),
            ),
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
                    controller: _heightcontroller,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: 'Height In metres',
                        icon: Image.asset(
                          'images/height.png',
                          height: 50.0,
                          width: 50.0,
                        )),
                  ),
                ),
              ),
            ),
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
                          'RESULT',
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
                          'BMI: $_finalresult',
                          style: TextStyle(
                              color: Color.fromRGBO(11, 61, 145, 1.0),
                              fontSize: 20.0,
                              fontFamily: 'Roboto'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                        child: Text(
                          'REMARK: $_remark',
                          style: TextStyle(
                              color: Color.fromRGBO(11, 61, 145, 1.0),
                              fontSize: 20.0,
                              fontFamily: 'Roboto'),
                        ),
                      )
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
    _finalresult =
        _calculatebmi(_heightcontroller.text, _weightcontroller.text);

    _remark = _remarkdecider(_finalresult);

    setState(() {});
  }

  //calculation for BMI
  double _calculatebmi(String height, String weight) {
    double h, w;
    double bmi;

    h = double.parse(height);
    w = double.parse(weight);

    bmi = w / (h * h);
    print(bmi);

    return bmi;
  }

  //weight category decider
  String _remarkdecider(double finalresult) {
    String R;
    if (finalresult < 18.5) {
      return R = "UnderWeight";
    } else if (finalresult >= 18.5 && finalresult <= 24.9) {
      return R = "Normal";
    } else if (finalresult >= 25.0 && finalresult <= 29.9) {
      return R = "OverWeight";
    } else if (finalresult >= 30.0) {
      return R = "Obese";
    }
  }
}
