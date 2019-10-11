import 'package:abigo_mobile/data/pref.dart';
import 'package:abigo_mobile/data/repository.dart';
import 'package:abigo_mobile/screens/live/live_text_page.dart';
import 'package:flutter/material.dart';
import 'package:abigo_mobile/screens/live/live_talk_page.dart';

class LiveScreen extends StatefulWidget {
  final String method;
  LiveScreen({@required this.method});

  @override
  State<StatefulWidget> createState() => LiveScreenState();
}

class LiveScreenState extends State<LiveScreen> {
  PageController _pageController;
  final List<Widget> _pages = [];

  int _currentPage = 0;

  @override
  void initState() {
    _pageController = PageController();
    if (widget.method == Pref.INPUT_METHOD_VOICE)
      _pages.addAll([
        LiveTalkPage(),
        LiveTextScreen(),
      ]);
    else
      _pages.addAll([
        LiveTextScreen(),
        LiveTalkPage(),
      ]);

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
