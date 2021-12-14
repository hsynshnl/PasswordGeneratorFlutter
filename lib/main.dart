import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:password_generator/constant/app_constants.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String result = "";
  String password = "";
  double passwordLong = 8;
  bool isNumberSwitched = false;
  bool isUpperSwitched = false;
  bool isLowerSwitched = false;
  bool isSymbolSwitched = false;
  var random = Random();
  List<String> lowerCaseList = [
    "q",
    "w",
    "e",
    "r",
    "t",
    "y",
    "u",
    "i",
    "o",
    "p",
    "g",
    "u",
    "a",
    "d",
    "s",
    "f",
    "g",
    "h",
    "j",
    "k",
    "l",
    "z",
    "x",
    "c",
    "v",
    "b",
    "n",
    "m"
  ];
  List<String> upperCaseList = [
    "Q",
    "W",
    "E",
    "R",
    "T",
    "Y",
    "U",
    "I",
    "O",
    "P",
    "G",
    "U",
    "A",
    "D",
    "S",
    "F",
    "G",
    "H",
    "J",
    "K",
    "L",
    "Z",
    "X",
    "C",
    "V",
    "B",
    "N",
    "M"
  ];
  List<String> numberList = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"];
  List<String> symbolList = [
    ".",
    "-",
    "+",
    "=",
    "_",
    ",",
    "!",
    "@",
    "",
    "#",
    "*",
    "%",
    "<",
    ">",
    "[",
    "]",
    "{",
    "}"
  ];
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Sabitler.mainColor.shade900,
        appBar: AppBar(
          backgroundColor: Sabitler.mainColor.shade700,
          elevation: 12,
          title: const Center(
            child: Text(
              Sabitler.anaBaslik,
              style: Sabitler.baslikStyle,
            ),
          ),
        ),
        body: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _builderFlutterSwitch(
                    "Number Toggle", "number", isNumberSwitched),
                _builderFlutterSwitch(
                    "Uppercase Toggle", "upper", isUpperSwitched),
                _builderFlutterSwitch(
                    "Lowercase Toggle", "lower", isLowerSwitched),
                _builderFlutterSwitch(
                    "Symbol Toggle", "symbol", isSymbolSwitched),
                const Center(
                  child: Text(
                    "Yaklaşık Değer",
                    style: Sabitler.toogleStyle,
                  ),
                ),
                Slider(
                  value: passwordLong,
                  max: 72,
                  min: 8,
                  divisions: 8,
                  label: passwordLong.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      passwordLong = value;
                    });
                  },
                ),
                Padding(
                  padding: Sabitler.mainPadding,
                  child: ElevatedButton(
                    style: Sabitler.buttonStyle,
                    onPressed: () {
                      bool _validate = _formKey.currentState!.validate();
                      if (_validate) {
                        _formKey.currentState!.save();
                      }
                      setState(() {
                        password = "";
                      });
                      if (isNumberSwitched &&
                          isUpperSwitched &&
                          isLowerSwitched &&
                          isSymbolSwitched) {
                        _callFor(passwordLong / 4, 4, numberList, upperCaseList,
                            lowerCaseList, symbolList);
                      } else if (isNumberSwitched &&
                          isUpperSwitched &&
                          isLowerSwitched) {
                        _callFor(passwordLong / 4, 3, numberList, upperCaseList,
                            lowerCaseList, []);
                      } else if (isNumberSwitched &&
                          isUpperSwitched &&
                          isSymbolSwitched) {
                        _callFor(passwordLong / 4, 3, numberList, upperCaseList,
                            symbolList, []);
                      } else if (isNumberSwitched &&
                          isLowerSwitched &&
                          isSymbolSwitched) {
                        _callFor(passwordLong / 4, 3, numberList, lowerCaseList,
                            symbolList, []);
                      } else if (isUpperSwitched &&
                          isSymbolSwitched &&
                          isLowerSwitched) {
                        _callFor(passwordLong / 4, 3, upperCaseList,
                            lowerCaseList, symbolList, []);
                      } else if (isNumberSwitched && isUpperSwitched) {
                        _callFor(passwordLong / 2, 2, numberList, upperCaseList,
                            [], []);
                      } else if (isNumberSwitched && isLowerSwitched) {
                        _callFor(passwordLong / 2, 2, numberList, lowerCaseList,
                            [], []);
                      } else if (isNumberSwitched && isSymbolSwitched) {
                        _callFor(passwordLong / 2, 2, numberList, symbolList,
                            [], []);
                      } else if (isLowerSwitched && isSymbolSwitched) {
                        _callFor(passwordLong / 2, 2, lowerCaseList, symbolList,
                            [], []);
                      } else if (isLowerSwitched && isUpperSwitched) {
                        _callFor(passwordLong / 2, 2, lowerCaseList,
                            upperCaseList, [], []);
                      } else if (isUpperSwitched && isSymbolSwitched) {
                        _callFor(passwordLong / 2, 2, upperCaseList, symbolList,
                            [], []);
                      } else if (isUpperSwitched && isLowerSwitched) {
                        _callFor(passwordLong, 2, upperCaseList, lowerCaseList,
                            [], []);
                      } else if (isNumberSwitched) {
                        _callFor(passwordLong, 1, numberList, [], [], []);
                      } else if (isUpperSwitched) {
                        _callFor(passwordLong, 1, upperCaseList, [], [], []);
                      } else if (isLowerSwitched) {
                        _callFor(passwordLong, 1, lowerCaseList, [], [], []);
                      } else if (isSymbolSwitched) {
                        _callFor(passwordLong, 1, symbolList, [], [], []);
                      } else {
                        EasyLoading.showToast("Please make choose!",
                            duration: const Duration(seconds: 3),
                            dismissOnTap: true,
                            toastPosition: EasyLoadingToastPosition.bottom);
                      }
                    },
                    child: const Padding(
                      padding: Sabitler.mainPadding,
                      child: Text(
                        "Create",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 8, bottom: 8, left: 64, right: 64),
                  child: TextFormField(
                    controller: TextEditingController(text: password),
                    textAlign: TextAlign.center,
                    style: Sabitler.toogleStyle,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12)),
                      filled: true,
                      hintText: "Password!",
                      hintStyle: const TextStyle(color: Colors.grey),
                      fillColor: Sabitler.mainColor.shade100.withOpacity(0.2),
                    ),
                  ),
                ),
                Padding(
                  padding: Sabitler.mainPadding,
                  child: ElevatedButton.icon(
                      onPressed: () {
                        if (password.isNotEmpty) {
                          EasyLoading.showToast("Copied!",
                              duration: const Duration(seconds: 3),
                              dismissOnTap: true,
                              toastPosition: EasyLoadingToastPosition.bottom);
                          Clipboard.setData(ClipboardData(text: password));
                        } else {
                          EasyLoading.showToast("Please make choose!",
                              duration: const Duration(seconds: 3),
                              dismissOnTap: true,
                              toastPosition: EasyLoadingToastPosition.bottom);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Sabitler.buttonSize,
                        primary: Sabitler.mainColor.shade700,
                        elevation: 12,
                        shape: Sabitler.borderShape,
                      ),
                      icon: const Icon(Icons.copy),
                      label: const Text(
                        "Copy!",
                        style: TextStyle(fontSize: 20),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
      builder: EasyLoading.init(),
    );
  }

  Padding _builderFlutterSwitch(
      String textToggle, String toggle, bool passSwitch) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8, left: 32, right: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              textToggle,
              style: Sabitler.toogleStyle,
            ),
          ),
          FlutterSwitch(
            inactiveColor: Sabitler.mainColor.shade700,
            activeColor: Colors.blue,
            value: passSwitch,
            showOnOff: true,
            onToggle: (val) {
              setState(() {
                switch (toggle) {
                  case "number":
                    isNumberSwitched = val;
                    break;
                  case "upper":
                    isUpperSwitched = val;
                    break;
                  case "lower":
                    isLowerSwitched = val;
                    break;
                  case "symbol":
                    isSymbolSwitched = val;
                    break;
                }
              });
            },
          ),
        ],
      ),
    );
  }

  void _callFor(double passwordLong, int howManyListHave, List passingListOne,
      List passingListTwo, List passingListThree, List passingListFour) {
    switch (howManyListHave) {
      case 1:
        for (int i = 0; i < passwordLong; i++) {
          password += passingListOne[_callRandom(passingListOne)];
        }
        break;
      case 2:
        for (int i = 0; i < passwordLong; i++) {
          password += passingListOne[_callRandom(passingListOne)] +
              passingListTwo[_callRandom(passingListTwo)];
        }
        break;
      case 3:
        for (int i = 0; i < passwordLong; i++) {
          password += passingListOne[_callRandom(passingListOne)] +
              passingListTwo[_callRandom(passingListTwo)] +
              passingListThree[_callRandom(passingListThree)];
        }
        break;
      case 4:
        for (int i = 0; i < passwordLong; i++) {
          password += passingListOne[_callRandom(passingListOne)] +
              passingListTwo[_callRandom(passingListTwo)] +
              passingListThree[_callRandom(passingListThree)] +
              passingListFour[_callRandom(passingListFour)];
        }
        break;
      default:
    }
  }

  int _callRandom(List list) {
    return random.nextInt(list.length);
  }
}
