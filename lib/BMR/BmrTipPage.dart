import 'package:flutter/material.dart';

class BmrTipPage extends StatefulWidget {
  @override
  _BmrTipPageState createState() => _BmrTipPageState();
}

class _BmrTipPageState extends State<BmrTipPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TIP'),
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
              const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
              child: Material(
                color: Colors.white,
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0)),
                child: ListTile(
                    title: Text(
                      'BMR FORMULA',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17.0,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold
                      ),
                      textAlign: TextAlign.center,
                    ),
                    subtitle:Image.asset('images/bmr-formula.jpg')
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
              'RECALCULATE',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
            color: Color.fromRGBO(11, 61, 145, 1.0),
            onPressed: (){
              Navigator.of(context).pop();
            }),
      ),
    );
  }
}
