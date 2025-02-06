import 'package:flutter/material.dart';


class DashboardPage extends StatelessWidget {

  final Function(int) onPageChange;

  const DashboardPage({super.key, required this.onPageChange});

  @override
  Widget build(BuildContext context) {
  return  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Dashboard',
              style: TextStyle(fontSize: 40),
            ),
            const SizedBox(height: 20),
            
          ],
        ),
      );
  
    }
  }
    
