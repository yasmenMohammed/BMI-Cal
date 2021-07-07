import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/roundedButton.dart';
import '../components/buttomButton.dart';
import '../components/reusable.dart';
import 'package:bmi_calculator/calcuolator_brain.dart';
import 'screen2.dart';
import '../components/gender.dart';
import '../consts.dart';

enum GendersTypes { male, female }

class Input extends StatefulWidget {
  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  GendersTypes selectedGender;
  var height = 180;
  var weight = 60;
  var age = 21;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
        actions: [Icon(Icons.menu)],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: Reusable(
                  onPressed: () {
                    setState(() {
                      selectedGender = GendersTypes.male;
                    });
                  },
                  cardChild: Gender(
                    genderName: "male",
                    genderIcon: FontAwesomeIcons.mars,
                  ),
                  colorCard: selectedGender == GendersTypes.male
                      ? kActiveCardColor
                      : kInActiveCardColor,
                )),
                Expanded(
                    child: Reusable(
                  onPressed: () {
                    setState(() {
                      selectedGender = GendersTypes.female;
                    });
                  },
                  cardChild: Gender(
                    genderName: "female",
                    genderIcon: FontAwesomeIcons.venus,
                  ),
                  colorCard: selectedGender == GendersTypes.female
                      ? kActiveCardColor
                      : kInActiveCardColor,
                )),
              ],
            ),
          ),
          Expanded(
              child: Reusable(
            colorCard: kActiveCardColor,
            cardChild: Column(
              children: [
                Text(
                  'height',
                  style: kLabelTextStyle,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  mainAxisAlignment: MainAxisAlignment.center,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: kNumbersStyle,
                    ),
                    Text(
                      "cm",
                      style: kLabelTextStyle,
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    inactiveTickMarkColor: Color(0xFF8D8E98),
                    thumbColor: Color(0xFFEB1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                    overlayColor: Color(0x29EB1555),
                  ),
                  child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 300,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.toInt();
                        });
                      }),
                )
              ],
            ),
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Reusable(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "weight",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumbersStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                            SizedBox(width: 15.0),
                            RoundedIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    colorCard: kActiveCardColor,
                  ),
                ),
                Expanded(
                  child: Reusable(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumbersStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                }),
                            SizedBox(
                              width: 15.0,
                            ),
                            RoundedIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    colorCard: kActiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          ButtomButton(
            label: 'CALCULATE',
            pageReturned: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);

              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Results(
                  measure: calc.calculateBMI(),
                  bmiResult: calc.getResult(),
                  interprepetate: calc.getInterpretation(),
                  should: calc.shouldBeBMI(),
                );
              }));
            },
          ),
        ],
      ),
    );
  }
}
