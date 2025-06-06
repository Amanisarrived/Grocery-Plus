import 'package:flutter/material.dart';
import 'package:my_project_first/provider/product_provider.dart';
import 'package:my_project_first/widgets/homescreen%20widget/catogery_card.dart';
import 'package:my_project_first/widgets/homescreen%20widget/location_widget.dart';
import 'package:my_project_first/widgets/homescreen%20widget/search_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          children: [
            const LocationWidget(),
            const SizedBox(height: 20),
            const SearchWidget(),

            // UI below changes based on search
            Expanded(
              child: Consumer<ProductProvider>(
                builder: (context, productProvider, child) {
                  // Pehle jaise: sirf categories dikhayein
                  return GridView.builder(
                    itemCount: productProvider.catogeryList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.8,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 20,
                        ),
                    itemBuilder: (context, index) => CatogeryCard(
                      catogeries: productProvider.catogeryList[index],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
