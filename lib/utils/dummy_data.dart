import 'package:flutter/material.dart';
import 'package:loginapp/features/shop/models/brand_model.dart';
import 'package:loginapp/features/shop/models/category_model.dart';
import 'package:loginapp/features/shop/models/product_attribute_model.dart';
import 'package:loginapp/features/shop/models/product_variation_model.dart';

import '../features/authentication/models/user_model.dart';
import '../features/shop/models/banner_model.dart';
import '../features/shop/models/product_model.dart';
import '../routes/routes.dart';
import 'constants/image_strings.dart';

class TDummyData {
  /// Banners
  static final List<BannerModel> banners = [
    BannerModel(
        imageUrl: TImages.banner1, targetScreen: TRoutes.order, active: false),
    BannerModel(
        imageUrl: TImages.banner2, targetScreen: TRoutes.cart, active: true),
    BannerModel(
        imageUrl: TImages.banner3,
        targetScreen: TRoutes.favourites,
        active: true),
    BannerModel(
        imageUrl: TImages.banner4, targetScreen: TRoutes.search, active: true),
    BannerModel(
        imageUrl: TImages.banner5,
        targetScreen: TRoutes.settings,
        active: true),
    BannerModel(
        imageUrl: TImages.banner6,
        targetScreen: TRoutes.userAddress,
        active: true),
    BannerModel(
        imageUrl: TImages.banner8,
        targetScreen: TRoutes.checkout,
        active: false),
  ];

  /// User
  // static final UserModel user = UserModel(
  //     firstName: 'Coding',
  //     lastName: 'with T',
  //     email: 'support@codingwithT.com',
  //     phoneNumber: '+14155552671',
  //     profilePicture: TImages.user,
  //     addresses: [
  //       AddressModel(
  //           id: '1',
  //           name: 'Coding with T',
  //           phoneNumber: '+923178059528',
  //           street: '82356 Timmy Coves',
  //           city: 'South Liana',
  //           state: 'Maine',
  //           postalCode: '87665',
  //           country: 'USA'),
  //       AddressModel(
  //           id: '6',
  //           name: 'Raja Mohamed',
  //           phoneNumber: '+918668099468',
  //           street: '205 Mount Road',
  //           city: 'Tenkasi',
  //           state: 'TamilNadu',
  //           postalCode: '627811',
  //           country: 'INDIA'),
  //     ]);

  /// --Cart
  // static final CartModel cart = CartModel(cartId: '001', items: [
  //   CartItemModel(
  //     productId: '001',
  //     variationId: '1',
  //     quantity: 1,
  //     title: products[0].title,
  //     image: products[0].thumbnail,
  //     brandName: products[0].brand!.name,
  //     price: products[0].productVariations![0].attributeValues,
  //   ),
  //   CartItemModel(
  //     productId: '001',
  //     variationId: '',
  //     quantity: 1,
  //     title: products[0].title,
  //     image: products[0].thumbnail,
  //     brandName: products[0].brand!.name,
  //     price: products[0].productVariations![0].attributeValues,
  //   ),
  // ]);
  //
  // /// Order
  // static final List<OrderModel> orders = [
  //   OrderModel(
  //     id: 'CNT0012',
  //     status: OrderStatus.processing,
  //     items: cart.items,
  //     totalAmount: 265,
  //     orderDate: DateTime(2023, 09, 1),
  //     deliveryDate: DateTime(2023, 09, 9),
  //   ),
  //   OrderModel(
  //     id: 'CNT0025',
  //     status: OrderStatus.shipped,
  //     items: cart.items,
  //     totalAmount: 369,
  //     orderDate: DateTime(2023, 10, 2),
  //     deliveryDate: DateTime(2023, 10, 8),
  //   ),
  //];

