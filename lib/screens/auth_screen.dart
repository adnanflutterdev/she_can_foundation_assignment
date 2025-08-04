import 'package:flutter/material.dart';
import 'package:she_can_foundation/screens/home_screen.dart';
import 'package:she_can_foundation/utils/colors.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isLoginScreen = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBackground,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: cardBackground,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Intern Portal',
                    style: TextStyle(
                      color: primaryAccent,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Fundraising App',
                    style: TextStyle(color: textSecondary, fontSize: 16),
                  ),

                  SizedBox(height: 20),
                  // Email field
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 15.0,
                    ),
                    child: TextField(
                      cursorColor: primaryAccent,
                      style: TextStyle(color: textPrimary, fontSize: 16),
                      decoration: InputDecoration(
                        hintText: 'Your Email',
                        hintStyle: TextStyle(color: textSubtle, fontSize: 16),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: focusRing, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),

                  // Password field
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 15.0,
                    ),
                    child: TextField(
                      cursorColor: primaryAccent,
                      style: TextStyle(color: textPrimary, fontSize: 16),
                      decoration: InputDecoration(
                        hintText: 'password',
                        hintStyle: TextStyle(color: textSubtle, fontSize: 16),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: focusRing, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 30),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: GestureDetector(
                      onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),)),
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color: buttonPrimary,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: Text(
                            _isLoginScreen ? 'Login' : 'Sign up',
                            style: TextStyle(
                              color: textPrimary,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => setState(() {
                          _isLoginScreen = !_isLoginScreen;
                        }),
                        child: Text(
                          _isLoginScreen
                              ? 'Don\'t have a account? Sign up'
                              : 'Already have a account? Login',
                          style: TextStyle(color: textTertiary),
                          textAlign: TextAlign.end,
                        ),
                      ),
                      SizedBox(width: 15),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
