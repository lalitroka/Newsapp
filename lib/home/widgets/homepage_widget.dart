import 'package:flutter/material.dart';

class TopCoverImage extends StatelessWidget {
  final Widget mainImage;
  final Widget iconText;
  final Widget mainText;
  final Widget mainIcon;
  final Widget name;

  const TopCoverImage({
    super.key,
    required this.mainImage,
    required this.iconText,
    required this.mainText,
    required this.mainIcon,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 1),
      child: Row(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: SizedBox(
                  height: 160,
                  width: 300,
                  child: mainImage,
                ),
              ),
              Positioned(
                top: 8,
                left: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                    height: 25,
                    width: 70,
                    color: Colors.yellow,
                    child: iconText,
                  ),
                ),
              ),
              Positioned(
                top: 50,
                left: 15,
                right: 10,
                child: mainText,
              ),
              Positioned(
                top: 120,
                left: 15,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(250),
                      child: SizedBox(
                        height: 25,
                        width: 25,
                        child: mainIcon,
                      ),
                    ),
                    name,
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CoverImage extends StatelessWidget {
  final Widget title;
  final Widget bodytitle;
  final Widget subtitle;
  final Widget smallImage;
  final Widget assetImage;
  final Widget icons;

  const CoverImage({
    super.key,
    required this.title,
    required this.bodytitle,
    required this.subtitle,
    required this.smallImage,
    required this.assetImage,
    required this.icons,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(children: [
        const SizedBox(
          height: 1,
        ),
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                height: 80,
                width: 80,
                child: assetImage,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 20,
                        width: 20,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(250),
                          child: smallImage,
                        ),
                      ),
                      const SizedBox(width: 10),
                      DefaultTextStyle.merge(
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 8,
                          fontFamily: 'sans-serif',
                        ),
                        child: title,
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  DefaultTextStyle.merge(
                    maxLines: 1,
                    style: const TextStyle(fontSize: 12),
                    child: bodytitle,
                  ),
                  DefaultTextStyle.merge(
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.black,
                    ),
                    child: subtitle,
                  ),
                ],
              ),
            ),
            icons,
          ],
        ),
      ]),
    );
  }
}
