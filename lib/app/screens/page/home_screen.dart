import 'package:flutter/Material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

import '../store/home_store.dart';

class HomeScreen extends StatelessWidget {
  final HomeStore store;

  const HomeScreen({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
            title: Text(
              'Dorminhoco',
              style: GoogleFonts.inter(),
            ),
            centerTitle: true,
            actions: [
              Observer(
                builder: (_) {
                  if (store.bluetoothOn) {
                    return const Icon(Icons.bluetooth_connected);
                  }
                  return const Icon(Icons.music_note);
                },
              ),
            ]),
        bottomNavigationBar: BottomAppBar(
          child: SizedBox(
            height: height * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    IconButton(
                      padding: const EdgeInsets.only(top: 10),
                      onPressed: () {
                        Modular.to.pushNamed('/per_batery');
                      },
                      icon: const Icon(Icons.battery_std_sharp),
                    ),
                    Text(
                      'Bateria',
                      style: GoogleFonts.inter(
                        color: Theme.of(context).cardColor,
                        fontSize: height * 0.015,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      padding: const EdgeInsets.only(top: 10),
                      onPressed: () {
                        Modular.to.pushNamed('/per_time');
                      },
                      icon: const Icon(Icons.timer),
                    ),
                    Text(
                      'Cronômetro',
                      style: GoogleFonts.inter(
                        color: Theme.of(context).cardColor,
                        fontSize: height * 0.015,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        body: const RouterOutlet(),
    );
  }
}
