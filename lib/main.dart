import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_qr_maps/routes/app_routes.dart';
import 'package:flutter_qr_maps/theme/app_theme.dart';
import 'package:flutter_qr_maps/providers/providers.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UiProvider()),
        ChangeNotifierProvider(create: (_) => ScanListProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Qr Reader',
        initialRoute: AppRoute.initialRoute,
        routes: AppRoute.getAppRoutes(),
        theme: AppTheme.dartTheme,
      ),
    );
  }
}
