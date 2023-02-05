import 'package:dorminhoco/app/common/bluetooth_service.dart';
import 'package:dorminhoco/app/screens/page/home_screen.dart';
import 'package:dorminhoco/app/screens/page/per_batery_screen.dart';
import 'package:dorminhoco/app/screens/store/home_store.dart';
import 'package:dorminhoco/app/screens/store/per_batery_store.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../common/notification_service.dart';
import '../screens/page/per_time_screen.dart';
import '../screens/store/per_time_store.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton(
      (i) => NotificationService(),
    ),
    Bind.singleton(
      (i) => BluetoothService(
        flutterBlue: i.get(),
        notificationService: i.get(),
      ),
    ),
    Bind.factory(
      (i) => PerTimeStore(
        manageService: i.get(),
      ),
    ),
    Bind.factory(
      (i) => HomeStore(
        manageService: i.get(),
      ),
    ),
    Bind.factory(
      (i) => PerBateryStore(
        bluetoothService: i.get(),
      ),
    )
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => HomeScreen(
        store: Modular.get(),
      ),
      customTransition: CustomTransition(
        transitionDuration: const Duration(seconds: 10),
        transitionBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      ),
      children: [
        ChildRoute(
          '/per_time',
          child: (_, args) => PerTimeScreen(store: Modular.get()),
        ),
        ChildRoute(
          '/per_batery',
          child: (_, args) => PerBateryScreen(
            store: Modular.get(),
          ),
        )
      ],
    ),
  ];
}
