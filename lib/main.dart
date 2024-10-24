import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'page/navigation_controller/navigation_footer.dart';
import 'package:firebase_core/firebase_core.dart';
import '../../service/storage/storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
    runApp(
      AltsomeApp(),
    );
  } catch (error) {
    runApp(MaterialApp(
      home: Center(
        child: Column(
          children: [
            SnackBar(
              content: Text(
                "Firebase connection failed",
              ),
            ),
            AltsomeApp(),
          ],
        ),
      ),
    ));
    print(
      "Error in firebase initialization: $error",
    );
  }
}

class AltsomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => initialize(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        home: NavigationFooter(),
      ),
    );
  }
}
