import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_challenge/Utils/client.dart';
import 'package:shopping_challenge/provider/CartProvider.dart';
import 'package:shopping_challenge/screens/home/home.dart';
import 'package:sizer/sizer.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'constants/constants.dart';

void main() {
  var app = GraphQLProvider(
    client: client,
    child: const MyApp(),
  );

  runApp(app);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => CartProvider()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                  backgroundColor: Colors.white.withOpacity(0.9),
                  elevation: 0.5),
              primarySwatch: Colors.blue,
              backgroundColor: bgColor,
              fontFamily: 'SegUIVar',
            ),
            home: const ProductTabHomePage(),
          ),
        );
      },
    );
  }
}
