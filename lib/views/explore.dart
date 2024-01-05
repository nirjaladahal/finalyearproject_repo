import 'package:final_year_project/data/product_data.dart';
import 'package:final_year_project/views/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            //search and filter icon are going to be on the row
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Search here..",
                          isDense: true,
                          contentPadding: const EdgeInsets.all(12),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(99),
                            ),
                          ),
                          prefixIcon: const Icon(IconlyLight.search)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: IconButton.filled(
                        onPressed: () {},
                        icon: const Icon(IconlyLight.filter2)),
                  )
                ],
              ),
            ),

            //wheather UI

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                  height: 180,
                  child: Card(
                    color: Colors.green.shade100,
                    elevation: 0.1,
                    shadowColor: Colors.green.shade100,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          //text here
                          Flexible(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Free Consultation",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                        color: Colors.green.shade700,
                                      ),
                                ),
                                const Text(
                                    "Get free support from our crops Doctors"),
                                FilledButton(
                                    onPressed: () {},
                                    child: const Text("Call Now"))
                              ],
                            ),
                          ),
                          //images
                          Image.asset(
                            "assets/images/contact.png",
                            width: 120,
                            height: 100,
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Featured products",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                TextButton(onPressed: () {}, child: const Text("see all"))
              ],
            ),
            // Featured crops

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (context, index) {
                return ProductCard(
                  product: products[index],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
