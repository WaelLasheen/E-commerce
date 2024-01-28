import 'package:e_commerce/Model/productModel.dart';
import 'package:e_commerce/provider/purchases.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class productDetails extends StatelessWidget {
  final productModel iteam;
  const productDetails({super.key, required this.iteam});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        SizedBox(height: 300, child: Image.network(iteam.image!)),
        Container(
          padding: const EdgeInsets.fromLTRB(20,15,20,0),
          margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
          decoration: const BoxDecoration(
              color: Color(0xffF0F3F5),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Column(
            children: [
              Text(
                iteam.title!,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff191919)),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(children: [
                  Icon(
                    Icons.star_half,
                    size: 28,
                    color: Colors.yellow[700],
                  ),
                  Text(
                    " ${iteam.rating!.rate}",
                    style: const TextStyle(
                        fontSize: 20,
                        color: Color(0xff2B303A),
                        fontWeight: FontWeight.bold),
                  ),
                  const Expanded(child: SizedBox()),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: Color(0xffEAE9E3)),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: iteam.rating!.count.toString(),
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[900],
                            fontWeight: FontWeight.w500),
                        children: <TextSpan>[
                          TextSpan(
                              text: ' Reviewers',
                              style: TextStyle(
                                  fontSize: 14, color: Colors.grey[700])),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                        text: "Price ",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        children: <TextSpan>[
                          TextSpan(
                            text: " ${iteam.price!} ",
                            style: const TextStyle(
                                color: Color(0xff1F3848),
                                fontSize: 20,
                                fontWeight: FontWeight.w600
                              )
                          ),
                          TextSpan(
                            text: "\$",
                            style: TextStyle(
                                color: Colors.green[800],
                                fontWeight: FontWeight.bold
                              )
                            )
                        ]),
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.grey[300] ,borderRadius: const BorderRadius.all(Radius.circular(16))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(onPressed: ()=>Provider.of<Purchasses>(context, listen: false).increment(), icon: const Icon(Icons.add,size: 16,),style: const ButtonStyle(tapTargetSize: MaterialTapTargetSize.shrinkWrap),),
                        Text("${Provider.of<Purchasses>(context).num}" ,strutStyle: const StrutStyle(fontSize: 16 ,fontWeight: FontWeight.bold),),
                        IconButton(onPressed: ()=>Provider.of<Purchasses>(context ,listen: false).decrement(), icon: const Icon(Icons.remove ,size: 16,) ,style: const ButtonStyle(tapTargetSize: MaterialTapTargetSize.shrinkWrap)),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10,),
              const Row(
                children: [
                  Text('description' ,style: TextStyle(fontSize: 24 ,color: Color(0xffA10702) ,fontWeight: FontWeight.bold),),
                  Expanded(child: SizedBox())
                ],
              ),
              const SizedBox(height: 10,),
              Text(iteam.description! ,style: const TextStyle(color: Color(0xff1E2021) ,fontSize: 13 ,fontWeight: FontWeight.w500),),
              const SizedBox(height: 20,),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, foregroundColor: Colors.white),
                  onPressed: () {
                    showDialog(context: context, builder:(context) {
                      return AlertDialog(
                        content: const Text('Are you sure !',style: TextStyle(fontSize: 26,fontWeight: FontWeight.w800),),
                        
                        actions: [
                            TextButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Added Successfully')));
                                  Provider.of<Purchasses>(context,
                                          listen: false)
                                      .buy(iteam);
                                  Navigator.pop(context);
                                },
                                child: const Text('YES',style: TextStyle(color: Colors.blue),)),
                            TextButton(
                                onPressed: () {
                                  Provider.of<Purchasses>(context,
                                          listen: false)
                                      .returnTo1();
                                  Navigator.pop(context);
                                },
                                child: const Text('NO',style: TextStyle(color: Colors.red))),
                          ],
                      );
                    }, );
                  },
                  icon: const Icon(Icons.shopping_bag),
                  label: const Text('Add to Cart')
              ),

              const SizedBox(height: 15,),
            ],
          ),
        ),
      ],
    ));
  }
}
