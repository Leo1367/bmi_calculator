import 'package:bmi_calculator/service/colors.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String bmiText;
  final String resultTextMessage;
  const ResultPage({Key? key, required this.bmiResult, required this.bmiText, required this.resultTextMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        title: const Text(
          'Resultado',
          style: TextStyle(color: kBottomContainerColour),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: kActiveCardColour,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(bmiText,
                                style: const TextStyle(
                                    color: Colors.lightGreen,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30))
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              bmiResult,
                              style: const TextStyle(
                                  color: kBottomContainerColour,
                                  fontSize: 100,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                resultTextMessage,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: kBottomContainerColour,
                                    fontSize: 20),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              color: kBottomContainerColour,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: kBottomContainerColour,
                        ),
                        child: const Text(
                          "REFAZER",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