  /// List of all categories
  static final List<CategoryModel> categories = [
    CategoryModel(
        id: '1', name: 'Sports', image: TImages.sportIcon, isFeatured: true),
    CategoryModel(
        id: '5',
        name: 'Furniture',
        image: TImages.furnitureIcon,
        isFeatured: true),
    CategoryModel(
        id: '2',
        name: 'Electronics',
        image: TImages.electronicsIcon,
        isFeatured: true),
    CategoryModel(
        id: '3', name: 'Clothes', image: TImages.clothesIcon, isFeatured: true),
    CategoryModel(
        id: '4', name: 'Animals', image: TImages.animalIcon, isFeatured: true),
    CategoryModel(
        id: '6',
        name: 'Home Appliances',
        image: TImages.homeAppliancesIcon,
        isFeatured: true),
    CategoryModel(
        id: '7',
        name: 'Cosmetics',
        image: TImages.cosmeticsIcon,
        isFeatured: true),
    CategoryModel(
        id: '14',
        name: 'Jewellery',
        image: TImages.jewelleryIcon,
        isFeatured: true),

    /// SubCategories-Sports
    CategoryModel(
        id: '8',
        name: 'Sports Shoes',
        image: TImages.sportIcon,
        parentId: '1',
        isFeatured: false),
    CategoryModel(
        id: '9',
        name: 'Sports Suits',
        image: TImages.sportIcon,
        parentId: '1',
        isFeatured: false),
    CategoryModel(
        id: '10',
        name: 'Sports Equipments',
        image: TImages.sportIcon,
        parentId: '1',
        isFeatured: false),

    /// SubCategories-Furniture
    CategoryModel(
        id: '11',
        name: 'Bedroom Furniture',
        image: TImages.furnitureIcon,
        parentId: '5',
        isFeatured: false),
    CategoryModel(
        id: '12',
        name: 'Kitchen Furniture',
        image: TImages.furnitureIcon,
        parentId: '5',
        isFeatured: false),
    CategoryModel(
        id: '13',
        name: 'Office Furniture',
        image: TImages.furnitureIcon,
        parentId: '5',
        isFeatured: false),

    /// SubCategories-Electronics
    CategoryModel(
        id: '14',
        name: 'Laptop',
        image: TImages.electronicsIcon,
        parentId: '2',
        isFeatured: false),
    CategoryModel(
        id: '15',
        name: 'Mobile',
        image: TImages.electronicsIcon,
        parentId: '2',
        isFeatured: false),

    /// SubCategories-Clothes
    CategoryModel(
        id: '16',
        name: 'Shirts',
        image: TImages.clothesIcon,
        parentId: '3',
        isFeatured: false),
    CategoryModel(
        id: '17',
        name: 'Trousers',
        image: TImages.clothesIcon,
        parentId: '3',
        isFeatured: false),
    CategoryModel(
        id: '18',
        name: 'Churidars',
        image: TImages.clothesIcon,
        parentId: '3',
        isFeatured: false),
    CategoryModel(
        id: '19',
        name: 'Sarees',
        image: TImages.clothesIcon,
        parentId: '3',
        isFeatured: false),

    /// SubCategories-Animals
    CategoryModel(
        id: '20',
        name: 'Dogs',
        image: TImages.animalIcon,
        parentId: '4',
        isFeatured: false),
    CategoryModel(
        id: '21',
        name: 'Cats',
        image: TImages.animalIcon,
        parentId: '4',
        isFeatured: false),
    CategoryModel(
        id: '22',
        name: 'Parrots',
        image: TImages.animalIcon,
        parentId: '4',
        isFeatured: false),

    /// SubCategories-Home Appliances
    CategoryModel(
        id: '23',
        name: 'Fridge',
        image: TImages.homeAppliancesIcon,
        parentId: '6',
        isFeatured: false),
    CategoryModel(
        id: '24',
        name: 'Washing Machine',
        image: TImages.homeAppliancesIcon,
        parentId: '6',
        isFeatured: false),
    CategoryModel(
        id: '25',
        name: 'Mixi',
        image: TImages.homeAppliancesIcon,
        parentId: '6',
        isFeatured: false),

    /// SubCategories-Cosmetics
    CategoryModel(
        id: '26',
        name: 'Lipsticks',
        image: TImages.cosmeticsIcon,
        parentId: '7',
        isFeatured: false),
    CategoryModel(
        id: '27',
        name: 'Face Wash',
        image: TImages.cosmeticsIcon,
        parentId: '7',
        isFeatured: false),

    /// SubCategories-Jewellery
    CategoryModel(
        id: '28',
        name: 'Chains',
        image: TImages.jewelleryIcon,
        parentId: '14',
        isFeatured: false),
    CategoryModel(
        id: '29',
        name: 'Bangles',
        image: TImages.jewelleryIcon,
        parentId: '14',
        isFeatured: false),
    CategoryModel(
        id: '30',
        name: 'Earrings',
        image: TImages.jewelleryIcon,
        parentId: '14',
        isFeatured: false),
  ];

