import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class TextToSignScreen extends StatefulWidget {
  @override
  _TextToSignScreenState createState() => _TextToSignScreenState();
}

class _TextToSignScreenState extends State<TextToSignScreen> {
  final TextEditingController _textController = TextEditingController();
  String _currentLetter = 'a';
  final stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _loadLetterGif(String text) {
    String letters = text.toLowerCase();

    if (letters.isNotEmpty) {
      for (int i = 0; i < letters.length; i++) {
        Future.delayed(Duration(seconds: i), () {
          setState(() {
            _currentLetter = letters[i];
          });
        });
      }
    }
  }

  Future<void> _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (status) {
          if (status == stt.SpeechToText.listeningStatus) {
            setState(() => _isListening = true);
          } else if (status == stt.SpeechToText.notListeningStatus) {
            setState(() => _isListening = false);
          }
        },
      );

      if (available) {
        _speech.listen(
          onResult: (result) {
            setState(() {
              _textController.text = result.recognizedWords;
            });
          },
        );
      }
    } else {
      _speech.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-0.85, 0.23),
                    child: Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.grey[700],
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Text(
                            'Speech and Text',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontFamily: 'Readex Pro',
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Text(
                            'Interpretation',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Color.fromARGB(255, 249, 207, 88),
                              fontSize: 23,
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 339,
                    height: 234,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/alphabet/$_currentLetter\_small.gif'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(8, 25, 8, 0),
                    child: TextFormField(
                      controller: _textController,
                      autofocus: false,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: '    enter text here...',
                        labelStyle: TextStyle(
                          fontFamily: 'Readex Pro',
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                        hintStyle: TextStyle(),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 199, 196, 196),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 249, 207, 88),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 249, 207, 88),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 249, 207, 88),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: ElevatedButton(
                        onPressed: _listen,
                        child: Text(
                          _isListening ? 'Stop Listening' : 'Record Voice',
                          style: TextStyle(
                            fontFamily: 'Readex Pro',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 249, 207, 88),
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          fixedSize: Size(176, 51),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Container(
                      height: 291,
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0, 0.81),
                            child: Container(
                              width: 388,
                              height: 239,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 249, 207, 88),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-0.0, -0.86),
                            child: Stack(
                              alignment: AlignmentDirectional(-0.1, 0),
                              children: [
                                Container(
                                  width: 65,
                                  height: 65,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromARGB(255, 20, 24, 27),
                                  ),
                                ),
                                IconButton(
                                  color: Color.fromARGB(255, 249, 207, 88),
                                  icon: Icon(
                                    Icons.play_arrow_rounded,
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                  onPressed: () {
                                    _loadLetterGif(
                                        _textController.text.toLowerCase());
                                  },
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Press button to\nConvert to Sign Language',
                              style: TextStyle(
                                fontFamily: 'Readex Pro',
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: TextToSignScreen(),
  ));
}
