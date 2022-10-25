import 'package:app/constants/globalvariable.dart';
import 'package:app/utils/Product.dart';
import 'package:app/views/products/productPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// Products heading ko product card.

Color _favIconColor = Colors.black;

class ProductCard extends StatefulWidget {
  const ProductCard({
    Key? key,
    this.width=140,
    this.aspectRation=1.02,
    required this.product,

  }) : super(key: key);
  final double width, aspectRation;
  final Product product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(widget.width),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: widget.aspectRation,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(20)),
              decoration: BoxDecoration(
                color: GlobalVariables.secondaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: GestureDetector(
                onTap: (){
        //           Navigator.of(context)                                    //GO TO THE PRODUCT DESCRIPTION PAGE.
        // .pushNamedAndRemoveUntil(ProductPage.routeName, (route) => false);
                },
                child: Image.asset(widget.product.images[0])),
            ),
            ),
            const SizedBox(height: 15),
            Text(widget.product.title,
             style: TextStyle(
              fontSize: getProportionateScreenWidth(15),
              color: Colors.black),
             maxLines:2),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text("\$${widget.product.price}",
                  style: TextStyle(
                    fontSize:getProportionateScreenWidth(18),
                    fontWeight: FontWeight.w600,
                    color:GlobalVariables.backgroundColor,
                  ),
                  ),
                  IconButton(
                icon: Icon(Icons.favorite_outlined),
                onPressed: () {
                  setState(() {
                    
                    if (_favIconColor==Colors.black) {
                       _favIconColor = Colors.red;
                      //widget.product.isFavourite=true;
                     
                    } else {
                      _favIconColor = Colors.black;
                     // widget.product.isFavourite=false;
                    }
                  });
                },
                color: _favIconColor,
              ),
              //     InkWell(
              //          borderRadius: BorderRadius.circular(30),
              //          onTap: () {
              //           if(widget.product.isFavourite== true){
              //             widget.product.isFavourite==false;
              //           }else{
              //             widget.product.isFavourite=true;
              //           }
              //          },
              //          child: Container(
              // padding: EdgeInsets.all(getProportionateScreenWidth(8)),
              // height: getProportionateScreenWidth(28),
              // width: getProportionateScreenWidth(28),
              // decoration: BoxDecoration(
              //   color: widget.product.isFavourite
              //       ? GlobalVariables.backgroundColor.withOpacity(0.15)
              //       : GlobalVariables.secondaryColor.withOpacity(0.1),
              //   shape: BoxShape.circle,
              // ),
              // child: SvgPicture.asset(
              //   "assets/icons/Heart Icon_2.svg",
              //   color: widget.product.isFavourite
              //       ? Color(0xFFFF4848)
              //       : Color(0xFFDBDEE4),
              // ),
              //          ),
              //        ),
               ],
             )
          ],
        ),
      ),
    );
  }
}