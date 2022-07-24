// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'package:inews/config.dart';
import 'package:inews/ui/repo/news_repo.dart';
import 'package:provider/provider.dart';
import '/helper/txt.dart';
import '/helper/utility_widgets.dart';
import '/ui/pages/common_view_3.dart';
import '/ui/widgets/moniter.dart';

import '../themeData.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    onSet(int n) => controller.animateToPage(n,
        duration: const Duration(milliseconds: 800),
        curve: Curves.fastLinearToSlowEaseIn);

    var view3 = CommonView_3(context);
    var views = [
      _View_1(onDemo: () => onSet(1)),
      _View_2(),
      view3.v1,
      view3.v2,
      view3.v4,
      view3.v3
    ];
    var duration = const Duration(seconds: 1);
    var curve = Curves.fastLinearToSlowEaseIn;
    return Scaffold(
        body: Stack(
      children: [
        ListView(
          controller: controller,
          children: views,
        ),
      ],
    ));
  }
}

class _View_1 extends StatelessWidget {
  final VoidCallback onDemo;
  const _View_1({Key? key, required this.onDemo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var txtTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: Config.screenHeight,
      child: Row(
        children: [
          Expanded(
            child: Image.asset(
              'assets/images/top.png',
              fit: BoxFit.contain,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  FittedBox(
                    child: Txt("Search Indian news with iNews API ",
                        textAlign: TextAlign.center,
                        style: txtTheme.displayMedium),
                  ),
                  SizedBox(height: flexHeight(24)),
                  FittedBox(
                    child: SizedBox(
                      width: 650,
                      child: Txt(
                          "Locate articles and breaking news headlines from news "
                          "sources and blogs across the web with our "
                          "JSON API.",
                          textAlign: TextAlign.center,
                          style: txtTheme.titleMedium!
                              .copyWith(fontWeight: FontWeight.normal)),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      OutlinedButton(
                          onPressed: onDemo,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Padding(
                                  padding: EdgeInsets.only(right: 8.0),
                                  child: Icon(Icons.remove_red_eye_rounded)),
                              Txt("Demo")
                            ],
                          )),
                      const SizedBox(width: 16),
                      ElevatedButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Txt("Get API Key"),
                              Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Icon(Icons.arrow_forward_rounded),
                              )
                            ],
                          )),
                    ],
                  ),
                  const Spacer()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _View_2 extends StatefulWidget {
  const _View_2({Key? key}) : super(key: key);

  @override
  State<_View_2> createState() => _View_2State();
}

class _View_2State extends State<_View_2> {
  final controller = TextEditingController(text: 'en');
  Future<void> onSearch() async {
    context.read<NewsRepo>().fetchData(controller.text);
  }

  @override
  Widget build(BuildContext context) {
    var newsList = context.watch<NewsRepo>().newsList;
    var txtTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: Config.screenHeight,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Txt(
              'iNews API Demo',
              style: txtTheme.titleLarge,
            ),
            SizedBox(height: flexHeight(8)),
            SizedBox(
              width: Config.screenWidth * 0.5,
              child: Txt(
                'Searching and filtering is extremely easy and fast with our API,'
                ' check out the documentation for more details.',
                textAlign: TextAlign.center,
                style: txtTheme.bodyMedium,
              ),
            ),
            SizedBox(height: flexHeight(24)),
            Container(
              height: flexHeight(40),
              width: Config.screenWidth * 0.6,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: const Color(0xffF3F3F3)),
              child: Row(
                children: [
                  Container(
                    color: const Color(0xffCECECE),
                    height: flexHeight(40),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8),
                    child: Txt('GET', style: txtTheme.bodySmall),
                  ),
                  Expanded(
                      child: UtilityMaterial.txtField(
                          controller: controller,
                          border: InputBorder.none,
                          style: txtTheme.bodySmall)),
                  InkWell(
                    onTap: onSearch,
                    child: Container(
                      color: primeryColor,
                      height: flexHeight(40),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(8),
                      child: Txt('Search',
                          style: txtTheme.bodySmall, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: flexHeight(24)),
            Moniter(
              // ignore: sort_child_properties_last
              child: newsList != null
                  ? ListView.builder(
                      itemCount: newsList.length,
                      itemBuilder: (build, i) => Center(
                            child: Container(
                              width: widthOf(isExpended ? 50 : 100),
                              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 12,
                                        child: Text(
                                          '${i + 1}',
                                          style: txtTheme.bodySmall,
                                        )),
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () async {
                                        html.window.open(
                                            newsList[i].simpleUrl ??
                                                'www.google.com',
                                            'new tab');
                                      },
                                      child: Card(
                                        color: Colors.white,
                                        clipBehavior: Clip.hardEdge,
                                        child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              newsList[i].imgSd != null
                                                  ? Image.network(
                                                      newsList[i].imgSd!,
                                                      fit: BoxFit.cover,
                                                      height: flexHeight(100),
                                                      width: flexHeight(150),
                                                    )
                                                  : Offstage(),
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                      newsList[i].title ?? '',
                                                      style:
                                                          txtTheme.bodyMedium),
                                                ),
                                              )
                                            ]),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ))
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
              height: Config.screenHeight * 0.7,
              borderRadius: BorderRadius.circular(4),
            ),
          ],
        ),
      ),
    );
  }
}
