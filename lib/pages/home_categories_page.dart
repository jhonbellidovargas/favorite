import 'package:favorite/utils/utils.dart';
import 'package:favorite/widgets/categories/notification_icon.dart';
import 'package:favorite/widgets/common/general_image.dart';
import 'package:favorite/widgets/common/scaffold_wrapper.dart';
import 'package:favorite/widgets/common/v_spacing.dart';
import 'package:flutter/material.dart';

class HomeCategoriesPage extends StatelessWidget {
  const HomeCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: mqHeigth(context, 2),horizontal: mqWidth(context, 5)),
                  color: Colors.white,
                  child: Column(
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GeneralImage(
                            height: mqHeigth(context, 5),
                            width: mqHeigth(context, 5),
                            url: '',
                            borderRadius: 15,
                            ),
                          GeneralImage(
                            height: mqHeigth(context, 5),
                            width: mqWidth(context, 40),
                            url: ''
                            ),
                          const NotificationIcon()
                        ],
                      ),
                      const VSpacing(2),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Hola! Carmen'),
                          Row(
                            children: [
                              Column( crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text('Saldo'),
                                  Text('kilometros'),
                                ],
                              ),
                              Container(width: mqWidth(context, 2),),
                              Column(
                                children: [
                                  const Text('14.5K'),
                                  Container(
                                    height: mqHeigth(context, 1),
                                    width: mqWidth(context, 20),
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20)),
                                      color: Colors.amber,
                                    ),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: mqWidth(context,3)),
                  child: Stack(
                    children: [
                      TextFormField(
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
                      Padding(
                        padding: EdgeInsets.only(left: mqWidth(context, 78), top: mqHeigth(context, 0.7)),
                        child: Container(
                          height:mqHeigth(context, 6),
                          width: mqHeigth(context, 7),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: const [
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
                ),
                const VSpacing(2),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      GeneralImage(
                        height: mqHeigth(context, 16),
                        width: mqWidth(context,70),
                        url:'',
                        borderRadius: 10,
                      ),
                      Container(width: mqWidth(context, 4),),
                      GeneralImage(
                        height: mqHeigth(context, 16),
                        width: mqWidth(context,70),
                        url:'',
                        borderRadius: 10,
                      ),
                      Container(width: mqWidth(context, 4),),
                      GeneralImage(
                        height: mqHeigth(context, 16),
                        width: mqWidth(context,70),
                        url:'',
                        borderRadius: 10,
                      )
                    ],
                  ),
                ),
                const VSpacing(1),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(width: mqWidth(context, 2),),
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey,
                            maxRadius: mqHeigth(context, 4),
                            child: const Icon(Icons.access_alarm_sharp, color: Colors.black,),
                          ),
                          const VSpacing(1),
                          const Text('Popular')
                        ],
                      ),
                      Container(width: mqWidth(context, 5),),
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey,
                            maxRadius: mqHeigth(context, 4),
                            child: const Icon(Icons.access_alarm_sharp, color: Colors.black,),
                          ),
                          const VSpacing(1),
                          const Text('Popular')
                        ],
                      ),
                      Container(width: mqWidth(context, 5),),
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey,
                            maxRadius: mqHeigth(context, 4),
                            child: const Icon(Icons.access_alarm_sharp, color: Colors.black,),
                          ),
                          const VSpacing(1),
                          const Text('Popular')
                        ],
                      ),
                      Container(width: mqWidth(context, 5),),
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey,
                            maxRadius: mqHeigth(context, 4),
                            child: const Icon(Icons.access_alarm_sharp, color: Colors.black,),
                          ),
                          const VSpacing(1),
                          const Text('Popular')
                        ],
                      ),
                      Container(width: mqWidth(context, 5),),
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey,
                            maxRadius: mqHeigth(context, 4),
                            child: const Icon(Icons.access_alarm_sharp, color: Colors.black,),
                          ),
                          const VSpacing(1),
                          const Text('Popular')
                        ],
                      ),
                      Container(width: mqWidth(context, 2),),
                    ],
                  ),
                ),
                const VSpacing(2),
                 Padding(
                   padding: EdgeInsets.only(left: mqWidth(context, 8)),
                   child: const Text('Populares'),
                 ),
                 const VSpacing(2),
                 Padding(
                   padding: EdgeInsets.symmetric(horizontal: mqWidth(context, 5)),
                   child: Row(
                     children: [
                      Column(
                        children: [
                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GeneralImage(
                                width: mqHeigth(context, 20),
                                height: mqHeigth(context,25),
                                url: '',
                                borderRadius: 20,
                              ),
                              const VSpacing(1),
                              const Text('Chiken Curry'),
                              const VSpacing(1),
                              const Text('Asian'),
                            ],
                          ),
                          const VSpacing(2),
                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GeneralImage(
                                width: mqHeigth(context, 20),
                                height: mqHeigth(context, 20),
                                url: '',
                                borderRadius: 20,
                              ),
                              const VSpacing(1),
                              const Text('Chiken Curry'),
                              const VSpacing(1),
                              const Text('Asian'),
                            ],
                          ),
                        ],
                      ),
                      Container(width: mqWidth(context, 9),),
                      Column(
                        children: [
                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GeneralImage(
                                width: mqHeigth(context, 20),
                                height: mqHeigth(context, 20),
                                url: '',
                                borderRadius: 20,
                              ),
                              const VSpacing(1),
                              const Text('Chiken Curry'),
                              const VSpacing(1),
                              const Text('Asian'),
                            ],
                          ),
                          const VSpacing(2),
                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GeneralImage(
                                width: mqHeigth(context, 20),
                                height: mqHeigth(context,25),
                                url: '',
                                borderRadius: 20,
                              ),
                              const VSpacing(1),
                              const Text('Chiken Curry'),
                              const VSpacing(1),
                              const Text('Asian'),
                            ],
                          ),
                        ],
                      )
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