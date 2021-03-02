import 'package:docs/company_page.dart';
import 'package:docs/main_page.dart';
import 'package:docs/personal_page.dart';
import 'package:docs/univ_page.dart';
import 'package:docs/util.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:easy_localization/easy_localization.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ko')],
      path: 'lib/l10n',
      fallbackLocale: Locale('ko'),
      child: LoadApp()));
}

class LoadApp extends StatelessWidget {
  final Future<FirebaseApp> _init = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _init,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Error();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return Success();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Loading();
      },
    );
  }
}

class Error extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Util.log("firebase error");
    return Container();
  }
}

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Util.log("firebase loading ");

    return Container();
  }
}

class Success extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Util.log("firebase success");
    return MaterialApp(
      title: 'title'.tr(),
      theme: ThemeData(fontFamily: 'UbuntuMono'),
      onGenerateRoute: (route) {
        switch (route.name) {
          case '/':
            MaterialPageRoute(builder: (context) {
              return MainPage();
            });
            break;
          case '/univ':
            MaterialPageRoute(builder: (context) {
              return UnivPage();
            });
            break;
          case '/comp':
            MaterialPageRoute(builder: (context) {
              return CompanyPage();
            });
            break;
          case '/pers':
            MaterialPageRoute(builder: (context) {
              return PersonalPage();
            });
            break;
          default:
        }
      },
      routes: {
        '/': (context) => MainPage(),
        '/univ': (context) => UnivPage(),
        '/comp': (context) => CompanyPage(),
        '/pers': (context) => PersonalPage(),
      },
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
