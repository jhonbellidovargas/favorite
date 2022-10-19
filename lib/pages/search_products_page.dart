import 'package:favorite/utils/utils.dart';
import 'package:favorite/widgets/common/general_image.dart';
import 'package:favorite/widgets/common/scaffold_wrapper.dart';
import 'package:favorite/widgets/common/v_spacing.dart';
import 'package:flutter/material.dart';

class SearchProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: (){}, 
                    icon:  const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
                  ),
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical:mqHeigth(context, 2)),
                        width: mqWidth(context, 70),
                        height: mqHeigth(context, 10),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Search any recipe',
                            prefixIcon: const Icon(Icons.search),
                            prefixIconColor: Colors.black,
                            border: InputBorder.none,
                            fillColor: const Color.fromARGB(255, 236, 229, 229),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide.none
                            )
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: mqWidth(context, 56), top: mqHeigth(context, 2.5)),
                        child: Container(
                          height:mqHeigth(context, 5),
                          width: mqHeigth(context, 6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 0.5,
                              blurRadius: 18
                            )
                          ]
                          ),
                          child: IconButton(
                            onPressed: (){}, 
                            icon:  const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
                          ),
                        ),
                      )
                    ]
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 2),
                    child: GeneralImage(
                      height: mqHeigth(context, 6),
                      width: mqHeigth(context, 6),
                      url: '', 
                      borderRadius: 15,
                    ),
                  ),
                  Container(width: mqWidth(context, 2),)
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: mqWidth(context, 4), vertical: mqHeigth(context, 1)),
                color: Colors.amber,
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: mqWidth(context, 6), vertical: mqHeigth(context, 1)),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.horizontal(left: Radius.circular(20), right: Radius.circular(20)),
                        color: Colors.white
                      ),
                      child: const Text('Ordenar por'),
                    ),
                    SizedBox(
                      width: mqWidth(context, 25),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(width: mqWidth(context, 8), height: mqWidth(context, 0.4), color: Colors.white),
                              const VSpacing(0.5),
                              Container(width: mqWidth(context, 7), height: mqWidth(context, 0.4), color: Colors.white),
                              const VSpacing(0.5),
                              Container(width: mqWidth(context, 6), height: mqWidth(context, 0.4), color: Colors.white)
                            ],
                          ),
                          Container(
                            height: mqHeigth(context, 4),
                            width: mqWidth(context, 0.4),
                            color: Colors.white,
                          ),
                          const Text('Filtrar', style: TextStyle(color: Colors.white),)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const VSpacing(2),
              Row(
                children: const [
                  ShopingCard(),
                  ShopingCard(),
                ],
              ),
              const VSpacing(2),
              Row(
                children: const [
                  ShopingCard(),
                  ShopingCard(),
                ],
              ),
              const VSpacing(2),
              Row(
                children: const [
                  ShopingCard(),
                  ShopingCard(),
                ],
              )
            ],
          ),
        )
      ),
    );
  }
}

class ShopingCard extends StatelessWidget {
  const ShopingCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: mqWidth(context, 6)),
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10), bottom: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
          color: Colors.grey,
          spreadRadius: 1,
          blurRadius: 5,
          blurStyle: BlurStyle.outer
          )
        ],
        color: Colors.white
      ),
      child: Column( crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          GeneralImage(
            height: mqHeigth(context, 20),
            width: mqWidth(context, 33),
            url: ''
          ),
          const VSpacing(1),
          SizedBox(
            width: mqWidth(context, 33),
            child: const Text('Pulseras curtidas de 15 cm')),
          SizedBox(
            width: mqWidth(context, 28),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('15.8 KM'),
                GeneralImage(
                  height: mqHeigth(context,6),
                  width: mqHeigth(context, 6),
                  url: '',
                  borderRadius: 30,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}