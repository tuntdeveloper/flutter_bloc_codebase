import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_codebase/presentation/product/widgets/product_history_widget.dart';
import 'package:flutter_bloc_codebase/presentation/product/widgets/product_tasting_notes_widget.dart';
import '../../core/extensions/context_extensions.dart';
import '../../domain/entities/product_entity.dart';
import 'bloc/product_bloc.dart';
import 'bloc/product_event.dart';
import 'bloc/product_state.dart';
import 'widgets/product_image_header.dart';
import 'widgets/product_tab_bar.dart';
import 'widgets/product_title_section.dart';
import 'widgets/product_details_widget.dart';

class ProductDetailPage extends StatefulWidget {
  final int productId;

  const ProductDetailPage({super.key, required this.productId});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  late final ProductBloc _productBloc;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _productBloc = context.read<ProductBloc>()
      ..add(LoadProductByIdEvent(widget.productId));
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _productBloc.close();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: Image.asset(
                'assets/images/im_background.png',
                fit: BoxFit.cover,
              ),
            ),
          ),

          BlocConsumer<ProductBloc, ProductState>(
            listener: (context, state) {
              if (state is ProductError) {
                context.showErrorSnackBar(state.message);
              }
            },
            builder: (context, state) {
              if (state is ProductLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is ProductLoaded) {
                return _buildProductDetail(context, state.product);
              }

              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: 64,
                      color: context.colorScheme.error,
                    ),
                    const SizedBox(height: 16),
                    Text('Product not found', style: context.titleLarge),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Go Back'),
                    ),
                  ],
                ),
              );
            },
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Genesis Collection',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: const Color(0xFFE7E9EA),
                      fontSize: 12,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w400,
                      height: 1.33,
                      letterSpacing: 0.05,
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.close, size: 24),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductDetail(BuildContext context, ProductEntity product) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        16,
        MediaQuery.of(context).padding.top,
        16,
        16
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            const ProductImageHeader(imagePath: 'assets/images/im_bottle.png'),
            const SizedBox(height: 40),
            Container(
              color: context.colorScheme.surface,
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 24,
                children: [
                  const ProductTitleSection(
                    bottleNumber: 'Bottle 135/184',
                    brandName: 'Talisker',
                    ageStatement: '18 Year old',
                    bottleNumberSuffix: '#2504',
                  ),
                  ProductTabBar(
                    tabs: tabs,
                    onTabSelected: (currentIndex) {
                      _pageController.animateToPage(
                        currentIndex,
                        duration: Duration(milliseconds: 200),
                        curve: Curves.ease,
                      );
                    },
                  ),
                  ExpandablePageView(
                    controller: _pageController,
                    children: [
                      ProductDetailsWidget(details: _getProductDetails()),
                      ProductTastingNotesWidget(
                        tastingNotes: _getTastingNotes(),
                      ),
                      ProductHistoryWidget(),
                    ],
                  ),

                ],
              ),
            ),
            const SizedBox(height: 24),
            _buildAddToCollectionButton(),
          ],
        ),
      ),
    );
  }

  List<String> tabs = ['Details', 'Tasting notes', 'History'];

  List<ProductDetailItemData> _getProductDetails() {
    return const [
      ProductDetailItemData(label: 'Distillery', value: 'Text'),
      ProductDetailItemData(label: 'Region', value: 'Text'),
      ProductDetailItemData(label: 'Country', value: 'Text'),
      ProductDetailItemData(label: 'Type', value: 'Text'),
      ProductDetailItemData(label: 'Age statement', value: 'Text'),
      ProductDetailItemData(label: 'Filled', value: 'Text'),
      ProductDetailItemData(label: 'Bottled', value: 'Text'),
      ProductDetailItemData(label: 'Cask number', value: 'Text'),
      ProductDetailItemData(label: 'ABV', value: 'Text'),
      ProductDetailItemData(label: 'Size', value: 'Text'),
      ProductDetailItemData(label: 'Finish', value: 'Text'),
    ];
  }

  List<TastingNoteData> _getTastingNotes() {
    return const [
      TastingNoteData(
        category: 'Nose',
        description:
            'Rich and smoky with notes of sea salt, pepper, and citrus. The maritime influence is evident with hints of seaweed and brine.',
      ),
      TastingNoteData(
        category: 'Palate',
        description:
            'Full-bodied with a warming spice character. Notes of honey, vanilla, and oak complement the signature pepper and smoke.',
      ),
      TastingNoteData(
        category: 'Finish',
        description:
            'Long and warming with lingering smoke and pepper. The finish evolves with subtle sweetness and maritime saltiness.',
      ),
    ];
  }

  Widget _buildAddToCollectionButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: ShapeDecoration(
        color: context.colorScheme.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        shadows: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Text(
        '+  Add to my collection',
        style: TextStyle(
          color: const Color(0xFF0B1519),
          fontSize: 16,
          fontFamily: 'EB Garamond',
          fontWeight: FontWeight.w600,
          height: 1.50,
          letterSpacing: 0.02,
        ),
      ),
    );
  }
}
