import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../widgets/button_widget.dart';
import '../store/per_time_store.dart';

class PerTimeScreen extends StatelessWidget {
  PerTimeStore store;

  PerTimeScreen({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Observer(
      builder: (_) {
        return Container(
          color: Theme.of(context).backgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: ListTile(
                  title: Text(
                    'Tempo',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      color: Theme.of(context).textTheme.bodyText1!.color,
                      fontSize: height * 0.03,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    'Neste modo você pode definir o tempo de duração que a música irá tocar.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      color: Theme.of(context).textTheme.bodyText1!.color,
                      fontSize: height * 0.015,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).shadowColor,
                      blurRadius: 10,
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IgnorePointer(
                      ignoring: store.isButtonDisabled,
                      child: NumberPicker(
                        infiniteLoop: true,
                        minValue: 0,
                        maxValue: 24,
                        value: store.time.hour,
                        onChanged: (value) => store.setHour(value),
                        textStyle: const TextStyle(
                            color: Color.fromARGB(150, 67, 67, 67),
                            fontSize: 15),
                        itemCount: 3,
                        itemHeight: 100,
                        selectedTextStyle: const TextStyle(
                            color: Colors.white, fontSize: 30),
                      ),
                    ),
                    IgnorePointer(
                      ignoring: store.isButtonDisabled,
                      child: NumberPicker(
                        infiniteLoop: true,
                        minValue: 0,
                        maxValue: 59,
                        value: store.time.minute,
                        onChanged: (value) => store.setMinute(value),
                        textStyle: const TextStyle(
                            color: Color.fromARGB(150, 67, 67, 67),
                            fontSize: 15),
                        itemCount: 3,
                        itemHeight: 100,
                        selectedTextStyle: const TextStyle(
                            color: Colors.white, fontSize: 30),
                      ),
                    ),
                    IgnorePointer(
                      ignoring: store.isButtonDisabled,
                      child: NumberPicker(
                        infiniteLoop: true,
                        minValue: 0,
                        maxValue: 59,
                        value: store.time.second,
                        onChanged: (value) => store.setSecond(value),
                        textStyle: const TextStyle(
                            color: Color.fromARGB(150, 67, 67, 67),
                            fontSize: 15),
                        itemCount: 3,
                        itemHeight: 100,
                        selectedTextStyle: const TextStyle(
                            color: Colors.white, fontSize: 30),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ButtonWidget(
                      text: "Start",
                      isEnabled: store.isNotDisabled,
                      onPressed: () {
                        store.start();
                      },
                    ),
                    ButtonWidget(
                        text: "Pause",
                        isEnabled: store.isButtonDisabled,
                        onPressed: () {
                          store.pause();
                        }),
                    ButtonWidget(
                      text: "Stop",
                      isEnabled: store.isButtonDisabled,
                      onPressed: () {
                        store.stop();
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
