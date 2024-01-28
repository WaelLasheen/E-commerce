import 'package:e_commerce/Model/productModel.dart';
import 'package:e_commerce/screens/product_details.dart';
import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate<String> {
  List<productModel> products = [];
  late List<productModel> filter=[];
  DataSearch({required this.products});
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () => query = '', icon: const Icon(Icons.clear)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => close(context, ''),
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    if(filter.isEmpty) {
      return Center(child: Image.network('https://cdn.dribbble.com/userupload/8392917/file/original-12975f538c2c84c598f256f075ffde7a.jpg?resize=752x'),);
    }
    return GridView.builder(
              itemCount: filter.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 18,
                mainAxisSpacing: 20,
              ),
              itemBuilder: (context, index) {
                productModel iteam = filter[index];
                return InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => productDetails(iteam: iteam),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(flex: 6, child: Image.network(iteam.image!)),
                        Expanded(
                            flex: 1,
                            child: Text(iteam.title!,
                                overflow: TextOverflow.ellipsis)),
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              const Expanded(flex: 1, child: SizedBox()),
                              Icon(
                                Icons.star_half,
                                size: 20,
                                color: Colors.yellow[700],
                              ),
                              Text(iteam.rating!.rate.toString()),
                              const Expanded(flex: 4, child: SizedBox()),
                              Text("${iteam.price!}"),
                              Icon(
                                Icons.attach_money,
                                color: Colors.green[400],
                                size: 18,
                              ),
                              const Expanded(flex: 1, child: SizedBox()),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query == '') return const Text('');
    filter = products
        .where((product) =>
            product.title!.toUpperCase().contains(query.toUpperCase()))
        .toList();
    // iteams = filter;

    if (filter.isEmpty) {
      return Center(
          child: Image.network(
              'https://cdn.dribbble.com/userupload/8392916/file/original-eacb85dbe2edcca45e0ccfeecfcbc012.jpg?resize=1024x769'));
    }

    return ListView.builder(
        itemCount: filter.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              // query = filter[index].title!;
              Navigator.push(context, MaterialPageRoute(builder: (context) => productDetails(iteam: filter[index]),));
            },
            child: ListTile(
              title: Text(
                filter[index].title!,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              trailing:
                  SizedBox(width: 30, child: Image.network(filter[index].image!)),
            ),
          );
        });
  }
}
