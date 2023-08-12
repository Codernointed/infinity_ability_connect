import 'package:flutter/material.dart';
import 'package:infinty_ability_connect/SignToText.dart';
import 'package:infinty_ability_connect/TextToSign.dart';

class TextToSignLanguageConverterScreen extends StatelessWidget {
  const TextToSignLanguageConverterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Align(
          alignment: Alignment.center,
          child: Container(
            constraints: BoxConstraints(
              maxWidth: 670,
            ),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              'https://images.unsplash.com/photo-1592966554798-bdc154f077d5?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw0fHxlcXVhbGl0eXxlbnwwfHx8fDE2OTA5ODk2MTV8MA&ixlib=rb-4.0.3&q=80&w=1080',
                            ),
                          ),
                          shape: BoxShape.rectangle,
                        ),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.transparent,
                                Color.fromARGB(255, 238, 238, 238),
                              ],
                              stops: [0.4, 1],
                              begin: Alignment(0.03, -1),
                              end: Alignment(-0.03, 1),
                            ),
                          ),
                          alignment: Alignment(0, 1),
                          child: Align(
                            alignment: Alignment(0, 1),
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 25),
                              child: Text(
                                'infinite\npossibilities',
                                style: TextStyle(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 40,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 414,
                      height: 214,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(19, 40, 19, 30),
                            child: ElevatedButton.icon(
                              onPressed: () async {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignToTextScreen(),
                                  ),
                                );
                              },
                              icon: Icon(
                                Icons.sign_language_sharp,
                                size: 25,
                              ),
                              label: Text(
                                'Sign to Text/Speech',
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  color: Color.fromARGB(255, 249, 207, 88),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 20, 24,
                                    27), // Customize the button color
                                onPrimary: Color.fromARGB(255, 249, 207,
                                    88), // Customize the text color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: EdgeInsets.zero,
                                fixedSize: Size(290, 60),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 16),
                            child: ElevatedButton.icon(
                              onPressed: () async {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TextToSignScreen(),
                                  ),
                                );
                              },
                              icon: Icon(
                                Icons.mic_sharp,
                                size: 25,
                              ),
                              label: Text(
                                'Text/Speech to Sign',
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  color: Color.fromARGB(255, 249, 207, 88),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 20, 24,
                                    27), // Customize the button color
                                onPrimary: Color.fromARGB(255, 249, 207,
                                    88), // Customize the text color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),

                                fixedSize: Size(290, 60),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment(-0.89, -0.89),
                  child: Text(
                    'Infinity',
                    style: TextStyle(
                      fontFamily: 'Open Sans',
                      color: Color.fromARGB(255, 255, 255, 255),
                      letterSpacing: 1,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(-0.24, -0.84),
                  child: Text(
                    'Connect',
                    style: TextStyle(
                      fontFamily: 'Readex Pro',
                      color: Color.fromARGB(255, 249, 207, 88),
                      fontSize: 30,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(-0.89, -0.84),
                  child: Text(
                    'Ability',
                    style: TextStyle(
                      fontFamily: 'Readex Pro',
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}