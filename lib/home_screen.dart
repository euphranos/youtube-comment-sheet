import 'package:flutter/material.dart';
import 'package:flutter_application_3/sheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenH = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff181818),
      ),
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/asd.png',
                height: screenH * 0.35,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: InkWell(
                      onTap: () {
                        buildBottomSheet(context);
                      },
                      child: Column(
                        children: const [
                          Text("Comments"),
                          Icon(Icons.chat),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
