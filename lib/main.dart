import 'package:flutter/material.dart';
import 'package:profile_page_redesign/Search.dart';
import 'package:profile_page_redesign/WMM.dart';
import 'package:profile_page_redesign/add_story.dart';
import 'package:profile_page_redesign/home_screen.dart';
import 'package:profile_page_redesign/profile_screen/user_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomeScreen(),
    );
  }
}

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  PageController pageController = PageController();
  List<Widget> pages = [
    const HomeScreen(),
    const WMM(),
    const AddStory(),
    const Search(),
    const UserScreen(),
    // const ProfilePage()
  ];
  int selectIndex = 0;
  void onPageChanged(int index) {
    setState(() {
      selectIndex = index;
    });
  }

  void onItemTap(int selectedItems) {
    pageController.jumpToPage(selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromARGB(255, 97, 94, 94),
        onTap: onItemTap,
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.home,
              color: selectIndex == 0 ? Colors.green : Colors.grey,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.vpn_lock_outlined,
              color: selectIndex == 1 ? Colors.green : Colors.grey,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.add_box_outlined,
              color: selectIndex == 2 ? Colors.green : Colors.grey,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.search_outlined,
              color: selectIndex == 3 ? Colors.green : Colors.grey,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.person,
              color: selectIndex == 4 ? Colors.green : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
