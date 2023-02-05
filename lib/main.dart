import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:device_preview/device_preview.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';

void main() => runApp(ModularApp(module: AppModule(), child: AppWidget()));
