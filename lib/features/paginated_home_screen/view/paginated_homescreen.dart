import 'package:FeatureRichArchFlutter/exporter/exporter.dart';
import 'package:FeatureRichArchFlutter/extensions/app_theme_extensions.dart';
import 'package:FeatureRichArchFlutter/features/paginated_home_screen/data/home_service.dart';
import 'package:FeatureRichArchFlutter/main.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PaginatedHomescreen extends StatefulWidget {
  final VoidCallback openDrawer;
  static const String path = '/home-screen';
  const PaginatedHomescreen({super.key,required this.openDrawer});

  @override
  State<PaginatedHomescreen> createState() => _PaginatedHomescreenState();
}

class _PaginatedHomescreenState extends State<PaginatedHomescreen> {
  final int _pageSize = 20;

  final PagingController<int, dynamic> _pagingController =
      PagingController(firstPageKey: 1);
@override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    // TODO: implement initState
    super.initState();
  }
      
  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await HomeService.getBeerList(pageKey, _pageSize);
      final isLastPage = newItems!.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      logError(_pagingController.error);
      _pagingController.error = error;
    }
  }
  

  @override
  Widget build(BuildContext context) {
        final appColors = Theme.of(context).extension<AppThemeColors>()!;

    return Scaffold(
      appBar:  AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu, color: appColors.dynamicIconColor),
          onPressed: widget.openDrawer,
        ),
        actions: [
          IconButton(
            onPressed: () => MyApp.toggleTheme(),
            icon: Icon(Icons.brightness_6, color: appColors.dynamicIconColor),
          ),
        ],
        title: Text('Home Screen',
            style: TextStyle(color: appColors.textContrastColor)),
        centerTitle: true,
        backgroundColor: appColors.background,
      ),
      body: PagedListView<int, dynamic>.separated(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<dynamic>(
          animateTransitions: true,
          itemBuilder: (context, item, index) => ListTile(title: Text(item['name']),),
        ),
        separatorBuilder: (_, index) => const Divider(),
      ),
    );
  }
}
