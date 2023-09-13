import 'package:flutter/material.dart';

import 'home_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart"),
        toolbarHeight: 170,
        flexibleSpace: AppBarContainer(),
      ),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (Context, index) {
            return CartIteam();
          }),
    );
  }
}

class CartIteam extends StatelessWidget {
  const CartIteam({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IteamImage(),
                  AboutIteam(),
                ],
              ),
              DeleteFromCart()
            ],
          ),
          Quantity(),
          SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}

class DeleteFromCart extends StatelessWidget {
  const DeleteFromCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
        onPressed: () {},
        icon: Icon(Icons.delete),
      ),
    );
  }
}

class IteamImage extends StatelessWidget {
  const IteamImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: FittedBox(
        fit: BoxFit.fitHeight,
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * .25,
                "https://rukminim2.flixcart.com/image/850/1000/xif0q/shirt/z/g/d/xl-st2-vebnor-original-imagpw72vhqfczsp.jpeg?q=90"),
          ),
        ),
      ),
    );
  }
}

class AboutIteam extends StatelessWidget {
  const AboutIteam({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Mens Wear",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text("Category"),
          Text("Prize"),
        ],
      ),
    );
  }
}

class Quantity extends StatelessWidget {
  const Quantity({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2),
      child: Container(
        // decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(10),
        // border: Border.all()),
        child: Row(children: [
          Card(
            shape: CircleBorder(
              eccentricity: 0,
            ),
            color: Colors.white,
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(9.0),
              child: Text("-"),
            ),
          ),
          //ElevatedButton(onPressed: () {}, child: Text("-"),),
          SizedBox(
            height: 30,
            width: 50,
            child: ElevatedButton(
              // style: ButtonStyle(backgroundColor:Color( Colors.white)),
              onPressed: () {},
              child: Text(
                "2",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          Card(
            shape: CircleBorder(
              eccentricity: 0,
            ),
            color: Colors.white,
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: Text("+"),
            ),
          ),
          // ElevatedButton(onPressed: () {}, child: Text("+")),
        ]),
      ),
    );
  }
}
