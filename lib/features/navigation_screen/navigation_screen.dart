import 'package:FeatureRichArchFlutter/features/profile_screen/profile_screen.dart';

import '../add_screen/view/add_screen.dart';
import '/features/search_screen.dart/view/search_screen.dart';

import '../../extensions/app_theme_extensions.dart';
import '/exporter/exporter.dart';
import 'package:flutter/material.dart';

import '../../services/show_exit_confirmation_dialogue.dart';
import '../home_screen/home_screen.dart';

class NavigationScreen extends StatefulWidget {
  static const String path = '/navigation-screen';

  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;
  bool _canPop = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Widget> get _pages => [
        // const Center(child: Text('Search Page')),
        HomeScreen(openDrawer: () => _scaffoldKey.currentState?.openDrawer()),
        // PaginatedHomescreen(
        //     openDrawer: () => _scaffoldKey.currentState?.openDrawer()),

        SearchScreen(),
        // const Center(child: Text('Search Page')),
        AddScreen(),
        // const Center(child: Text('Add Page')),
        const Center(child: Text('Notifications Page')),
        // const Center(child: Text('Profile Page')),
        ProfileScreen()
      ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appColors = theme.extension<AppThemeColors>()!;
    final TextStyle drawerTextStyle =
        context.labelMedium.copyWith(color: appColors.textContrastColor);
    final navBarTheme = NavigationBarTheme.of(context);

    return PopScope(
      canPop: _canPop,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) {
          final navigator = Navigator.of(context);

          final confirm = await showExitConfirmationToast(context);
          // final confirm = await showExitConfirmationDialog(context);
          if (!mounted) return;
          if (confirm) {
            setState(() => _canPop = true);
            navigator.maybePop(result);
          }
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          backgroundColor: theme.scaffoldBackgroundColor,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: CustomColors.secondaryColor,
                ),
                child: Text('Drawer Header'),
              ),
              ListTile(title: Text('Home', style: drawerTextStyle)),
              ListTile(title: Text('Settings', style: drawerTextStyle)),
            ],
          ),
        ),

        // key: _scaffoldKey,
        body: GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: IndexedStack(index: _selectedIndex, children: _pages)),
        bottomNavigationBar: Material(
          elevation: 40,
          shadowColor: Colors.black,
          child: BottomNavigationBar(
            elevation: 10,
            currentIndex: _selectedIndex,
            onTap: (index) => setState(() => _selectedIndex = index),
            type: BottomNavigationBarType.fixed,
            // backgroundColor: appColors.background,
            backgroundColor: navBarTheme.backgroundColor,
            selectedItemColor: CustomColors.primaryColor,
            unselectedItemColor: CustomColors.textColorGrey,
            selectedFontSize: 12.fSize,
            unselectedFontSize: 12.fSize,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
            unselectedLabelStyle:
                const TextStyle(fontWeight: FontWeight.normal),
            selectedIconTheme: IconThemeData(size: 24.h),
            unselectedIconTheme: IconThemeData(size: 24.h),
            items: List.generate(5, (index) => _buildNavItem(index)),
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(int index) {
    final icons = [
      Icons.home,
      Icons.search,
      Icons.add,
      Icons.notifications,
      Icons.person,
    ];
    final labels = ['Home', 'Search', 'Add', 'Alerts', 'Profile'];
    final bool isSelected = _selectedIndex == index;

    return BottomNavigationBarItem(
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            width: isSelected ? 16.h : 0,
            height: isSelected ? 3.v : 0,
            margin: EdgeInsets.only(bottom: isSelected ? 2 : 0),
            decoration: BoxDecoration(
              color: CustomColors.primaryColor,
              borderRadius: BorderRadius.circular(CustomPadding.paddingSmall),
            ),
          ),
          Icon(icons[index]),
        ],
      ),
      label: labels[index],
    );
  }
}
