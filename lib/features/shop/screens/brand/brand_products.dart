import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loginapp/common/widgets/appbar/appbar.dart';
import 'package:loginapp/common/widgets/brands/brand_card.dart';
import 'package:loginapp/common/widgets/products/sortable/sortable_products.dart';
import 'package:loginapp/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:loginapp/features/shop/controllers/brand_controller.dart';
import 'package:loginapp/features/shop/models/brand_model.dart';
import 'package:loginapp/utils/constants/sizes.dart';
import 'package:loginapp/utils/helpers/cloud_helper_functions.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: TAppBar(title: Text(brand.name)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Brand Detail
              TBrandCard(showBorder: true, brand: brand),
              const SizedBox(height: TSizes.spaceBtwItems),

              FutureBuilder(
                future: controller.getBrandProducts(brandId: brand.id),
                builder: (context, snapshot) {
                  /// Handle loader,No Record,OR Error Message
                  const loader = TVerticalProductShimmer();
                  final widget = TCloudHelperFunctions.checkMultipleRecordState(
                      snapshot: snapshot, loader: loader);
                  if (widget != null) return widget;

                  /// Record found!
                  final brandProducts = snapshot.data!;

                  return TSortableProducts(products: brandProducts);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
