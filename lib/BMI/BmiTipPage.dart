import 'package:flutter/material.dart';

class BmiTipPage extends StatefulWidget {
  final String _remark;
  BmiTipPage(this._remark);
  @override
  _BmiTipPageState createState() => _BmiTipPageState();
}

class _BmiTipPageState extends State<BmiTipPage> {

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
                      'BMI CHART',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17.0,
                          fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold
                      ),
                      textAlign: TextAlign.center,
                    ),
                  subtitle:Image.asset('images/BMI_categories.png')
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
                          'Tip Based On Your Calculated Result:',
                          style: TextStyle(
                              color: Color.fromRGBO(11, 61, 145, 1.0),
                              fontSize: 20.0,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                        child: widget._remark.isEmpty ?  Text('Please calculate the result first',
                          style: TextStyle(
                              color: Color.fromRGBO(11, 61, 145, 1.0),
                              fontSize: 20.0,
                              fontFamily: 'Roboto'),
                        ) : widget._remark == 'UnderWeight' ?  Text('You Should Start eating healthy food',
                          style: TextStyle(
                              color: Color.fromRGBO(11, 61, 145, 1.0),
                              fontSize: 20.0,
                              fontFamily: 'Roboto'),
                        ) :  widget._remark == 'Normal' ?  Text('keep on going like this you are a healthy person',
                          style: TextStyle(
                              color: Color.fromRGBO(11, 61, 145, 1.0),
                              fontSize: 20.0,
                              fontFamily: 'Roboto'),
                        ) : widget._remark == 'OverWeight' ?  Text('you should start doing some exercise',
                          style: TextStyle(
                              color: Color.fromRGBO(11, 61, 145, 1.0),
                              fontSize: 20.0,
                              fontFamily: 'Roboto'),
                        ): Text('you need to start doing some serious workout',
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
      bottomSheet:  Container(
        height: MediaQuery.of(context).size.height / 10,
        width: MediaQuery.of(context).size.width,
        child: FlatButton(
          child: widget._remark.isEmpty ?  Text(
            'CALCULATE',
            style: TextStyle(
              color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
            ),
          ) : Text(
            'RECALCULATE',
            style: TextStyle(
              color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
            ),
          ) ,
          color: Color.fromRGBO(11, 61, 145, 1.0),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