  ///--- List of all products
  static final List<ProductModel> products = [
    ProductModel(
      id: '001',
      title: 'Green Nike Sports Shoe',
      stock: 15,
      price: 135,
      thumbnail: TImages.productImage1,
      //productType: 'Shoe',
      description: 'Green Nike Sports Shoe',
      brand: BrandModel(
          id: '1',
          image: TImages.nikeLogo,
          name: 'Nike',
          productsCount: 265,
          isFeatured: true),
      images: [
        TImages.productImage1,
        TImages.productImage2,
        TImages.productImage3,
        TImages.productImage4
      ],
      salesPrice: 30,
      sku: 'ABR4568',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Black', 'Red']),
        ProductAttributeModel(name: 'Size', values: ['EU30', 'EU32', 'EU34']),
      ],
      productVariations: [
        ProductVariationModel(
            id: '1',
            stock: 34,
            price: 134,
            salesPrice: 122.6,
            image: TImages.productImage1,
            description: 'This is a product description for Nike shoe',
            attributeValues: {'Color': 'Green', 'Size': 'EU34'}),
        ProductVariationModel(
            id: '2',
            stock: 15,
            price: 132,
            image: TImages.productImage2,
            attributeValues: {'Color': 'Black', 'Size': 'EU32'}),
        ProductVariationModel(
            id: '3',
            stock: 0,
            price: 234,
            image: TImages.productImage3,
            attributeValues: {'Color': 'Black', 'Size': 'EU34'}),
        ProductVariationModel(
            id: '4',
            stock: 222,
            price: 232,
            image: TImages.productImage1,
            attributeValues: {'Color': 'Green', 'Size': 'EU32'}),
        ProductVariationModel(
            id: '5',
            stock: 0,
            price: 334,
            image: TImages.productImage4,
            attributeValues: {'Color': 'Red', 'Size': 'EU34'}),
        ProductVariationModel(
            id: '6',
            stock: 11,
            price: 332,
            image: TImages.productImage2,
            attributeValues: {'Color': 'Red', 'Size': 'EU32'}),
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: '002',
      title: 'Blue T-Shirt for all ages',
      stock: 15,
      price: 35,
      isFeatured: true,
      thumbnail: TImages.productImage1,
      description: 'This is description for Blue T-Shirt',
      brand: BrandModel(id: '6', image: TImages.zaraLogo, name: 'ZARA'),
      images: [
        TImages.productImage1,
        TImages.productImage2,
        TImages.productImage3
      ],
      salesPrice: 30,
      sku: 'ABR4568',
      categoryId: '16',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU32', 'EU34']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '003',
      title: 'Leather Brown Jacket',
      stock: 15,
      price: 38000,
      isFeatured: false,
      thumbnail: TImages.productImage1,
      description: 'This is description for Brown Jacket',
      brand: BrandModel(id: '6', image: TImages.zaraLogo, name: 'ZARA'),
      images: [
        TImages.productImage1,
        TImages.productImage2,
        TImages.productImage3
      ],
      salesPrice: 30,
      sku: 'ABR4568',
      categoryId: '16',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU32', 'EU34']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '004',
      title: '4 Color collar T-Shirt dry fit',
      stock: 15,
      price: 135,
      isFeatured: false,
      thumbnail: TImages.productImage1,
      description: 'This is description for 4 color Collar T-Shirt',
      brand: BrandModel(id: '6', image: TImages.zaraLogo, name: 'ZARA'),
      images: [
        TImages.productImage1,
        TImages.productImage2,
        TImages.productImage3
      ],
      salesPrice: 30,
      sku: 'ABR4568',
      categoryId: '16',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU30', 'EU32', 'EU34']),
        ProductAttributeModel(
            name: 'Color', values: ['Red,' 'Green', 'Yellow', 'Blue']),
      ],
      productVariations: [
        ProductVariationModel(
            id: '1',
            stock: 34,
            price: 134,
            salesPrice: 122.6,
            image: TImages.productImage3,
            description:
                'This is Product description for 4 Color collar T-Shirt dry fit',
            attributeValues: {'Color': 'Red', 'Size': 'EU34'}),
        ProductVariationModel(
            id: '2',
            stock: 15,
            price: 332,
            image: TImages.productImage2,
            attributeValues: {'Color': 'Red', 'Size': 'EU32'}),
        ProductVariationModel(
            id: '3',
            stock: 0,
            price: 234,
            image: TImages.productImage1,
            attributeValues: {'Color': 'Yellow', 'Size': 'EU34'}),
        ProductVariationModel(
            id: '4',
            stock: 222,
            price: 252,
            image: TImages.productImage2,
            attributeValues: {'Color': 'Yellow', 'Size': 'EU32'}),
        ProductVariationModel(
            id: '5',
            stock: 0,
            price: 334,
            image: TImages.productImage3,
            attributeValues: {'Color': 'Green', 'Size': 'EU34'}),
        ProductVariationModel(
            id: '6',
            stock: 11,
            price: 332,
            image: TImages.productImage1,
            attributeValues: {'Color': 'green', 'Size': 'EU30'}),
        ProductVariationModel(
            id: '7',
            stock: 0,
            price: 334,
            image: TImages.productImage2,
            attributeValues: {'Color': 'Blue', 'Size': 'EU30'}),
        ProductVariationModel(
            id: '8',
            stock: 11,
            price: 332,
            image: TImages.productImage3,
            attributeValues: {'Color': 'Blue', 'Size': 'EU34'}),
      ],
      productType: 'ProductType.variable',
    ),

