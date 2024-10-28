import 'package:flutter/material.dart';
import 'package:altsome_app/page/Authentication/sign_in_form.dart';
import 'package:altsome_app/page/home_page/home_page.dart';
import 'package:provider/provider.dart';

import 'page/Authentication/provider/login_auth_provider.dart';
import 'page/home_page/body/top_data_in_page_view/Provider/specification_provider.dart';
import 'service/picture_provider/upload_picture_provider.dart';

class AltsomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginAuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UploadPictureProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SpecificationProvider(),
        ),
      ],
      child: Builder(
        builder: (context) {
          String? userAccessToken =
              context.watch<LoginAuthProvider>().userAccessToken;
          return userAccessToken != null ? HomePage() : SignInForm();
        },
      ),
    );
  }
}
