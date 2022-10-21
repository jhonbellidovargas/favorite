import 'package:favorite/models/product_model.dart';
import 'package:favorite/utils/styles.dart';
import 'package:favorite/utils/utils.dart';
import 'package:favorite/widgets/common/general_image.dart';
import 'package:favorite/widgets/common/scaffold_wrapper.dart';
import 'package:favorite/widgets/common/v_spacing.dart';
import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    // print(product.title);
    return ScaffoldWrapper(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                  right: mqWidth(context, 5), top: mqHeigth(context, 1)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: mqWidth(context, 12),
                    height: mqHeigth(context, 6),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(18),
                          bottomRight: Radius.circular(18)),
                      color: Colors.white,
                    ),
                    child: Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_back_ios_new_rounded,
                              size: 20),
                        )),
                  ),
                  Container(
                      padding: EdgeInsets.only(top: mqHeigth(context, 2)),
                      child: const Text('Información del producto',
                          style: sectionSubtitleTextStyle)),
                  GeneralImage(
                    width: mqHeigth(context, 6),
                    height: mqHeigth(context, 6),
                    url: '',
                    borderRadius: 15,
                  ),
                ],
              ),
            ),
            const VSpacing(3),
            Container(
              padding: EdgeInsets.symmetric(horizontal: mqWidth(context, 18)),
              height: mqHeigth(context, 25),
              width: double.infinity,
              child: PageView(
                children: const [
                  GeneralImage(
                    url:
                        'https://i.pinimg.com/236x/62/a5/cd/62a5cdfce9ae15cb38643eeda34a9e8b.jpg',
                    fit: BoxFit.cover,
                    borderRadius: 20,
                  ),
                  GeneralImage(
                    url:
                        'https://i.pinimg.com/236x/46/a1/6d/46a16de0374804f8f69ac8a553b391ad.jpg',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            const VSpacing(2),
            Center(
              child: SizedBox(
                width: mqWidth(context, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    CircleAvatar(radius: 7, backgroundColor: Colors.grey),
                    CircleAvatar(radius: 7, backgroundColor: Colors.grey),
                    CircleAvatar(radius: 7, backgroundColor: Colors.grey),
                    CircleAvatar(radius: 7, backgroundColor: Colors.grey),
                    CircleAvatar(radius: 7, backgroundColor: Colors.grey),
                  ],
                ),
              ),
            ),
            const VSpacing(2),
            Container(
              margin: EdgeInsets.only(
                  left: mqWidth(context, 4), right: mqWidth(context, 10)),
              child: Text(product.title, style: sectionSubtitleTextStyle),
            ),
            const VSpacing(0.5),
            Container(
              margin: EdgeInsets.only(
                left: mqWidth(context, 7),
              ),
              child: const Text('Valor', style: commonTextStyle),
            ),
            const VSpacing(0.5),
            Container(
              margin: EdgeInsets.only(
                left: mqWidth(context, 10),
              ),
              child:
                  Text('${product.value} KM', style: sectionSubtitleTextStyle),
            ),
            const VSpacing(1),
            Container(
              margin: EdgeInsets.only(
                left: mqWidth(context, 7),
              ),
              child: const Text(
                'Descripción',
                style:
                    TextStyle(color: Colors.amber, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: mqWidth(context, 7)),
              child: const Divider(
                color: Colors.grey,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: mqWidth(context, 7)),
              child: Text(product.longDescription, style: textStyleBlackFav),
            ),
            const VSpacing(1),
            Container(
              margin: EdgeInsets.only(
                left: mqWidth(context, 7),
              ),
              child: const Text(
                'Calificación',
                style:
                    TextStyle(color: Colors.amber, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: mqWidth(context, 7)),
              child: const Divider(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
