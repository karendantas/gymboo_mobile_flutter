import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gymboo_app/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


const skipAuthInDev  = false;

void main()  async {

  WidgetsFlutterBinding.ensureInitialized();
   SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(
    ProviderScope(

      child: const GymbooApp(),
    )
  );
}

