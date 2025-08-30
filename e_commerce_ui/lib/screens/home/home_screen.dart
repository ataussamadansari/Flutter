import 'package:e_commerce_ui/screens/home/widgets/item_banner.dart';
import 'package:e_commerce_ui/screens/home/widgets/item_category.dart';
import 'package:e_commerce_ui/screens/home/widgets/item_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget
{
    const HomeScreen({super.key});

    @override
    State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
{
    TextEditingController search = TextEditingController();
    // banner
    List bannerImages = ['hp.png', 'dell.png', 'zara.png'];
    int currentIndex = 0;

    @override
    Widget build(BuildContext context)
    {
        return Scaffold(
            appBar: AppBar(
                title: Text("eShopCart"),
                leading: Image.asset('assets/images/eshop_logo.png'),
                actions: [
                    Padding(
                        padding: const EdgeInsets.all(12),
                        child: Badge(
                            label: Text('5'),
                            child: Icon(CupertinoIcons.bell)
                        )
                    )
                ]
            ),
            body: ListView(
                children: [
                    // Search Box
                    Card(
                        margin: EdgeInsets.all(12),
                        child: TextField(
                            controller: search,
                            textInputAction: TextInputAction.search,
                            onChanged: (value)
                            {
                                setState(() {});
                            },
                            cursorColor: Colors.green,
                            cursorOpacityAnimates: true,
                            textCapitalization: TextCapitalization.sentences,
                            decoration: InputDecoration(
                                hintText: 'Search',
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(12),
                                prefixIcon: Icon(CupertinoIcons.search),
                                suffixIcon: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                        if (search.text.isNotEmpty) 
                                        GestureDetector(
                                            onTap: () {
                                                search.clear();
                                                setState(() {});
                                                FocusScope.of(context).unfocus();
                                            },
                                            child: Icon(Icons.close)
                                        ),
                                        IconButton(
                                            onPressed: ()
                                            {
                                            },
                                            icon: Icon(Icons.filter_list)
                                        )
                                    ]
                                )
                            )
                        )
                    ),

                    // Banner
                    SizedBox(
                        height: 180,
                        child: PageView(
                            onPageChanged: (value)
                            {
                                setState(()
                                    {
                                        currentIndex = value;
                                    }
                                );
                            },
                            children: [
                                for (String banner in bannerImages)
                                    ItemBanner(image: banner)
                            ]
                        )
                    ),
                    SizedBox(
                        child: Row(
                            spacing: 6,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                for (int index = 0; index < bannerImages.length; index++)
                                    AnimatedContainer(
                                        duration: Duration(milliseconds: 300),
                                        height: currentIndex == index ? 10 : 8, width: currentIndex == index ? 10 : 8,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: currentIndex == index ? Colors.grey.shade700 : Colors.grey.shade400
                                        )
                                    )
                            ]
                        )
                    ),

                    //Categories
                    ListTile(
                        title: Text("Categories",
                            style: TextStyle(
                                fontWeight: FontWeight.w700
                            )
                        ),
                        trailing: Text("See All",
                            style: TextStyle(
                                color: Colors.indigo,
                                fontSize: 14
                            )
                        )
                    ),
                    SizedBox(
                        height: 100,
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            children: [
                                ItemCategory(image: 'skin-care.png', title: 'Skin Care', color: Colors.orange),
                                ItemCategory(image: 'baby.png', title: 'Baby', color: Colors.indigo),
                                ItemCategory(image: 'electronics.png', title: 'Electronics', color: Colors.green),
                                ItemCategory(image: 'kitchen.png', title: 'Kitchen', color: Colors.blue),
                                ItemCategory(image: 'healthcare.png', title: 'Medicine', color: Colors.red),
                                ItemCategory(image: 'skin-care.png', title: 'Skin Care', color: Colors.orange),
                                ItemCategory(image: 'baby.png', title: 'Baby', color: Colors.indigo),
                                ItemCategory(image: 'electronics.png', title: 'Electronics', color: Colors.green),
                                ItemCategory(image: 'kitchen.png', title: 'Kitchen', color: Colors.blue),
                                ItemCategory(image: 'healthcare.png', title: 'Medicine', color: Colors.red),
                            ]
                        )
                    ),

                    // Products
                    ListTile(
                        title: Text("Products",
                            style: TextStyle(
                                fontWeight: FontWeight.w700
                            )
                        ),
                        trailing: Text("See All",
                            style: TextStyle(
                                color: Colors.indigo,
                                fontSize: 14
                            )
                        )
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: GridView.count(
                            crossAxisCount: 2,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            children: [
                                ItemProduct(title: "Product 1", description: "Description 1", image: "product_1.jpg", rating: "4.5", price: "100"),
                                ItemProduct(title: "Product 2", description: "Description 2", image: "product_2.jpg", rating: "4.0", price: "120"),
                                ItemProduct(title: "Product 3", description: "Description 3", image: "product_3.jpg", rating: "4.5", price: "99"),
                                ItemProduct(title: "Product 4", description: "Description 4", image: "product_4.jpg", rating: "3.0", price: "120"),
                                ItemProduct(title: "Product 5", description: "Description 5", image: "product_5.jpg", rating: "3.5", price: "199"),
                                ItemProduct(title: "Product 6", description: "Description 6", image: "product_6.jpg", rating: "3.1", price: "149"),
                                ItemProduct(title: "Product 2", description: "Description 2", image: "product_2.jpg", rating: "4.0", price: "120"),
                                ItemProduct(title: "Product 3", description: "Description 3", image: "product_3.jpg", rating: "4.5", price: "99"),
                                ItemProduct(title: "Product 1", description: "Description 1", image: "product_1.jpg", rating: "4.5", price: "100"),
                                ItemProduct(title: "Product 6", description: "Description 6", image: "product_6.jpg", rating: "3.1", price: "149"),
                                ItemProduct(title: "Product 4", description: "Description 4", image: "product_4.jpg", rating: "3.0", price: "120"),
                                ItemProduct(title: "Product 5", description: "Description 5", image: "product_5.jpg", rating: "3.5", price: "199"),
                            ]
                        )
                    )
                ]
            )
        );
    }
}
