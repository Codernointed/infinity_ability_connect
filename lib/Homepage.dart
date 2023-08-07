// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import 'homepage_model.dart';
// export 'homepage_model.dart';

// class HomepageWidget extends StatefulWidget {
//   const HomepageWidget({Key? key}) : super(key: key);

//   @override
//   _HomepageWidgetState createState() => _HomepageWidgetState();
// }

// class _HomepageWidgetState extends State<HomepageWidget> {
//   late HomepageModel _model;

//   final scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   void initState() {
//     super.initState();
//     _model = createModel(context, () => HomepageModel());
//   }

//   @override
//   void dispose() {
//     _model.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
//       child: Scaffold(
//         key: scaffoldKey,
//         backgroundColor: Colors.blueGrey, // Replace with your desired background color
//         body: Align(
//           alignment: AlignmentDirectional(0, 0),
//           child: Container(
//             width: double.infinity,
//             constraints: BoxConstraints(
//               maxWidth: 670,
//             ),
//             decoration: BoxDecoration(
//               color: Colors.blueGrey, // Replace with your desired background color
//             ),
//             child: Stack(
//               children: [
//                 Column(
//                   mainAxisSize: MainAxisSize.max,
//                   children: [
//                     Expanded(
//                       child: Container(
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                           color: Colors.blueGrey, // Replace with your desired background color
//                           image: DecorationImage(
//                             fit: BoxFit.cover,
//                             image: NetworkImage(
//                               'https://images.unsplash.com/photo-1592966554798-bdc154f077d5?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw0fHxlcXVhbGl0eXxlbnwwfHx8fDE2OTA5ODk2MTV8MA&ixlib=rb-4.0.3&q=80&w=1080',
//                             ),
//                           ),
//                           shape: BoxShape.rectangle,
//                         ),
//                         child: Container(
//                           width: double.infinity,
//                           height: double.infinity,
//                           decoration: BoxDecoration(
//                             gradient: LinearGradient(
//                               colors: [
//                                 Color(0x00FFFFFF),
//                                 Colors.blueGrey, // Replace with your desired background color
//                               ],
//                               stops: [0.7, 1],
//                               begin: AlignmentDirectional(0.03, -1),
//                               end: AlignmentDirectional(-0.03, 1),
//                             ),
//                           ),
//                           alignment: AlignmentDirectional(0, 1),
//                           child: Align(
//                             alignment: AlignmentDirectional(0, 1),
//                             child: Padding(
//                               padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 25),
//                               child: Text(
//                                 'infinite\npossibilities',
//                                 style: TextStyle(
//                                   fontFamily: 'Readex Pro',
//                                   fontSize: 40,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Container(
//                       width: 414,
//                       height: 384,
//                       color: Colors.blueGrey, // Replace with your desired background color
//                       child: Column(
//                         mainAxisSize: MainAxisSize.max,
//                         children: [
//                           Padding(
//                             padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
//                             child: ElevatedButton(
//                               onPressed: () async {
//                                 // Replace with your desired onPressed action
//                                 Navigator.pushNamed(context, 'SignToText');
//                               },
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Icon(Icons.sign_language_sharp, size: 15),
//                                   SizedBox(width: 12),
//                                   Text(
//                                     'Sign to Text/Speech',
//                                     style: TextStyle(
//                                       fontFamily: 'Outfit',
//                                       color: Colors.blueGrey, // Replace with your desired text color
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               style: ElevatedButton.styleFrom(
//                                 primary: Colors.white, // Replace with your desired button color
//                                 elevation: 0,
//                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
//                                 padding: EdgeInsets.zero,
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 16),
//                             child: ElevatedButton(
//                               onPressed: () async {
//                                 // Replace with your desired onPressed action
//                                 Navigator.pushNamed(context, 'TextToSign');
//                               },
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Icon(Icons.mic_sharp, size: 15),
//                                   SizedBox(width: 12),
//                                   Text(
//                                     'Text/Speech to Sign',
//                                     style: TextStyle(
//                                       fontFamily: 'Outfit',
//                                       color: Colors.blueGrey, // Replace with your desired text color
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               style: ElevatedButton.styleFrom(
//                                 primary: Colors.white, // Replace with your desired button color
//                                 elevation: 0,
//                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
//                                 padding: EdgeInsets.zero,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 Align(
//                   alignment: AlignmentDirectional(-0.89, -0.89),
//                   child: Text(
//                     'Infinity',
//                     style: TextStyle(
//                       fontFamily: 'Open Sans',
//                       letterSpacing: 1,
//                     ),
//                   ),
//                 ),
//                 Align(
//                   alignment: AlignmentDirectional(-0.14, -0.83),
//                   child: Text(
//                     'Connect',
//                     style: TextStyle(
//                       fontFamily: 'Readex Pro',
//                       color: Colors.blueGrey, // Replace with your desired text color
//                       fontSize: 30,
//                     ),
//                   ),
//                 ),
//                 Align(
//                   alignment: AlignmentDirectional(-0.89, -0.84),
//                   child: Text(
//                     'Ability',
//                     style: TextStyle(
//                       fontFamily: 'Readex Pro',
//                       fontSize: 30,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
