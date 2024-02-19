import 'dart:math';

import 'package:bmi_calculator/service/colors.dart';
import 'package:bmi_calculator/views/result_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plus/flutter_plus.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/app_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _currentSliderValue = 150;
  int _valueAge = 20;
  int _valueWeight = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        title: const Text('BMI CALCULATOR',
            style: TextStyle(
                color: kBottomContainerColour, fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AppContainer(
                components: GestureDetector(
                  onTap: () {},
                  child: const Column(
                    children: [
                      Icon(
                        FontAwesomeIcons.mars,
                        size: 105,
                        color: kBottomContainerColour,
                      ),
                      Text(
                        "HOMEM",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: kBottomContainerColour,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AppContainer(
                components: GestureDetector(
                  onTap: () {},
                  child: const Column(
                    children: [
                      Icon(
                        FontAwesomeIcons.venus,
                        size: 105,
                        color: kBottomContainerColour,
                      ),
                      Text(
                        "MULHER",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: kBottomContainerColour,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: AppContainer(
                  components: Column(
                    children: [
                      const Text(
                        "ALTURA",
                        style: TextStyle(
                          color: kBottomContainerColour,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        "${_currentSliderValue.toStringAsFixed(0)} cm",
                        style: const TextStyle(
                          color: kBottomContainerColour,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      Slider(
                        value: _currentSliderValue,
                        max: 220,
                        min: 100,
                        activeColor: kBottomContainerColour,
                        label: _currentSliderValue.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            _currentSliderValue = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppContainer(
                components: Column(children: [
                  const Text("PESO",
                      style: TextStyle(
                          color: kBottomContainerColour, fontSize: 20)),
                  Text("$_valueWeight",
                      style: const TextStyle(
                          color: kBottomContainerColour,
                          fontWeight: FontWeight.bold,
                          fontSize: 40)),
                  Row(
                    children: [
                      ContainerPlus(
                        width: 45,
                        height: 45,
                        radius: RadiusPlus.all(10),
                        color: kBottomContainerColour,
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              if (_valueWeight > 0) {
                                _valueWeight--;
                              }
                            });
                          },
                          child: const Icon(Icons.remove,
                              color: Colors.white, size: 20),
                        ),
                      ),
                      const SizedBox(width: 15),
                      ContainerPlus(
                        width: 45,
                        height: 45,
                        radius: RadiusPlus.all(10),
                        color: kBottomContainerColour,
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                _valueWeight++;
                              });
                            },
                            child: const Icon(Icons.add,
                                color: Colors.white, size: 20)),
                      ),
                    ],
                  ),
                ]),
              ),
              AppContainer(
                components: Column(children: [
                  const Text("IDADE",
                      style: TextStyle(
                          color: kBottomContainerColour, fontSize: 20)),
                  Text("$_valueAge",
                      style: const TextStyle(
                          color: kBottomContainerColour,
                          fontWeight: FontWeight.bold,
                          fontSize: 40)),
                  Row(
                    children: [
                      ContainerPlus(
                        width: 45,
                        height: 45,
                        radius: RadiusPlus.all(10),
                        color: kBottomContainerColour,
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                if (_valueAge > 0) {
                                  _valueAge--;
                                }
                              });
                            },
                            child: const Icon(Icons.remove,
                                color: Colors.white, size: 20)),
                      ),
                      const SizedBox(width: 15),
                      ContainerPlus(
                        width: 45,
                        height: 45,
                        radius: RadiusPlus.all(10),
                        color: kBottomContainerColour,
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                _valueAge++;
                              });
                            },
                            child: const Icon(Icons.add,
                                color: Colors.white, size: 20)),
                      ),
                    ],
                  ),
                ]),
              )
            ],
          ),
        ],
      ),
      bottomNavigationBar: const BottomAppBar(
        shape: CircularNotchedRectangle(),
        height: 50,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.small(
        backgroundColor: kBottomContainerColour,
        onPressed: () {
          double convert = _currentSliderValue / 100;
          double bmiResult = _valueWeight / pow(convert, 2);
          String formattedBMIResult = bmiResult.toStringAsFixed(1);

          String bmiText = "";
          String resultTextMessage = "";

          if (bmiResult < 18.5) {
            bmiText = "Abaixo do peso";
          } else if (bmiResult < 25) {
            bmiText = "Peso normal";
          } else if (bmiResult < 30) {
            bmiText = "Sobrepeso";
          } else if (bmiResult < 35) {
            bmiText = "Obesidade Classe I";
          } else if (bmiResult < 40) {
            bmiText = "Obesidade Classe II";
          } else {
            bmiText = "Obesidade Classe III (obesidade mórbida)";
          }

          switch (bmiText) {
            case 'Abaixo do peso':
              resultTextMessage =
                  'Você está abaixo do peso. Tente aumentar sua ingestão de alimentos nutritivos.';
            case 'Peso normal':
              resultTextMessage =
                  'Você tem um peso corporal normal. Bom trabalho!';
            case 'Sobrepeso':
              resultTextMessage =
                  'Você está com sobrepeso. Tente diminuir a ingestão de calorias e fazer mais exercícios.';
            case 'Obesidade Classe I':
              resultTextMessage =
                  'Você está com obesidade Classe I. É importante consultar um médico para um plano de perda de peso.';
            case 'Obesidade Classe II':
              resultTextMessage =
                  'Você está com obesidade Classe II. Consulte um médico para orientações sobre perda de peso e possíveis intervenções.';
            case 'Obesidade Classe III (obesidade mórbida)':
              resultTextMessage =
                  'Você está com obesidade Classe III (obesidade mórbida). Consulte imediatamente um médico para tratamento e intervenções.';
            default:
              resultTextMessage = '';
          }

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ResultPage(bmiResult: formattedBMIResult, bmiText: bmiText, resultTextMessage: resultTextMessage),
            ),
          );
        },
        child: const Icon(
          Icons.check,
          color: Colors.white,
        ),
      ),
    );
  }
}
