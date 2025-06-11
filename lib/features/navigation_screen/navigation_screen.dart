import 'package:flutter/material.dart';

import '../../main.dart';
import '../../services/show_exit_confirmation_dialogue.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});
  static const String path = '/navigation_screen';

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;
  bool _canPop = false;

  final List<Widget> _pages = [
    Center(child: ElevatedButton(onPressed: () => MyApp.toggleTheme(), child: const Text('Toggle Theme'))),
    const Center(child: Text('Search Page')),
    const Center(child: Text('Add Page')),
    const Center(child: Text('Notifications Page')),
    const Center(child: Text('Profile Page')),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PopScope(
      canPop: _canPop,
     
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) {
          final navigator = Navigator.of(context);
          final confirm = await showExitConfirmationDialog(context);
          if (!mounted) return;
          if (confirm) {
            setState(() => _canPop = true);
            navigator.maybePop(result);
          }
        }
      },
      child: Scaffold(
        body: IndexedStack(index: _selectedIndex, children: _pages),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: theme.colorScheme.primary,
          unselectedItemColor: theme.unselectedWidgetColor,
          backgroundColor: theme.scaffoldBackgroundColor,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
            BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Alerts'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}






