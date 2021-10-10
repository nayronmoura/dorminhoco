import 'dart:async';

import 'package:dorminhoco/notification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:numberpicker/numberpicker.dart';

class Numb extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<Numb> {
  int hours = 0;
  int minuts = 0;
  int secunds = 0;
  bool _isButtonDisabled = false;
  Timer? time;

  static const platform =
      const MethodChannel('com.example.dorminhoco/bluetooth');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        ),
        body: Container(
          color: Theme.of(context).backgroundColor,
          child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context).shadowColor,
                              //offset: Offset(5.5, 5),
                              blurRadius: 10,
                            )
                          ]),
                      margin: EdgeInsets.all(40.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [                         IgnorePointer(
                              ignoring: _isButtonDisabled,
                              child: NumberPicker(
                                minValue: 0,
                                maxValue: 60,
                                value: hours,
                                onChanged: (value) =>
                                    setState(() => hours = value),
                                textStyle: TextStyle(
                                    color: Color.fromARGB(150, 67, 67, 67),
                                    fontSize: 15),
                                itemCount: 3,
                                itemHeight: 100,
                                selectedTextStyle: TextStyle(
                                    color: Colors.black, fontSize: 30),
                              )),
                          IgnorePointer(
                              ignoring: _isButtonDisabled,
                              child: NumberPicker(
                                minValue: 0,
                                maxValue: 60,
                                value: minuts,
                                onChanged: (value) =>
                                    setState(() => minuts = value),
                                textStyle: TextStyle(
                                    color: Color.fromARGB(150, 67, 67, 67),
                                    fontSize: 15),
                                itemCount: 3,
                                itemHeight: 100,
                                selectedTextStyle: TextStyle(
                                    color: Colors.black, fontSize: 30),
                              )),
                          IgnorePointer(
                              ignoring: _isButtonDisabled,
                              child: NumberPicker(
                                minValue: 0,
                                maxValue: 60,
                                value: secunds,
                                onChanged: (value) =>
                                    setState(() => secunds = value),
                                textStyle: TextStyle(
                                    color: Color.fromARGB(150, 67, 67, 67),
                                    fontSize: 15),
                                itemCount: 3,
                                itemHeight: 100,
                                selectedTextStyle: TextStyle(
                                    color: Colors.black, fontSize: 30),
                              ))
                        ],
                      )),
                  Container(
                    height: 75,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _startbutton(),
                      Container(
                        width: 50,
                      ),
                      _pausebutton(),
                      Container(
                        width: 50,
                      ),
                      _stopbutton()
                    ],
                  ),
                ],
              ))),
        ));
  }

  void _disablebluetooth() async {
    await platform.invokeMethod("blutetoothdisable");
    setState(() {
      _isButtonDisabled = false;
    });
  }

  ElevatedButton _stopbutton() {
    return ElevatedButton(
        onPressed: _isButtonDisabled
            ? () {
                _isButtonDisabled = false;
                hours = 0;
                minuts = 0;
                secunds = 0;
              }
            : null,
        child: Text("Parar"));
  }

  ElevatedButton _pausebutton() {
    return ElevatedButton(
        onPressed: _isButtonDisabled
            ? () {
                _isButtonDisabled = false;
              }
            : null,
        child: Text("Pause"));
  }

  ElevatedButton _startbutton() {
    return ElevatedButton(
        onPressed: _isButtonDisabled
            ? null
            : () {
                if(secunds+minuts+hours>0){
                  NotificationService()
                    .showNotifications(0,"Pode dormir tranquilo!!", "O timer acabou de iniciar!");
                Timer time = Timer.periodic(
                    Duration(hours: hours, minutes: minuts, seconds: secunds),
                    (timer) {
                  _disablebluetooth();
                  NotificationService()
                    .showNotifications(1,"Finalizandooo", "O tempo acabou de finalizar e seu bluetooth foi desligado.");
                  _isButtonDisabled = false;
                  timer.cancel();
                  //exit(0);
                });
                Timer.periodic(Duration(seconds: 1), (timer) {
                  if (!_isButtonDisabled) {
                    time.cancel();
                    timer.cancel();
                  }
                  if (secunds > 0) {
                    secunds--;
                  } else {
                    if (minuts > 0) {
                      minuts--;
                      secunds = 60;
                    } else {
                      if (hours > 0) {
                        hours--;
                        minuts = 60;
                      }
                    }
                  }
                  if (secunds == 0 && minuts == 0 && hours == 0) {

                    timer.cancel();
                  }
                  setState(() {});
                  //exit(0);
                });
                _isButtonDisabled = true;
                setState(() {});}
              },
        child: Text("Começar"));
  }
}
