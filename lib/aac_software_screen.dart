import 'package:flutter/material.dart';

class AACSoftwareScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: EdgeInsets.only(top: 40),
                          child: GradientText(
                            'AAC ',
                            style: TextStyle(
                              fontFamily: 'Outfit',
                              fontSize: 20,
                              color: Colors.black,
                            ),
                            gradient: LinearGradient(
                              colors: [
                                Colors.black,
                                Color.fromARGB(255, 249, 207, 88),
                              ],
                              begin: Alignment(-1, 0),
                              end: Alignment(1, 0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(1, 0),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(18, 0, 16, 0),
                    child: Text(
                      'Select a symbol or picture to vocalize the associated phrase.',
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        fontSize: 15,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildIconButton(
                              context, Icons.call, 'IconButton pressed ...'),
                          _buildIconButton(context, Icons.fastfood_rounded,
                              'IconButton pressed ...'),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildIconButton(context, Icons.favorite,
                              'IconButton pressed ...'),
                          _buildIconButton(context, Icons.format_underline,
                              'IconButton pressed ...'),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildIconButton(context, Icons.spa_rounded,
                              'IconButton pressed ...'),
                          _buildIconButton(context, Icons.mood_bad_rounded,
                              'IconButton pressed ...'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton(
      BuildContext context, IconData iconData, String tooltip) {
    return Padding(
      padding: EdgeInsets.all(8.0), // Add padding around the grid card
      child: Material(
        color: Colors.transparent,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.40,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: IconButton(
                  iconSize: 80,
                  color: Colors.black,
                  icon: Icon(
                    iconData,
                    size: 48,
                  ),
                  onPressed: () {
                    print(tooltip);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GradientText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Gradient gradient;

  GradientText(
    this.text, {
    required this.style,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return gradient.createShader(bounds);
      },
      child: Text(
        text,
        style: style.copyWith(color: Colors.white),
      ),
    );
  }
}
