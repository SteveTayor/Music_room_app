import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'utils/service_locator.dart';
import 'view_model/music_service_view_model.dart';
import 'views/main_screen.dart';
import 'firebase_options.dart'; // Import your existing firebase options

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:
        DefaultFirebaseOptions.currentPlatform, // Use your firebase options
  );
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Room App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // Set app-wide dark theme with Google Fonts
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF1A1A1A),
        // Apply Syne as the default font family
        textTheme: GoogleFonts.syneTextTheme(
          Theme.of(context).textTheme.apply(
            bodyColor: Colors.white,
            displayColor: Colors.white,
          ),
        ),
        // Apply Syne to primary text theme as well
        primaryTextTheme: GoogleFonts.syneTextTheme(
          Theme.of(context).primaryTextTheme.apply(
            bodyColor: Colors.white,
            displayColor: Colors.white,
          ),
        ),
      ),
      home: ChangeNotifierProvider(
        create: (_) => getIt<MusicServiceViewModel>(),
        child: const MainScreen(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
