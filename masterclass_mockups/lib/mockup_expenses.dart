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
              _buildLogo(),
              _buildTitles(),
              _buildLoginButtons(),
              _buildSignInText(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    const sizeLogo = 150.0;
    const spacingLogo = (sizeLogo / 100) * 5;
    return Center(
      child: SizedBox(
        height: sizeLogo,
        width: sizeLogo,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: sizeLogo / 2,
                  width: sizeLogo / 2,
                  decoration: BoxDecoration(
                    color: primarycolor,
                    borderRadius: BorderRadius.circular(sizeLogo / 2),
                  ),
                ),
                // Container(
                //   height: spacingLogo,
                // ),
                Container(
                  height: sizeLogo / 2,
                  width: sizeLogo / 2,
                  decoration: BoxDecoration(
                    color: primarycolor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(sizeLogo / 2),
                    ),
                  ),
                ),
              ],
            ),
            // Container(
            //   width: spacingLogo,
            // ),
            Column(
              children: [
                Container(
                  height: sizeLogo / 2,
                  width: sizeLogo / 2,
                  decoration: BoxDecoration(
                    color: primarycolor,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(sizeLogo / 2),
                    ),
                  ),
                ),
                Container(
                  height: sizeLogo / 2,
                  width: sizeLogo / 2,
                  decoration: BoxDecoration(
                    color: primarycolor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(sizeLogo / 2),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
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
