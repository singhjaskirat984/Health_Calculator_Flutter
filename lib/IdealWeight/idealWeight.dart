import 'package:flutter/material.dart';

import 'idealWeightTipPage.dart';

class IdealWeight extends StatefulWidget {
  @override
  _IdealWeightState createState() => _IdealWeightState();
}

class _IdealWeightState extends State<IdealWeight> {
  double _finalresult = 0.0;
  final TextEditingController _heightcontroller = new TextEditingController();
  final TextEditingController _weightcontroller = new TextEditingController();
  final TextEditingController _agecontroller = new TextEditingController();

  Color malebuttoncolor = Colors.grey;
  Color femalebutttoncolor = Colors.grey;
  bool _ismale = false;
  bool _isfemale = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IDEAL WEIGHT'),
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
              var router = MaterialPageRoute(
                  builder: (BuildContext context) {
                    return IBWTipPage();
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
                    "Ideal Weight is dependent on one's body type (height,age), "
                    "healthy weight is commonly determined by measuring body mas index or BMI",
                    style: TextStyle(
                        color: Color.fromRGBO(143, 144, 156, 1.0),
                        fontSize: 15.0,
                        fontFamily: 'Roboto'),
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, right: 10.0, left: 10.0),
                    child: Material(
                      color: Colors.white,
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0)),
                      child: ListTile(
                          title: TextField(
                        controller: _agecontroller,
                        keyboardType: TextInputType.number,
                        decoration: new InputDecoration(
                            labelText: 'Age in years',
                            icon: Icon(
                              Icons.person,
                              size: 50.0,
                              color: Color.fromRGBO(11, 61, 145, 1.0),
                            )),
                      )),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50.0,
                    width: 50.0,
                    child: RaisedButton(
                      color: malebuttoncolor,
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0)),
                      onPressed: () {
                        _ismale = true;
                        _isfemale = false;
                        toggleSelection();
                        print("male:$_ismale");
                        print("female:$_isfemale");
                      },
                      child: Image.asset(
                        'images/man-user.png',
                        height: 50.0,
                        width: 30.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50.0,
                    width: 50.0,
                    child: RaisedButton(
                      color: femalebutttoncolor,
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0)),
                      onPressed: () {
                        _ismale = false;
                        _isfemale = true;
                        toggleSelection();
                        print("male:$_ismale");
                        print("female:$_isfemale");
                      },
                      child: Image.asset(
                        'images/woman-avatar.png',
                        height: 50.0,
                        width: 30.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
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
                          'Ideal Weight: $_finalresult',
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

  void toggleSelection() {
    if (_ismale) {
      malebuttoncolor = Color.fromRGBO(11, 61, 145, 1.0);
      femalebutttoncolor = Colors.grey;
      setState(() {});
    } else if (_isfemale) {
      femalebutttoncolor = Color.fromRGBO(11, 61, 145, 1.0);
      malebuttoncolor = Colors.grey;
      setState(() {});
    }
  }

  _calculate() {
    _finalresult = _calculateiweight(_heightcontroller.text);
    setState(() {});
  }

  //calculation for ideal weight
  double _calculateiweight(String height) {
    double h;
    double idealWeight;

    h = double.parse(height);

    idealWeight = 22 * (h * h);

    return idealWeight;
  }
}
