import 'package:bloc_store/Sreens/details_page.dart';
import 'package:flutter/material.dart';

import 'cart_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  extendBodyBehindAppBar: true,
      extendBody: false,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 114, 190, 155),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => CartPage()));
            },
            icon: Icon(Icons.shopping_cart),
          )
        ],
        scrolledUnderElevation: 5,
        toolbarOpacity: .9,
        //forceMaterialTransparency: false,
        bottomOpacity: .5,
        toolbarHeight: 75,
        //flexibleSpace: AppBarContainer(),
        title: Text("My Store"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: GridView.builder(
            itemCount: 10,
            //  shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1 / 1.5, crossAxisCount: 2),
            // semanticChildCount: 3,
            itemBuilder: (context, index) {
              return ProductWithFavorate();
            }),
      ),
    );
  }
}

class AppBarContainer extends StatelessWidget {
  const AppBarContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      width: MediaQuery.of(context).size.width,
      // height: 150,
      child: FittedBox(
          fit: BoxFit.fill,
          child: Image.network("https://i.stack.imgur.com/wytMb.png")),
    );
  }
}

class ProductWithFavorate extends StatelessWidget {
  const ProductWithFavorate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        oneIteam(),
        Align(
          alignment: Alignment(.93, -.93),
          child: Icon(Icons.favorite),
        ),
      ],
    );
  }
}

class oneIteam extends StatelessWidget {
  const oneIteam({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => DetailsPage())),
      child: SizedBox(
        height: 300,
        child: FittedBox(
          fit: BoxFit.fill,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 233, 226, 226),
                  ),
                  borderRadius: BorderRadius.circular(5)),
              // borderOnForeground: true,
              //shape:
              //   RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              // elevation: 7,
              // shadowColor: Colors.black,
              // color: Color.fromARGB(255, 199, 198, 198),
              child: FittedBox(
                //  fit: BoxFit.fitHeight,
                child: Column(
                  children: [
                    ClipRRect(
                      //   borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                          fit: BoxFit.cover,
                          height: MediaQuery.of(context).size.height * .20,
                          "https://cdn.dribbble.com/users/4709454/screenshots/13669839/media/98280b69ae566546767eeecacb99915a.jpg"),
                    ),
                    Text(
                      "New ",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text("Prize",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
