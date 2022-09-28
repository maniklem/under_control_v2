import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../assets/presentation/pages/assets_page.dart';
import '../../../dashboard/presentation/pages/dashboard_page.dart';
import '../../../filter/presentation/widgets/home_page_filter.dart';
import '../../../groups/domain/entities/feature.dart';
import '../../../inventory/presentation/blocs/items_management/items_management_bloc.dart';
import '../../../inventory/presentation/pages/inventory_page.dart';
import '../../../inventory/utils/item_management_bloc_listener.dart';
import '../../../knowledge_base/presentation/pages/knowledge_base_page.dart';
import '../../../tasks/presentation/pages/tasks_page.dart';
import '../../utils/get_user_premission.dart';
import '../../utils/premission.dart';
import '../../utils/show_snack_bar.dart';
import '../../utils/size_config.dart';
import '../widgets/home_page/app_bar_search_box.dart';
import '../widgets/home_page/home_bottom_navigation_bar.dart';
import '../widgets/home_page/home_sliver_app_bar.dart';
import '../widgets/home_page/main_drawer.dart';
import '../widgets/overlay_menu/overlay_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  // search box height
  final double _searchBoxHeight = 70;

  final _scrollController = ScrollController();

  // bottom navigation controls
  final _pageController = PageController(initialPage: 2);
  int _pageIndex = 2;
  late CircularBottomNavigationController _navigationController;

  bool _isFilterExpanded = false;
  bool _isInventorySearchBarExpanded = false;
  bool _isAssetsSearchBarExpanded = false;
  bool _isControlsVisible = true;
  bool _isMenuVisible = false;

  // inventory search
  final _inventorySearchTextEditingController = TextEditingController();

  // assets search
  final _assetsSearchTextEditingController = TextEditingController();

  double _currentOffset = 0;

  String _inventoryQuery = '';
  String _assetsQuery = '';

  // bottom navigation show/hide animation
  AnimationController? _animationController;
  // Animation<Offset>? downSlideAnimation;

  // search in inventory
  void _searchInInventory() {
    setState(() {
      _inventoryQuery = _inventorySearchTextEditingController.text;
    });
  }

  // search in assets
  void _searchInAssets() {
    setState(() {
      _assetsQuery = _assetsSearchTextEditingController.text;
    });
  }

  // set page index
  void _setPageIndex(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  // show BottomNavigationTabBar
  void _showControls() {
    if (!_isControlsVisible) {
      _animationController!.reverse();
      setState(() {
        _isControlsVisible = true;
      });
    }
  }

  // hide BottomNavigationTabBar
  void _hideControls() {
    if (_isControlsVisible) {
      _animationController!.forward();
      setState(() {
        _isControlsVisible = false;
      });
    }
  }

  // show/hide filter widget
  void _toggleIsFilterExpanded() {
    setState(() {
      _isFilterExpanded = !_isFilterExpanded;
    });
  }

  // show/hide search bar widget
  void _toggleIsSearchBarExpanded() {
    setState(() {
      // closes menu and filter
      if (_isMenuVisible) {
        _toggleIsMenuVisible();
      }
      if (_isFilterExpanded) {
        _toggleIsFilterExpanded();
      }

      // toggle inventory search
      if (_isInventorySearchBarExpanded) {
        _inventorySearchTextEditingController.text = '';
        _searchInInventory();
        _isInventorySearchBarExpanded = false;
      } else if (!_isInventorySearchBarExpanded && _pageIndex == 1) {
        _isInventorySearchBarExpanded = true;
      }

      // toggle assets search
      if (_isAssetsSearchBarExpanded) {
        _assetsSearchTextEditingController.text = '';
        _searchInAssets();
        _isAssetsSearchBarExpanded = false;
      } else if (!_isAssetsSearchBarExpanded && _pageIndex == 3) {
        _isAssetsSearchBarExpanded = true;
      }
    });
  }

  bool _getFlagForPageIndex(int index) {
    if (_pageIndex == 1) {
      return _isInventorySearchBarExpanded;
    } else {
      return _isAssetsSearchBarExpanded;
    }
  }

  // show overlay menu
  void _toggleIsMenuVisible() {
    bool premision = true;
    // no inventory read premission
    if (_pageIndex == 0 &&
        !getUserPremission(
          context: context,
          featureType: FeatureType.tasks,
          premissionType: PremissionType.read,
        )) {
      premision = false;
    } else if (_pageIndex == 1 &&
        !getUserPremission(
          context: context,
          featureType: FeatureType.inventory,
          premissionType: PremissionType.read,
        )) {
      premision = false;
    } else if (_pageIndex == 3 &&
        !getUserPremission(
          context: context,
          featureType: FeatureType.assets,
          premissionType: PremissionType.read,
        )) {
      premision = false;
    } else if (_pageIndex == 4 &&
        !getUserPremission(
          context: context,
          featureType: FeatureType.knowledgeBase,
          premissionType: PremissionType.read,
        )) {
      premision = false;
    }
    if (premision) {
      setState(() {
        _isMenuVisible = !_isMenuVisible;
      });
    } else {
      showSnackBar(
        context: context,
        message: AppLocalizations.of(context)!.premission_no_premission,
        isErrorMessage: true,
      );
    }
  }

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _navigationController = CircularBottomNavigationController(_pageIndex);
    _scrollController.addListener(() {
      if (_isControlsVisible && _scrollController.offset > _currentOffset) {
        _hideControls();
      }
      if (MediaQuery.of(context).viewInsets.bottom == 0 &&
          !_isControlsVisible &&
          _scrollController.offset < _currentOffset) {
        _showControls();
      }
      _currentOffset = _scrollController.offset;
    });

    _pageController.addListener(() {
      // closes search bar when page changes
      if (_isInventorySearchBarExpanded || _isAssetsSearchBarExpanded) {
        _toggleIsSearchBarExpanded();
      }
    });

    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (MediaQuery.of(context).viewInsets.bottom == 0 && !_isControlsVisible) {
      _showControls();
    } else if (MediaQuery.of(context).viewInsets.bottom != 0 &&
        _isControlsVisible) {
      _hideControls();
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _navigationController.dispose();
    _scrollController.dispose();
    _animationController?.dispose();
    _pageController.dispose();
    _inventorySearchTextEditingController.dispose();
    _assetsSearchTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    DateTime preBackpress = DateTime.now();

    return WillPopScope(
      onWillPop: () async {
        // hide filter widget if expanded
        if (_isFilterExpanded) {
          _toggleIsFilterExpanded();
          return false;
        }
        if (_isMenuVisible) {
          _toggleIsMenuVisible();
          return false;
        }
        // double click to exit the app
        final timegap = DateTime.now().difference(preBackpress);
        final cantExit = timegap >= const Duration(seconds: 2);
        preBackpress = DateTime.now();
        if (cantExit) {
          ScaffoldMessenger.of(context)
            ..removeCurrentSnackBar()
            ..showSnackBar(SnackBar(
              content: Text(
                AppLocalizations.of(context)!.back_to_exit,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              duration: const Duration(seconds: 2),
              backgroundColor: Colors.black,
            ));
          return false;
        } else {
          return true;
        }
      },
      child: MultiBlocListener(
        listeners: [
          BlocListener<ItemsManagementBloc, ItemsManagementState>(
            listener: (context, state) =>
                itemManagementBlocListener(context, state),
          ),
        ],
        child: Scaffold(
          drawer: const MainDrawer(),
          body: SafeArea(
            child: NestedScrollView(
              controller: _scrollController,
              physics: const NeverScrollableScrollPhysics(),
              // AppBar
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverOverlapAbsorber(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: HomeSliverAppBar(
                    pageIndex: _pageIndex,
                    isFilterExpanded: _isFilterExpanded,
                    toggleIsFilterExpanded: _toggleIsFilterExpanded,
                    isMenuVisible: _isMenuVisible,
                    toggleIsMenuVisible: _toggleIsMenuVisible,
                    isSearchBarExpanded: _getFlagForPageIndex(_pageIndex),
                    toggleIsSearchBarExpanded: _toggleIsSearchBarExpanded,
                  ),
                )
              ],
              // body
              body: Stack(
                children: [
                  // tabs
                  PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _pageController,
                    children: [
                      const TasksPage(),
                      InventoryPage(
                        searchBoxHeight: _searchBoxHeight,
                        isSearchBoxExpanded: _isInventorySearchBarExpanded,
                        searchQuery: _inventoryQuery,
                        isSortedByCategory: false,
                      ),
                      const DashboardPage(),
                      const AssetsPage(),
                      const KnowledgeBasePage(),
                    ],
                  ),
                  // bottom navigation bar
                  HomeBottomNavigationBar(
                    animationController: _animationController!,
                    navigationController: _navigationController,
                    pageController: _pageController,
                    setPageIndex: _setPageIndex,
                    toggleShowMenu: _toggleIsMenuVisible,
                  ),
                  // location and group selection filter
                  HomePageFilter(
                    isFilterExpanded: _isFilterExpanded,
                    onDismiss: _toggleIsFilterExpanded,
                  ),
                  OverlayMenu(
                    isVisible: _isMenuVisible,
                    onDismiss: _toggleIsMenuVisible,
                    pageIndex: _pageIndex,
                  ),
                  // inventory search box
                  AppBarSearchBox(
                    title: AppLocalizations.of(context)!.search_item,
                    searchBoxHeight: _searchBoxHeight,
                    isSearchBoxExpanded: _isInventorySearchBarExpanded,
                    onChanged: _searchInInventory,
                    searchTextEditingController:
                        _inventorySearchTextEditingController,
                  ),
                  // assets search box
                  AppBarSearchBox(
                    title: AppLocalizations.of(context)!.search,
                    searchBoxHeight: _searchBoxHeight,
                    isSearchBoxExpanded: _isAssetsSearchBarExpanded,
                    onChanged: _searchInAssets,
                    searchTextEditingController:
                        _assetsSearchTextEditingController,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
