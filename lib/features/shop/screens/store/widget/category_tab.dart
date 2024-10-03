import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:loginapp/common/widgets/layouts/grid_layout.dart';
import 'package:loginapp/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:loginapp/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:loginapp/common/widgets/texts/section_heading.dart';
import 'package:loginapp/features/shop/controllers/category_controller.dart';
import 'package:loginapp/features/shop/models/category_model.dart';
import 'package:loginapp/features/shop/screens/all_products/all_products.dart';
import 'package:loginapp/features/shop/screens/store/widget/category_brands.dart';
import 'package:loginapp/utils/helpers/cloud_helper_functions.dart';
import '../../../../../../utils/constants/sizes.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Brands
              CateGoryBrands(category: category),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// Products
              FutureBuilder(
                future: controller.getCategoryProducts(categoryId: category.id),
                builder: (context, snapshot) {
                  /// Helper function:Handle Loader,No Record,OR ERROR Message
                  final response =
                      TCloudHelperFunctions.checkMultipleRecordState(
                          snapshot: snapshot,
                          loader: const TVerticalProductShimmer());
                  if (response != null) return response;

                  ///Record found!
                  final products = snapshot.data!;

                  return Column(
                    children: [
                      TSectionHeading(
                          title: "You might Like",
                          onPressed: () => Get.to(AllProducts(
                                title: category.name,
                                futureMethod: controller.getCategoryProducts(
                                    categoryId: category.id, limit: -1),
                              ))),
                      const SizedBox(height: TSizes.spaceBtwItems),
                      TGridLayout(
                          itemCount: products.length,
                          itemBuilder: (_, index) =>
                              TProductCardVertical(product: products[index])),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
