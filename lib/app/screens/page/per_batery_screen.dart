import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numberpicker/numberpicker.dart';

import '../../widgets/button_widget.dart';
import '../store/per_batery_store.dart';

class PerBateryScreen extends StatelessWidget {

  final PerBateryStore store;

  const PerBateryScreen({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Observer(
      builder: (_) {
        print('Batery: ${store.getMaxBateryLevel}');
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
                    'Bateria',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      color: Theme.of(context).textTheme.bodyText1!.color,
                      fontSize: height * 0.03,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    'Neste modo o dispositivo irá tocar até que a bateria atinja o nível especificado.',
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
                width: width,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).shadowColor,
                      blurRadius: 10,
                    )
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IgnorePointer(
                      ignoring: store.running,
                      child: NumberPicker(
                        infiniteLoop: true,
                        axis: Axis.horizontal,
                        minValue: 0,
                        maxValue: store.getMaxBateryLevel,
                        value: store.bateryLevel,
                        onChanged: (value) {
                          if (value > store.getMaxBateryLevel) {
                            store.setMaxBateryLevel(value);
                          }
                          store.setBateryLevel(value);
                        },
                        textStyle: const TextStyle(
                            color: Color.fromARGB(150, 67, 67, 67),
                            fontSize: 15),
                        itemCount: 3,
                        itemHeight: 100,
                        selectedTextStyle: const TextStyle(
                            color: Colors.white, fontSize: 30),
                      ),
                    ),

                    Visibility(
                      visible: store.running,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Faltam ${store.getMaxBateryLevel-store.bateryLevel}%',
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: height * 0.02,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
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
                      isEnabled: !store.running,
                      onPressed: () {
                        try{
                          store.start();
                        }catch(e){
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Erro: ${e.toString()}'),
                            ),
                          );
                        }
                      },
                    ),
                    ButtonWidget(
                        text: "Stop",
                        isEnabled: store.running,
                        onPressed: () {
                          store.stop();
                        }),
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
