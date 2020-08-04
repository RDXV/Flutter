// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// const bottomContainerHeight = 50.0;
// const bottomContainerColour = Color(0xFF1D1E33);

// const bottomBarColour = Color(0xFFEB1555);
// // const vs final

// // const can be used and should be used when the value is known and is not meant to be changged after  the  compile time
// // such as date. const value = new DateTime(); -> this will be an error as it returns date after compile time to the variable
// // However, const values are not meant to store  or view after compile time whereas it is possible for final.
// // final val2 = new DateTime(); and then print(vale2) will work correctly.

// // So for items whose values are not meant to be changed or modified after compile time, they should be declared as const
// // and those which can change during compile time to be cdeclared as final.

// // Note that const and final values cannot be set or  redeclared. eg -> final a=5;
// // a=6; ->error as final values can change during run time.

// void main() => runApp(BMICalculator());

// class BMICalculator extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // If we  prefferred the dark theme but wanted to change some thing in it ,then type ThemeData.dark().copyWith()
//       // othewise ThemeData(...) where ... specifies the commented below code
//       theme: ThemeData.dark().copyWith(
//         primaryColor: Color(0xFF0A0E21),
//         scaffoldBackgroundColor: Color(0xFF0A0E21),
//         // accentColor: Colors.purple, -> the accenntcolor for floating button is deprecated so it will not show
//         // purple coloured button
//         // textTheme: TextTheme(
//         //   body1: TextStyle(
//         //     color: Colors.white,
//         //   ),
//         // ),
//       ),
//       home: InputPage(),
//     );
//   }
// }

// class InputPage extends StatefulWidget {
//   //  static const bottomContainerHeight = 40.0;
//   // Reason why static is required because static makes single instance rather than each instance for different objects
//   @override
//   _InputPageState createState() => _InputPageState();
// }

// class _InputPageState extends State<InputPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('BMI CALCULATOR'),
//       ),
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             child: Row(
//               children: <Widget>[
//                 Expanded(
//                   child: ReusableContainer(bottomContainerColour),
//                 ),
//                 Expanded(
//                   child: ReusableContainer(bottomContainerColour),
//                 ),
//               ],
//             ),
//           ),

//           Expanded(
//             child: ReusableContainer(bottomContainerColour),
//           ),

//           Expanded(
//             child: Row(
//               children: <Widget>[
//                 Expanded(
//                   child: ReusableContainer(
//                     bottomContainerColour,
//                     IconContent(FontAwesomeIcons.mars, 'MALE'),
//                   ),
//                   // Since a wiidget  is passed as argument, pass a widget namely Column
//                 ),
//                 Expanded(
//                   child: ReusableContainer(
//                     bottomContainerColour,
//                     IconContent(FontAwesomeIcons.venus, "Female"),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           // Earlier both the expanded widgets were not closed with ' ), '
//           Container(
//             color: bottomBarColour,
//             margin: EdgeInsets.only(top: 10.0),
//             width: double.infinity,
//             height: bottomContainerHeight,
//           ),
//         ],
//       ),
//       // Inorder to style the floating button we need  to wrap with the theme widget and data: themeData
//     );
//   }
// }

// // As the containers are used again and again, we can use extract widget and then copy the function to all parts where it
// // is required

// class IconContent extends StatelessWidget {
//   final IconData icon;
//   final String label;

//   IconContent(this.icon, this.label);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         Icon(icon, size: 80.0),
//         SizedBox(
//           height: 15.0,
//         ),
//         Text(
//           label,
//           style: TextStyle(
//             color: Color(0xFF8D8E98),
//             fontSize: 18.0,
//           ),
//         ),
//       ],
//     );
//   }
// }

// class ReusableContainer extends StatelessWidget {
//   // We are getting the warning that the class is immutable which means it cannot be changed as it is a
//   // stateless widget. This problem can be corrected by putting final keyword
//   // before the Color colour which means the colour cannot be changed
// // To make a constructor  require  a  parameter necessarily, use
//   final Color colour;
//   final Widget cardChild;
//   ReusableContainer(this.colour, this.cardChild);
//   // Now  we  need a cardChild so as to input a widget as for bmi, each card has different icons and details and this card child
//   // will be child of container called ReusableContainer()

//   // this.colour = colour;
//   // You cannot set the colour as it is set as final becuase it is stateless widget  is not not mutable(immutable)
//   // and so just pass the parameterized constructor

//   // const ReusableContainer({
//   //   Key key,
//   // }) : super(key: key);
//   // The key clas sis needed when the objects are movig on the screen or animations. In our case, we dont  need it. plus
//   // we need it for stateful widgets and  then specify the key

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: cardChild,
//       // Note that the color property is a shorthand for box decoration() -> color and to use color and border radius
//       // together, we have to use color property inside box decoration
//       margin: EdgeInsets.all(15.0),
//       decoration: BoxDecoration(
//         // color: Color(0xFF1D1E33),
//         color: colour,
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//     );
//   }
// }

// // Stateless widggets are immutable which means they cannot be changed. So, for any change inside the widget tree,
// // rather than changing the state like in stateful widgets, we destroy the old widget and create a new widget  with
// // the required changes. example - changing background of a photo from white to blue, the whole widget will
// // be destroyed and a new widget with blue background applied will be created and put inside the tree.

// // Container(
// //                   // Note that the color property is a shorthand for box decoration() -> color and to use color and border radius
// //                   // together, we have to use color property inside box decoration
// //                   margin: EdgeInsets.all(15.0),
// //                   // height: 200.0,
// //                   width: 170.0,
// //                   decoration: BoxDecoration(
// //                     color: Color(0xFF1D1E33),
// //                     borderRadius: BorderRadius.circular(10.0),
// //                   ),
// //                 ),
