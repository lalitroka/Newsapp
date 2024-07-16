import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.only(left: 10, right: 5),
      child: Row(
        children: [
          SizedBox(
            height: 80,
            width: 80,
            child: ClipRRect(
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.circular(20),
              child: assetImage,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 20,
                      width: 20,
                      child: ClipRRect(
                        clipBehavior: Clip.hardEdge,
                        borderRadius: BorderRadius.circular(50),
                        child: smallImage,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: DefaultTextStyle.merge(
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 11,
                            fontFamily: 'sans-serif',
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                        child: title,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 3),
                DefaultTextStyle.merge(
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                  child: bodytitle,
                ),
                const SizedBox(
                  height: 4,
                ),
                DefaultTextStyle.merge(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 11, fontFamily: 'Times New'),
                  child: subtitle,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 25,
          ),
          icons,
        ],
      ),
    );
  }
}
