import 'package:flutter/material.dart';
import 'package:inews/config.dart';
import '/helper/txt.dart';
import '/ui/widgets/CCard.dart';

class CommonView_3 {
  CommonView_3(this.context) {
    _txtTheme = Theme.of(context).textTheme;
  }

  final data = [
    {
      'title': 'Easy to Integrate',
      'about': 'Track and analyze large volumes of news data related'
          ' to your organization and uncover valuable insights with our news API.',
      'image': 'assets/images/integrate.png'
    },
    {
      'title': '99% SLA time',
      'about': '99% SLA time to provide an uninterrupted and seamless'
          ' user experience with guaranteed accuracy with our news API.',
      'image': 'assets/images/sla.png'
    },
    {
      'title': 'Custom Domain',
      'about': 'Use various text analytics models to analyze news data'
          ' and extract insights for data-driven decision-making with our news API.',
      'image': 'assets/images/www.png'
    },
    {
      'title': '9 Languages',
      'about': 'Track global news sources in 34 different languages to'
          ' access relevant news minutes after it is published with our news API.',
      'image': 'assets/images/language.png'
    },
    {
      'title': '10K+ News Sources',
      'about': 'Extract news data from over 10,000 trusted news sources'
          ' worldwide with our news API.',
      'image': 'assets/images/news.png'
    },
    {
      'title': 'Download the Data',
      'about': 'Extract valuable news data in a Excel, CSV and JSON file'
          ' along with analytical insights in a PDF report with our news API.',
      'image': 'assets/images/download.png'
    }
  ];
  late TextTheme _txtTheme;
  final BuildContext context;

  Widget get v1 => Column(children: [
        Txt(
          'iNews API Features',
          style: _txtTheme.titleLarge,
        ),
        SizedBox(height: flexHeight(24)),
        SizedBox(
          width: widthOf(70),
          child: Txt(
            'News API is a simple, easy-to-use REST API '
            'that returns JSON search results for current'
            ' and historic news articles published by over'
            ' 10,000 indian sources.',
            textAlign: TextAlign.center,
            style: _txtTheme.bodyMedium,
          ),
        ),
      ]);

  Widget get v2 => Padding(
        padding: EdgeInsets.symmetric(vertical: flexHeight(24)),
        child: Wrap(
          alignment: WrapAlignment.center,
          children: data
              .map((e) => CCard(
                  size: const Size(325, 200),
                  image: e['image'] as String,
                  title: e['title'] as String,
                  content: e['about'] as String))
              .toList(),
        ),
      );

  _v4Txt(String top, String bottom) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Txt(top, style: _txtTheme.displayLarge),
          SizedBox(height: flexHeight(8)),
          Txt(bottom, style: _txtTheme.titleSmall)
        ],
      );

  Widget get v4 => Container(
      color: const Color(0xffE8E8E8),
      width: Config.screenWidth,
      height: flexHeight(150),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        _v4Txt('1K+', 'Satisfied users'),
        _v4Txt('10K+', 'Source'),
        _v4Txt('10M+', 'New articles daily'),
        _v4Txt('9+', 'Language'),
        _v4Txt('21+', 'Category')
      ]));

  Widget get v3 => Container(
      height: kToolbarHeight,
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Txt(
              'Developed by: rahulsharmadev',
              color: Colors.white,
              style: _txtTheme.labelSmall,
            ),
          )
        ],
      ));
}
