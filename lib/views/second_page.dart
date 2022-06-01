import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/model/product.dart';
import 'package:flutter_assignment/utils/app_state.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Consumer<AppState>(builder: (context, appState, widget) {
            if (appState.products.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemCount: 1000,
              itemBuilder: (context, index) {
                Product product = appState.products.values.toList()[index];
                return Card(
                  margin: const EdgeInsets.all(5),
                  child: Column(
                    children: [
                      CachedNetworkImage(
                        placeholder: (context, url) => Center(
                          child: Container(
                            alignment: Alignment.center,
                            height: 300,
                            color: Colors.grey[300],
                            child: Image.asset(
                              'loader.gif',
                              height: 60,
                            ),
                          ),
                        ),
                        fit: BoxFit.cover,
                        imageUrl: product.productUrl!,
                        errorWidget: (context, text, d) => SizedBox(
                          width: 300,
                          height: 300,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                '404',
                                style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(d.message),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              product.productName!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3)),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 2),
                              child: Row(
                                children: [
                                  Text(
                                    product.productRating!.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  const Icon(
                                    Icons.star,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8.0,
                          right: 8.0,
                          bottom: 12,
                        ),
                        child: Text(
                          product.productDescription!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.clear),
        onPressed: () {
          context.read<AppState>().products.clear();
        },
      ),
    );
  }
}
