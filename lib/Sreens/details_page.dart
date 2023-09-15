import 'package:bloc_store/model/store_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({required this.product, super.key});
  final StoreModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        //   physics: NeverScrollableScrollPhysics(),
        children: [
          MainImage(product: product),
          DifferentImages(product: product),
          DetailsOfIteam(product: product),
        ],
      ),
    );
  }
}

class MainImage extends StatelessWidget {
  const MainImage({
    required this.product,
    super.key,
  });
  final StoreModel product;
  @override
  Widget build(BuildContext context) {
    return Image.network(
      product.image!,
      //  "https://www.jiomart.com/images/product/original/rvcws2fyqc/bruton-trendy-sports-shoes-for-men-blue-product-images-rvcws2fyqc-0-202209021256.jpg?im=Resize=(500,630)",
      height: MediaQuery.of(context).size.height * .75,
      width: double.infinity,
    );
  }
}

class DifferentImages extends StatelessWidget {
  const DifferentImages({
    required this.product,
    super.key,
  });
  final StoreModel product;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: ListView.builder(
        itemCount: 7,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 75,
              width: 55,
              decoration: BoxDecoration(
                color: CupertinoColors.activeOrange,
                // border: Border.all(color: Colors.black),
              ),
              child: Image.network(
                product.image!,
                //  "https://www.jiomart.com/images/product/original/rvcws2fyqc/bruton-trendy-sports-shoes-for-men-blue-product-images-rvcws2fyqc-0-202209021256.jpg?im=Resize=(500,630)",
                fit: BoxFit.fill,
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetailsOfIteam extends StatelessWidget {
  const DetailsOfIteam({
    required this.product,
    super.key,
  });
  final StoreModel product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.title!,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text(product.category!.toUpperCase()),
          SizedBox(
            height: 10,
          ),
          Text(
            " ₹ ${((product.price!) * 84).ceil()}",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(product.description!),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 114, 190, 155),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(5)) // Background color
                      ),
                  onPressed: () {},
                  child: Text(
                    "Buy Now",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(5)) // Background color
                        ),
                    onPressed: () {},
                    child: Text(
                      "Add to Cart",
                      style: TextStyle(color: Colors.black),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
