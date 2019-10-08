import 'package:abigo_mobile/data/pref.dart';
import 'package:abigo_mobile/data/repository.dart';
import 'package:abigo_mobile/screens/live/live_text_page.dart';
import 'package:flutter/material.dart';
import 'package:abigo_mobile/screens/live/live_talk_page.dart';

class LiveScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LiveScreenState();
}

class LiveScreenState extends State<LiveScreen> {
  PageController _pageController;
  final _pages = [
    LiveTextScreen(),
    LiveTalkPage(),
  ];

  int _currentPage = 0;

  @override
  void initState() {
    _pageController = PageController();
    Repository().getInputMethod().then((method) {
      if (method == Pref.INPUT_METHOD_VOICE)
        _pageController.animateToPage(1,
            duration: Duration(milliseconds: 300), curve: Curves.ease);
    });
    super.initState();
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      scrollDirection: Axis.horizontal,
      children: _pages,
      onPageChanged: _onPageChanged,
    );
  }
}
