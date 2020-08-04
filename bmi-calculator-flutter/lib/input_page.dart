import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ReusableContainer.dart';
import 'IconContent.dart';
import 'constants.dart';

// enums cannot be created inside the clas.
enum gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color MaleColor = kInactiveCardColour;
  Color FemaleColor = kInactiveCardColour;

  gender selectedGender;
// variable not initialised with a value as it is not male or female by default and so both cards inactive

// 1 for male and 2 for female
  // void tap(gender g) {
  //   if (g == gender.male) {
  //     //   if (MaleColor == activeCardColour) {
  //     //     MaleColor = inactiveCardColour;
  //     //
  //     //   } else {
  //     //     MaleColor = activeCardColour;
  //     // FemaleColor = inactiveCardColor;
  //     MaleColor == activeCardColour
  //         ? MaleColor = inactiveCardColour
  //         : MaleColor = activeCardColour;
  //     //   }
  //   }
  //   //
  //   if (g == gender.female) {
  //     // if (FemaleColor == activeCardColour) {
  //     //   FemaleColor = inactiveCardColour;
  //     // } else {
  //     //   FemaleColor = activeCardColour;
  //     // }
  //     FemaleColor == activeCardColour
  //         ? FemaleColor = inactiveCardColour
  //         : FemaleColor = activeCardColour;

  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        // tap(1);
                        // tap(gender.male);
                        selectedGender = gender.male;
                      });
                    },
                    child: ReusableContainer(
                      colour: selectedGender == gender.male
                          ? kActiveCardColour
                          : kInactiveCardColour,
// IF on tapping, the selected gender is male, then change to activate, else become inactive
// Similar for female
                      cardChild: IconContent(FontAwesomeIcons.mars, 'MALE'),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        // tap(gender.female);
                        selectedGender = gender.female;
                      });
                    },
                    child: ReusableContainer(
                      colour: selectedGender == gender.female
                          ? kActiveCardColour
                          : kInactiveCardColour,
                      cardChild: IconContent(FontAwesomeIcons.venus, 'FEMALE'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableContainer(
              colour: kInactiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,

                    // putting them isndie center widget would not make it cenntered

                    // Now as the 'cm' is aligned to mid of the starting height and we want to aligned to the base of the
                    // number, we use crossaxisalignment: baseline but you get error -
// crossAxisAlignment != I/flutter ( 7356): CrossAxisAlignment.baseline || textBaseline != null': is not true.
// because it does not know whom to align with. It can be corrected by giving texbaseline: alphabetic or graphical
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        kHeight.toString(),
                        style: kNumberStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      // thumbShape:
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),

                      // RoundRangeSliderThumbShape(enabledThumbRadius: 15.0),
                      // overlayShape:
                      //     RoundSliderOverlayShape(overlayRadius: 30.0),
                      thumbColor: Color(0xFFEB1555),
                      // We found overlay colour by going to slider theme file ctrl+click and finding overlay colour which was
                      // primaryColor.withAlpha(overlayAlpha), where overlayalpha was 0x1f (12% opacity)
                      overlayColor: Color(0x1FEB1555),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      // Make sure activecolor is removed as it is overriding the thumb colorand instead use active
                      // track colour.
                      // IMPORTANT
                    ),
                    //context is the context of  state of app
                    // Now  we can use SliderThemeData.of(context) and then copywith too use the other default
                    // slider theme data

                    child: Slider(
                        value: kHeight.toDouble(),
                        min: 120,
                        max: 220,
                        // activeColor: Color(0xFFEB1555),
                        // activeColor: Colors.white,
                        // inactiveColor: Color(0xFF8D8E98),
                        onChanged: (double newValue) {
                          // print(newValue);
                          setState(() {
                            kHeight = newValue.round();
                            // roundoff rather than assigning double to int conversion as error
                          });
                        }),
                  ),
                  // Now the slider thumb does not change colour without change in active colour. in order to  change
                  // the thumb color and other properties, we need to put slider() inside sliderTheme widget
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableContainer(
                    colour: kInactiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          kWeight.toString(),
                          style: kNumberStyle,
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
                              icon: FontAwesomeIcons.minus,
                              pressed: () {
                                setState(() {
                                  kWeight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            // FloatingActionButton(
                            //   backgroundColor: Color(0xFF4C4F5E),
                            //   child: Icon(
                            //     Icons.minimize,
                            //     color: Colors.white,
                            //   ),
                            // ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              pressed: () {
                                setState(() {
                                  kWeight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableContainer(
                    colour: kInactiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          kAge.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                pressed: () {
                                  setState(() {
                                    kAge--;
                                  });
                                }),
                            SizedBox(
                              width: 20.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              pressed: () {
                                setState(() {
                                  kAge++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: kBottomBarColour,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: kBottomContainerHeight,
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function pressed;

  RoundIconButton({@required this.icon, @required this.pressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: pressed,
      elevation: 0.0,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: const BoxConstraints.tightFor(width: 56.0, height: 56.0),
    );
  }
}
