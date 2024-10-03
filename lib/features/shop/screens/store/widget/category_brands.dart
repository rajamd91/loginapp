import 'package:flutter/material.dart';
import 'package:loginapp/common/widgets/brands/brand_show_case.dart';
import 'package:loginapp/features/shop/controllers/brand_controller.dart';
import 'package:loginapp/features/shop/models/category_model.dart';
import 'package:loginapp/utils/constants/sizes.dart';
import 'package:loginapp/utils/helpers/cloud_helper_functions.dart';
import '../../../../../common/widgets/shimmers/boxes_shimmer.dart';
import '../../../../../common/widgets/shimmers/list_tile_shimmer.dart';

class CateGoryBrands extends StatelessWidget {
  const CateGoryBrands({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
      future: controller.getBrandsForCategory(category.id),
      builder: (context, snapshot) {
        /// Handle Error,No Record,OR error Message
        const loader = Column(
          children: [
            TListTileShimmer(),
            SizedBox(height: TSizes.spaceBtwItems),
            TBoxesShimmer(),
            SizedBox(height: TSizes.spaceBtwItems)
          ],
        );
        final widget = TCloudHelperFunctions.checkMultipleRecordState(
            snapshot: snapshot, loader: loader);
        if (widget != null) return widget;

        /// Record found!
        final brands = snapshot.data!;

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: brands.length,
          itemBuilder: (_, index) {
            final brand = brands[index];
            return FutureBuilder(
                future:
                    controller.getBrandProducts(brandId: brand.id, limit: 3),
                builder: (context, snapshot) {
                  /// Handle Error,No Record,OR error Message
                  final widget = TCloudHelperFunctions.checkMultipleRecordState(
                      snapshot: snapshot, loader: loader);
                  if (widget != null) return widget;

                  /// Record found!
                  final products = snapshot.data!;
                  return TBrandShowcase(
                      brand: brand,
                      images: products.map((e) => e.thumbnail).toList());
                });
          },
        );
      },
    );
  }
}
