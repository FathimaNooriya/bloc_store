import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        //   physics: NeverScrollableScrollPhysics(),
        children: [
          MainImage(),
          DifferentImages(),
          DetailsOfIteam(),
        ],
      ),
    );
  }
}

class MainImage extends StatelessWidget {
  const MainImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "https://www.jiomart.com/images/product/original/rvcws2fyqc/bruton-trendy-sports-shoes-for-men-blue-product-images-rvcws2fyqc-0-202209021256.jpg?im=Resize=(500,630)",
      height: MediaQuery.of(context).size.height * .75,
      width: double.infinity,
    );
  }
}

class DifferentImages extends StatelessWidget {
  const DifferentImages({
    super.key,
  });

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
                border: Border.all(color: Colors.black),
              ),
              child: Image.network(
                "https://www.jiomart.com/images/product/original/rvcws2fyqc/bruton-trendy-sports-shoes-for-men-blue-product-images-rvcws2fyqc-0-202209021256.jpg?im=Resize=(500,630)",
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
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Adddd Shoe",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text(
            "Prize: Rs 500",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
              "Description ...... ......... .......... ............ ................. ............ ................ .............. .......... ............. ................. ................. ................. ........... ........... ............ .......... .................... ................. ................ .................. .............. ............... ...................... ................... ............... ................... ................. ................. "),
          Text("asd ad da da "),
          Text("Quantity: 1 "),
          Text("Rating:****"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: () {}, child: Text("Buy Now")),
              ElevatedButton(onPressed: () {}, child: Text("Add to Cart")),
            ],
          ),
        ],
      ),
    );
  }
}
