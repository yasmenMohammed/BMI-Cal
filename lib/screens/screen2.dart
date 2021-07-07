import '../components/reusable.dart';
import 'screen1.dart';
import 'package:flutter/material.dart';
import '../consts.dart';
import '../components/buttomButton.dart';

class Results extends StatelessWidget {
  Results({this.should, this.measure, this.interprepetate, this.bmiResult});
  final measure;
  final bmiResult;
  final interprepetate;
  final should;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF090C21),
        scaffoldBackgroundColor: Color(0xFF090C21),
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: Color(0xFFFFFFFF),
          ),
        ),
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('BMI Calculator'),
            centerTitle: true,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'YOUR RESULT',
                  style: kTitleText,
                ),
              ),
              Expanded(
                flex: 2,
                child: Reusable(
                  colorCard: kInActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        measure,
                        style: kBMITextStyle,
                      ),
                      Text(
                        bmiResult,
                        style: kBodyTextStyle,
                      ),
                      Text(
                        should,
                        style: kBodyTextStyle,
                      ),
                      Text(
                        interprepetate,
                        style: kBodyTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
              ButtomButton(
                label: 'RE-CALCULATE',
                pageReturned: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return Input();
                    }),
                  );
                },
              )
            ],
          )),
    );
  }
}
