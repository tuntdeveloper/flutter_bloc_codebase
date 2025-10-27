import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_codebase/core/di/injection.dart';
import 'package:flutter_bloc_codebase/core/extensions/context_extensions.dart';
import 'package:flutter_bloc_codebase/presentation/product/bloc/product_bloc.dart';
import 'package:flutter_bloc_codebase/presentation/product/products_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController;
  late final ValueNotifier _tabNotifier;

  final List<Map<String, String>> _tabs = [
    {'name': 'Scan', 'icon': 'assets/icons/ic_scan.png'},
    {'name': 'Collection', 'icon': 'assets/icons/ic_collection.png'},
    {'name': 'Shop', 'icon': 'assets/icons/ic_shop.png'},
    {'name': 'Settings', 'icon': 'assets/icons/ic_settings.png'},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 1)
      ..addListener(() {
        if (_tabController.indexIsChanging) return;

        _tabNotifier.value = _tabController.index;
      });
    _tabNotifier = ValueNotifier(1);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    _tabNotifier.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Scaffold(
        body: TabBarView(
          controller: _tabController,
          children: [
            const Center(child: Text('Scan')),
            BlocProvider(
              create: (_) => injector<ProductBloc>(),
              child: const ProductsPage(),
            ),
            const Center(child: Text('Shop')),
            const Center(child: Text('Settings')),
          ],
        ),
        bottomNavigationBar: ValueListenableBuilder(
          valueListenable: _tabNotifier,
          builder: (context, currentIndex, _) {
            return TabBar(
              controller: _tabController,
              tabs: _tabs.asMap().entries.map((e) {
                final isActive = currentIndex == e.key;

                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 4,
                    children: [
                      Image.asset(
                        e.value['icon'] ?? '',
                        color: isActive ? Colors.white : Colors.grey,
                      ),
                      Text(
                        e.value['name'] ?? '',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: isActive ? Colors.white : Colors.grey,
                          fontSize: 12,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w400,
                          height: 1.33,
                          letterSpacing: 0.05,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
