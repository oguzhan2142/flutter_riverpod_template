import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:education_social_platform_app/features/profile/screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _indexProvider = StateProvider<int>((ref) {
  return 0;
});

class MainScreen extends ConsumerWidget {
  MainScreen({super.key});

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(_indexProvider, (previous, next) {
      _pageController.jumpToPage(next);
    });

    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: <Widget>[
            Container(
              color: Colors.blueGrey,
            ),
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.green,
            ),
            const ProfileScreen(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: ref.watch(_indexProvider),
        onItemSelected: (index) {
          ref.read(_indexProvider.notifier).state = index;
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            title: const Text('Item One'),
            icon: const Icon(Icons.home),
          ),
          BottomNavyBarItem(
            title: const Text('Item Two'),
            icon: const Icon(Icons.apps),
          ),
          BottomNavyBarItem(
            title: const Text('Item Three'),
            icon: const Icon(Icons.chat_bubble),
          ),
          BottomNavyBarItem(
            title: const Text('Item Four'),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}
