import 'package:bloc_store/Sreens/details_page.dart';
import 'package:bloc_store/controller/bloc/bloc_bloc.dart';
import 'package:bloc_store/model/store_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../api_integration/api_functions.dart';
import 'cart_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<BlocBloc>().add(GetAllProductsEvent());
    return Scaffold(
      extendBody: false,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 114, 190, 155),
        actions: [
          IconButton(
            onPressed: () async {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => const CartPage()));
            },
            icon: const Icon(Icons.shopping_cart),
          ),
          IconButton(
              onPressed: () {
                StoreApi().postProducts(context);
              },
              icon: const Icon(Icons.add))
        ],
        scrolledUnderElevation: 5,
        toolbarOpacity: .9,
        //forceMaterialTransparency: false,
        bottomOpacity: .5,
        toolbarHeight: 75,
        //flexibleSpace: AppBarContainer(),
        title: const Text("My Store"),
      ),
      body: BlocBuilder<BlocBloc, BlocState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: state.products.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : GridView.builder(
                    itemCount: state.products.length,
                    //  shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1 / 1.8, crossAxisCount: 2),
                    // semanticChildCount: 3,
                    itemBuilder: (context, index) {
                      final product = state.products[index];
                      return ProductWithFavorate(
                        product: product,
                      );
                    }),
          );
        },
      ),
    );
  }
}

// class AppBarContainer extends StatelessWidget {
//   const AppBarContainer({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // color: Colors.red,
//       width: MediaQuery.of(context).size.width,
//       height: 150,
//       // child: FittedBox(
//       //   fit: BoxFit.fill,
//       //  child: Image.network("https://i.stack.imgur.com/wytMb.png")),
//     );
//   }
// }

class ProductWithFavorate extends StatelessWidget {
  const ProductWithFavorate({
    required this.product,
    super.key,
  });
  final StoreModel product;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        oneIteam(product: product),
        const Align(
          alignment: Alignment(.93, -.93),
          child: Icon(Icons.favorite),
        ),
      ],
    );
  }
}

class oneIteam extends StatelessWidget {
  const oneIteam({
    required this.product,
    super.key,
  });
  final StoreModel product;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DetailsPage(
                product: product,
              ))),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          height: MediaQuery.of(context).size.height * .5,
          decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(255, 233, 226, 226),
              ),
              borderRadius: BorderRadius.circular(5)),
          // borderOnForeground: true,
          //shape:
          //   RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          // elevation: 7,
          // shadowColor: Colors.black,
          // color: Color.fromARGB(255, 199, 198, 198),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .3,
                  child: ClipRRect(
                    child: Image.network(fit: BoxFit.contain, product.image!),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .06,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title!,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Text("₹ ${(product.price! * 84).ceil().toString()}",
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
