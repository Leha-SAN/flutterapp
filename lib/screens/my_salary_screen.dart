import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:checkingwork/widgets/custom_bottom_nav_bar.dart';
import 'package:checkingwork/services/auth_service.dart';

class MySalaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);

    // Checking user autorization
    if (!authService.isLoggedIn()) {
      // If the user is not authorized, redirect him to the login screen
      Future.delayed(Duration.zero, () {
        Navigator.pushReplacementNamed(context, '/login');
      });
      return Scaffold(
        body: Center(child: CircularProgressIndicator()), //Showing a loading indicator during redirection
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Моя зарплата'),
      ),
      body: Center(
        child: Text('Здесь будет информация о вашей зарплате.'),
      ),
      bottomNavigationBar: CustomBottomNavBar(currentIndex: 2),
    );
  }
}