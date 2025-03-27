import 'package:flutter/material.dart';

class MockupExpenses extends Widget {
  const MockupExpenses({super.key});

  @override
  Element createElement() {
    return MockupExpensesElement(this);
  }
}

class MockupExpensesElement extends ComponentElement {
  MockupExpensesElement(super.widget);

  final primarycolor = const Color.fromARGB(255, 94, 92, 229);
  final primaryTextColor = Colors.white;
  final secondaryTextColor = const Color.fromARGB(255, 117, 117, 121);

  @override
  Widget build() {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildLogo(size: 180.0),
              _buildTitles(),
              _buildLoginButtons(),
              _buildSignInText(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo({required double size}) {
    final widthQuadranteSuperiorEsq = size / 2;
    final heightQudranteSuperiorEsq = size / 2;

    final spacingHorizontal = (size / 100) * 5;

    final widthQuadranteInferiorEsq = size / 2;
    final heightQuadranteInferiorEsq = size / 2;

    final spacingVertical = (size / 100) * 5;

    final widthQuadranteSuperiorDir = (size / 2);
    final heightQuadranteSuperiorDir = (size / 2) + (spacingHorizontal / 2);

    final widthQuadranteInferiorDir = size / 2;
    final heightQuadranteInferiorDir = size / 2 + (spacingHorizontal / 2);

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: heightQudranteSuperiorEsq,
                width: widthQuadranteSuperiorEsq,
                decoration: BoxDecoration(
                  color: primarycolor,
                  borderRadius: BorderRadius.circular(size / 2),
                ),
              ),
              Container(
                height: spacingHorizontal,
              ),
              Container(
                height: heightQuadranteInferiorEsq,
                width: widthQuadranteInferiorEsq,
                decoration: BoxDecoration(
                  color: primarycolor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(size / 2),
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: spacingVertical,
          ),
          Column(
            children: [
              Container(
                height: heightQuadranteSuperiorDir,
                width: widthQuadranteSuperiorDir,
                decoration: BoxDecoration(
                  color: primarycolor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(size / 2),
                  ),
                ),
              ),
              Container(
                height: heightQuadranteInferiorDir,
                width: widthQuadranteInferiorDir,
                decoration: BoxDecoration(
                  color: primarycolor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(size / 2),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTitles() {
    return Column(
      children: [
        Text(
          'Get your Money \nUnder Control',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 36,
            color: primaryTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Manage your expenses.\nSeamlessly.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            color: secondaryTextColor,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }

  Widget _buildLoginButtons() {
    return Column(
      children: [
        _buildButtom(
          backgroundColor: primarycolor,
          caption: 'Sign Up with Email ID',
        ),
        Container(
          height: 16,
        ),
        _buildButtom(
            backgroundColor: Colors.white,
            caption: 'Sign Up with Google',
            fontColor: Colors.black,
            leading: Image.asset(
              'assets/img/google.png',
              fit: BoxFit.fitWidth,
            )),
      ],
    );
  }

  Widget _buildButtom({
    required Color backgroundColor,
    required String caption,
    Color fontColor = Colors.white,
    Widget? leading,
  }) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (leading != null) ...[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: leading,
            ),
            const SizedBox(
              width: 5,
            ),
          ],
          Text(
            caption,
            style: TextStyle(
              color: fontColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignInText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account? ',
          style: TextStyle(
            color: primaryTextColor,
          ),
        ),
        Text(
          'Sign In',
          style: TextStyle(
            color: primaryTextColor,
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    );
  }
}
