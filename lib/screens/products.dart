import 'package:e_commerce/API/productAPI.dart';
import 'package:e_commerce/Model/productModel.dart';
import 'package:e_commerce/provider/purchases.dart';
import 'package:e_commerce/screens/product_details.dart';
import 'package:e_commerce/search/search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    List<productModel> products = [];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Our Products",style: TextStyle(color: Color(0xffE3B505),fontSize: 26),),
        iconTheme: const IconThemeData(color: Color(0xffE3B505),size: 28),
        backgroundColor:  Colors.white,
        actions: [
          IconButton(
              onPressed: () => showSearch(
                  context: context, delegate: DataSearch(products: products)),
              icon: const Icon(Icons.search)),

          ///////////////// Will be replace by Cart Screen
          IconButton(onPressed: () {
            showDialog(context: context, builder: (context) {
              return AlertDialog(
                content: ListView.builder(itemCount:Provider.of<Purchasses>(context).myPurchasses.length,itemBuilder: (context, index) {
                  List<productModel>pl=[];
                  Provider.of<Purchasses>(context).myPurchasses.forEach((key, value) { 
                    pl.add(key);
                  });
                  return ListTile(
                    title: Text(pl[index].title!),
                  );
                },),
              );
            },);
          }, icon: const Icon(Icons.info))

          /////////////////////////
        ],
      ),
      body: FutureBuilder<List<productModel>>(
        future: ProductAPI().featchData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // set data into products list to use it in search
            products = snapshot.data!;

            return GridView.builder(
              itemCount: snapshot.data!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 18,
                mainAxisSpacing: 20,
              ),
              itemBuilder: (context, index) {
                productModel iteam = snapshot.data![index];
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

          if (snapshot.hasError) {
            print('Error in shapshot Data : ${snapshot.error}');
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
