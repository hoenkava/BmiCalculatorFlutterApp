import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import 'package:bmicalculator/components/reusableCard.dart';
import '../constants.dart';
import 'results_page.dart';
import '../components/bottom_button.dart';
import 'package:bmicalculator/components/RoundIconButton.dart';
import 'package:bmicalculator/calculator_brain.dart';

enum genderType { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // Color maleCardColour = ReusablecolourValue;
  // Color femaleCardColour = ReusablecolourValue;

  genderType selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  // void updateColor(genderType selectedGender) {
  //   if (selectedGender == genderType.male) {
  //     if (maleCardColour == ReusablecolourValue) {
  //       maleCardColour = inActiveCardColour;
  //       femaleCardColour = ReusablecolourValue;
  //     } else {
  //       maleCardColour = ReusablecolourValue;
  //     }
  //   } else if (selectedGender == genderType.female) {
  //     if (femaleCardColour == ReusablecolourValue) {
  //       femaleCardColour = inActiveCardColour;
  //       maleCardColour = ReusablecolourValue;
  //     } else {
  //       femaleCardColour = ReusablecolourValue;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReUsableCard(
                    onPressing: () {
                      setState(() {
                        selectedGender = genderType.male;
                      });
                    },
                    colour: selectedGender == genderType.male
                        ? kInActiveCardColour
                        : kReusablecolourValue,
                    // colour: maleCardColour,
                    // colour: ReusablecolourValue,
                    // colour: Color(0xFF1D1E33),
                    cardChild: IconsReuse(
                      icon: FontAwesomeIcons.mars,
                      label: 'Male',
                    ),
                  ),
                ),
                Expanded(
                  child: ReUsableCard(
                    onPressing: () {
                      setState(() {
                        selectedGender = genderType.female;
                      });
                    },
                    colour: selectedGender == genderType.female
                        ? kInActiveCardColour
                        : kReusablecolourValue,
                    // colour: femaleCardColour,
                    // colour: Color(0xFF1D1E33),
                    cardChild: IconsReuse(
                      icon: FontAwesomeIcons.venus,
                      label: 'Female',
                    ),
                    // cardChild: Column(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: <Widget>[
                    //     Icon(
                    //       FontAwesomeIcons.female,
                    //       size: 80.0,
                    //     ),
                    //     SizedBox(
                    //       height: 15.0,
                    //     ),
                    //     Text(
                    //       'Female',
                    //       style: TextStyle(
                    //         fontSize: 18.0,
                    //         color: Color(0xFF8D8E98),
                    //       ),
                    //     )
                    //   ],
                    // ),
                  ),
                  // Container(
                  //   margin: EdgeInsets.all(15),
                  //   decoration: BoxDecoration(
                  //       color: Color(0xFF1D1E33),
                  //       borderRadius: BorderRadius.circular(12)),
                  // ),
                )
              ],
            ),
          ),
          Expanded(
            child: ReUsableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Height',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNmberTextStyle,
                      ),
                      Text(
                        ' cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFF8D8E98),
                        activeTrackColor: Color(0xFFEB1555),
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0)),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                          print(height);
                        });
                      },
                    ),
                  ),
                ],
              ),
              colour: kReusablecolourValue,
              // colour: Color(0xFF1D1E33),
            ),
            // child: Container(
            //   margin: EdgeInsets.all(15),
            //   decoration: BoxDecoration(
            //     color: Color(0xFF1D1E33),
            //     borderRadius: BorderRadius.circular(12),
            //   ),
            // ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReUsableCard(
                    colour: kReusablecolourValue,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Weight',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNmberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            // FloatingActionButton(
                            //   backgroundColor: Color(0xFF4C4F5E),
                            //   child: Icon(
                            //     Icons.add,
                            //     color: Colors.white,
                            //   ),
                            // ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              pressTheButton: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              pressTheButton: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                    // colour: Color(0xFF1D1E33),
                  ),
                  // child: Container(
                  //   margin: EdgeInsets.all(15),
                  //   decoration: BoxDecoration(
                  //       color: Color(0xFF1D1E33),
                  //       borderRadius: BorderRadius.circular(12)),
                  // ),
                ),
                Expanded(
                  child: ReUsableCard(
                    colour: kReusablecolourValue,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Age',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNmberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              pressTheButton: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              pressTheButton: () {
                                setState(() {
                                  age--;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                    // colour: Color(0xFF1D1E33),
                  ),
                  // child: Container(
                  //   margin: EdgeInsets.all(15),
                  //   decoration: BoxDecoration(
                  //       color: Color(0xFF1D1E33),
                  //       borderRadius: BorderRadius.circular(12)),
                  // ),
                )
              ],
            ),
          ),
          BottomButton(
            ontap: () {
              CalculatorBrain calc =
                  CalculatorBrain(weight: weight, height: height);
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ResultsPage(
                        bmiResult: calc.calculateBMI(),
                        resultText: calc.getResult(),
                        interpretation: calc.getInterPretation(),
                      );
                    },
                  ),
                );
              });
            },
            buttonTitle: 'Calculate',
          ),
        ],
      ),
      // Container(
      //   margin: EdgeInsets.all(15),
      //   decoration: BoxDecoration(
      //     color: Color(0xFF1D1E33),
      //     borderRadius: BorderRadius.circular(12),
      //   ),
      //   height: 200,
      //   width: 170,
      // )
      // floatingActionButton: Theme(
      //   data: ThemeData(accentColor: Color(0xFF873737)),
      //   child: FloatingActionButton(
      //     child: Icon(Icons.add),
      //   ),
      // ),
    );
  }
}
