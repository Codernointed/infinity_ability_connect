import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class SignLanguageGameScreen extends StatefulWidget {
  @override
  _SignLanguageGameScreenState createState() => _SignLanguageGameScreenState();
}

class _SignLanguageGameScreenState extends State<SignLanguageGameScreen> {
  int currentQuestionIndex = 0;
  int score = 0;
  double progress = 0.0; // Added variable for progress
  bool? isAnswerCorrect;

  final List<Map<String, dynamic>> questions = [
    {
      'letter': 'A',
      'options': ['A', 'B', 'T']
    },
    {
      'letter': 'B',
      'options': ['F', 'B', 'Z']
    },
    {
      'letter': 'C',
      'options': ['U', 'R', 'C']
    },
    {
      'letter': 'D',
      'options': ['D', 'W', 'Z']
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsets.only(top: 1),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: Alignment(-1, -1),
                        child: Padding(
                          padding: EdgeInsets.only(left: 30, top: 20),
                          child: Text(
                            'Sign Language',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Readex Pro',
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(-0.81, -0.22),
                        child: Text(
                          'Game',
                          style: TextStyle(
                            fontFamily: 'Readex Pro',
                            color: Color.fromARGB(255, 249, 207, 88),
                            fontSize: 23,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 339,
                    height: 234,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/alphabet/${questions[currentQuestionIndex]['letter'].toLowerCase()}_small.gif'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Container(
                    height: 374,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment(0.06, 0.80),
                          child: ElevatedButton(
                            onPressed: () {
                              print('Next Button pressed ...');
                            },
                            child: Text(
                              'Previous',
                              style: TextStyle(
                                fontFamily: 'Outfit',
                                color: Color.fromARGB(255, 249, 207, 88),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 20, 24, 27),
                              textStyle: TextStyle(
                                fontFamily: 'Outfit',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              elevation: 3,
                              padding: EdgeInsets.zero,
                              minimumSize: Size(223, 56),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(0, -0.87),
                          child: ElevatedButton(
                            onPressed: () {
                              checkAnswer(questions[currentQuestionIndex]
                                  ['options'][0]);
                            },
                            child: Text(
                              questions[currentQuestionIndex]['options'][0],
                              style: TextStyle(
                                fontFamily: 'Outfit',
                                color: isAnswerCorrect == true &&
                                        currentQuestionIndex == 0
                                    ? Colors.green
                                    : isAnswerCorrect == false &&
                                            currentQuestionIndex == 0
                                        ? Colors.red
                                        : Colors.white,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: getOptionButtonBackgroundColor(
                                  0), // Set the background color
                              textStyle: TextStyle(
                                fontFamily: 'Outfit',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              elevation: 3,
                              padding: EdgeInsets.zero,
                              minimumSize: Size(290, 51),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(0, 0.18),
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 30),
                            child: ElevatedButton(
                              onPressed: () {
                                checkAnswer(questions[currentQuestionIndex]
                                    ['options'][1]);
                              },
                              child: Text(
                                questions[currentQuestionIndex]['options'][1],
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  color: isAnswerCorrect == true &&
                                          currentQuestionIndex == 1
                                      ? Colors.green
                                      : isAnswerCorrect == false &&
                                              currentQuestionIndex == 1
                                          ? Colors.red
                                          : Colors.white,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: getOptionButtonBackgroundColor(
                                    1), // Set the background color
                                textStyle: TextStyle(
                                  fontFamily: 'Outfit',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                elevation: 3,
                                padding: EdgeInsets.zero,
                                minimumSize: Size(290, 51),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(0, 0.40),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2),
                            child: LinearPercentIndicator(
                              percent:
                                  progress, // Use the progress variable here
                              lineHeight: 25,
                              animation: true,
                              progressColor: Color.fromARGB(255, 249, 207, 88),
                              backgroundColor: Colors.grey[300],
                              center: Text(
                                '${(progress * 100).toInt()}%',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              linearStrokeCap: LinearStrokeCap.roundAll,
                              padding: EdgeInsets.zero,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(0, -0.34),
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 30),
                            child: ElevatedButton(
                              onPressed: () {
                                checkAnswer(questions[currentQuestionIndex]
                                    ['options'][2]);
                              },
                              child: Text(
                                questions[currentQuestionIndex]['options'][2],
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  color: isAnswerCorrect == true &&
                                          currentQuestionIndex == 2
                                      ? Colors.green
                                      : isAnswerCorrect == false &&
                                              currentQuestionIndex == 2
                                          ? Colors.red
                                          : Colors.white,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: getOptionButtonBackgroundColor(
                                    2), // Set the background color
                                textStyle: TextStyle(
                                  fontFamily: 'Outfit',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                elevation: 3,
                                padding: EdgeInsets.zero,
                                minimumSize: Size(290, 51),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color getOptionButtonBackgroundColor(int optionIndex) {
    return Color.fromARGB(255, 249, 207,
        88); // Neutral color at the start or for unpressed buttons
  }

  void checkAnswer(String selectedOption) {
    String correctOption = questions[currentQuestionIndex]['letter'];
    bool isAnswerCorrect = (selectedOption == correctOption);

    setState(() {
      this.isAnswerCorrect = isAnswerCorrect;
      // Calculate progress and update the progress variable
      progress = (score + (isAnswerCorrect ? 1 : 0)) / questions.length;
    });

    // Delay before moving to the next question
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        // Reset the isAnswerCorrect after the delay
        this.isAnswerCorrect = null;
        // Move to the next question
        if (isAnswerCorrect) {
          score++;
        }
        currentQuestionIndex++;
        if (currentQuestionIndex >= questions.length) {
          // You can add a logic to display the final score when all questions are answered
          currentQuestionIndex = 0;
          score = 0;
        }
      });
    });
  }
}
