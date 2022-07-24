import 'package:flutter/material.dart';
import 'package:inews/config.dart';
import 'package:provider/provider.dart';
import '/ui/pages/explore_page.dart';
import '/ui/themeData.dart';
import 'ui/repo/news_repo.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: MyTheme.defaultTheme,
      scaffoldMessengerKey: Config.messengerKey,
      navigatorKey: Config.navigatorKey,
      home: Builder(builder: (context) {
        Config.init(context);
        return const MyHomePage(title: 'Flutter Demo Home Page');
      }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (_) => NewsRepo('en'),
      )
    ], child: const Scaffold(body: ExplorePage()));
  }
}