    /// Products after banner
    ProductModel(
      id: '005',
      title: 'Nike Air Jordon Shoes',
      stock: 15,
      price: 35,
      isFeatured: false,
      thumbnail: TImages.productImage3,
      description: 'Nike Air Jordon Shoes best for running.Good product',
      brand: BrandModel(
          id: '1',
          image: TImages.productImage3,
          name: 'Nike',
          productsCount: 265,
          isFeatured: true),
      images: [
        TImages.productImage1,
        TImages.productImage2,
        TImages.productImage3
      ],
      salesPrice: 30,
      sku: 'ABR4568',
      categoryId: '8',
      productAttributes: [
        ProductAttributeModel(
            name: 'Color', values: ['Green', 'Black', 'Orange']),
        ProductAttributeModel(name: 'Size', values: ['EU30', 'EU32', 'EU34']),
      ],
      productVariations: [
        ProductVariationModel(
            id: '1',
            stock: 16,
            price: 36,
            salesPrice: 12.6,
            image: TImages.productImage2,
            description: 'This is a product description for Nike Bag',
            attributeValues: {'Color': 'Orange', 'Size': 'EU34'}),
        ProductVariationModel(
            id: '2',
            stock: 15,
            price: 35,
            image: TImages.productImage2,
            attributeValues: {'Color': 'Black', 'Size': 'EU32'}),
        ProductVariationModel(
            id: '3',
            stock: 14,
            price: 34,
            image: TImages.productImage3,
            attributeValues: {'Color': 'Green', 'Size': 'EU34'}),
        ProductVariationModel(
            id: '4',
            stock: 13,
            price: 33,
            image: TImages.productImage1,
            attributeValues: {'Color': 'Black', 'Size': 'EU34'}),
        ProductVariationModel(
            id: '5',
            stock: 12,
            price: 32,
            image: TImages.productImage4,
            attributeValues: {'Color': 'Brown', 'Size': 'EU32'}),
        ProductVariationModel(
          id: '6',
          stock: 11,
          price: 31,
          image: TImages.productImage2,
          attributeValues: {'Color': 'Orange', 'Size': 'EU32'},
        ),
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: '006',
      title: 'Samsung Galaxy S9(Pink,64GB) (4GB RAM)',
      stock: 15,
      price: 750,
      isFeatured: false,
      thumbnail: TImages.nikeLogo,
      description: 'SAMSUNG GALAXY S9 IS BEST ONE IN THE MARKET.GOOD PRODUCT',
      brand: BrandModel(id: '7', image: TImages.applePay, name: 'Samsung'),
      images: [
        TImages.productImage1,
        TImages.productImage2,
        TImages.productImage3
      ],
      salesPrice: 650,
      sku: 'ABR4568',
      categoryId: '2',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
        ProductAttributeModel(name: 'Size', values: ['EU32', 'EU34']),
      ],
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '007',
      title: 'TOMI Dog Food',
      stock: 15,
      price: 20,
      isFeatured: false,
      thumbnail: TImages.productImage3,
      description: 'TOMI Food best for Dogs.Good product',
      brand: BrandModel(id: '7', image: TImages.productImage3, name: 'Tomi'),
      images: [
        TImages.productImage1,
        TImages.productImage2,
        TImages.productImage3
      ],
      salesPrice: 10,
      sku: 'ABR4568',
      categoryId: '4',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
        ProductAttributeModel(name: 'Size', values: ['EU32', 'EU34']),
      ],
      productType: 'ProductType.single',
    ),

    ProductModel(
      id: '009',
      title: 'Nike Air Jordan 19 Blue',
      stock: 15,
      price: 400,
      isFeatured: false,
      thumbnail: TImages.productImage2,
      description: 'Nike Air Jordan 19 Blue.Good product',
      brand: BrandModel(id: '1', image: TImages.productImage2, name: 'Nike'),
      images: [
        TImages.productImage1,
        TImages.productImage2,
        TImages.productImage3
      ],
      salesPrice: 200,
      sku: 'ABR4568',
      categoryId: '8',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
        ProductAttributeModel(name: 'Size', values: ['EU32', 'EU34']),
      ],
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '010',
      title: 'Nike Air Jordan 19 Orange',
      stock: 12,
      price: 300,
      isFeatured: false,
      thumbnail: TImages.productImage1,
      description: 'Nike Air Jordan 19 Orange.Good product',
      brand: BrandModel(id: '1', image: TImages.productImage2, name: 'Nike'),
      images: [
        TImages.productImage1,
        TImages.productImage2,
        TImages.productImage3
      ],
      salesPrice: 100,
      sku: 'ABR4568',
      categoryId: '8',
      productAttributes: [
        ProductAttributeModel(
            name: 'Color', values: ['Green', 'Orange', 'Blue']),
        ProductAttributeModel(name: 'Size', values: ['EU32', 'EU34']),
      ],
      productType: 'ProductType.single',
    ),
  ];
}
