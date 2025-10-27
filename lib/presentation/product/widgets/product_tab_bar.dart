import 'package:flutter/material.dart';
import 'package:flutter_bloc_codebase/core/extensions/context_extensions.dart';

class ProductTabBar extends StatefulWidget {
  final List<String> tabs;
  final int selectedIndex;
  final ValueChanged<int>? onTabSelected;

  const ProductTabBar({super.key, required this.tabs, this.selectedIndex = 0, this.onTabSelected});

  @override
  State<ProductTabBar> createState() => _ProductTabBarState();
}

class _ProductTabBarState extends State<ProductTabBar> {
  late final ValueNotifier _tabNotifier;

  @override
  void initState() {
    super.initState();
    _tabNotifier = ValueNotifier(0);
  }

  @override
  void dispose() {
    super.dispose();
    _tabNotifier.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _tabNotifier,
      builder: (context, currentIndex, _) {
        return Container(
          decoration: BoxDecoration(color: context.colorScheme.background, borderRadius: BorderRadius.circular(6)),
          child: Row(
            children: widget.tabs.asMap().entries.map((entry) {
              final isActive = currentIndex == entry.key;

              return Expanded(
                child: InkWell(
                  onTap: () {
                    _tabNotifier.value = entry.key;
                    widget.onTabSelected?.call(entry.key);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 6),
                    decoration: BoxDecoration(
                      color: isActive ? context.primaryColor : null,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      entry.value,
                      textAlign: TextAlign.center,
                      style: context.labelSmall?.copyWith(
                        color: isActive ? Colors.black : Colors.white,
                        height: 1.33,
                        letterSpacing: 0.05,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
