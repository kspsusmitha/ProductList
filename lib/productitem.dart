import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductItem extends StatelessWidget {
  final pTitle;
  final pType;
  final pPrice;
  final pImage;

  const ProductItem({
    super.key,
    required this.pTitle,
    required this.pType,
    required this.pPrice,
    required this.pImage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Material(
        color: Colors.blueGrey.shade50,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: InkWell(
          onTap: () {},
          child: Expanded(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(style: BorderStyle.none),
              ),
              child: Center(
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        child: Image.network(pImage),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Text(
                          pTitle,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w800),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'RS - $pPrice',
                            style: const TextStyle(
                                color: Colors.red,
                                fontSize: 15,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'type -$pType',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
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
