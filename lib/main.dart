// import'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:testagain/widgets/expenses.dart';


// import 'package:testagain/modules/onboarding.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:testagain/modules/choosepage.dart';

// Future main() async{
//   WidgetsFlutterBinding.ensureInitialized();

//   final prefs = await SharedPreferences.getInstance();
//   final showChoose = prefs.getBool('showChoose') ?? false;

//   return runApp(MyApp(showChoose: showChoose));
// }

// class MyApp extends StatelessWidget{
//   final bool showChoose;
//   const MyApp ({
//     Key ? key,
//     required this.showChoose,
// }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         primarySwatch: Colors.teal,
//       ),
//       debugShowCheckedModeBanner: false,
//       home: showChoose? Choose() : OnBoarding(),
//     );
//   }


// var kColorScheme = ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));
// var kDarkColorScheme = ColorScheme.fromSeed(
//   brightness: Brightness.dark,
//   seedColor: const Color.fromARGB(255, 5, 99, 125)
//   );
// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp
//   ]).then((value) {
//   runApp( 
//      ProviderScope(
//       child: MaterialApp(
//       darkTheme: ThemeData.dark().copyWith(
//         useMaterial3: true,
//         colorScheme: kDarkColorScheme,
//         cardTheme: const CardTheme().copyWith(
//           color: kDarkColorScheme.secondaryContainer,
//           margin: const EdgeInsets.symmetric(
//             horizontal: 16,
//             vertical: 8,
//           ),
//         ),
//       ),
//       theme: ThemeData().copyWith(
//         useMaterial3: true,
//         //scaffoldBackgroundColor: Colors.white
//         // other Theme can be set up here!!
//         colorScheme: kColorScheme,
//         appBarTheme: const AppBarTheme().copyWith(
//           backgroundColor: kColorScheme.onPrimaryContainer,
//           foregroundColor: kColorScheme.primaryContainer,
//         ),
//         cardTheme: const CardTheme().copyWith(
//           color: kColorScheme.secondaryContainer,
//           margin: const EdgeInsets.symmetric(
//             horizontal: 16,
//             vertical: 8,
//           ),
//         ),
//         elevatedButtonTheme: ElevatedButtonThemeData(
//           style: ElevatedButton.styleFrom(
//             backgroundColor: kColorScheme.primaryContainer,
//           ),
//         ),
//         textTheme: ThemeData().textTheme.copyWith(
//           titleLarge: TextStyle(
//             fontWeight: FontWeight.bold,
//             color: kColorScheme.onSecondaryContainer,
//             fontSize: 16,
//           ),
//         ),
//       ),
//       //themeMode: ThemeMode.system, // default
//       themeMode: ThemeMode.light,
//       home: const Expenses(),
//       ),
//     ));
//   });
// }
import 'package:flutter/material.dart';
import 'package:testagain/widgetsshopping/grocery_list.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Groceries',
      theme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 147, 229, 250),
          brightness: Brightness.dark,
          surface: const Color.fromARGB(255, 42, 51, 59),
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 50, 58, 60),
      ),
      home: const GroceryList(),
    );
  }
}