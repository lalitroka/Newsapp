import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:practise/home/page/home_page.dart';
import 'package:practise/service/database/database_service.dart';
import 'package:practise/service/provider/news_provider.dart';
import 'package:provider/provider.dart';


class Savedfile extends StatefulWidget {
  const Savedfile({super.key});

  @override
  State<Savedfile> createState() => _SavedfileState();
}

class _SavedfileState extends State<Savedfile> {
  final DatabaseService _databaseService = DatabaseService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
         
           BookmarkWidget(
              ispressed: context.watch<NewsProvider>().isButtonPressed,
             onpressed: context.read<NewsProvider>().isBooMarked,
           ),

          Flexible(
            child: FutureBuilder(
                future: _databaseService.getNews(),
                builder: (context, snapshot) {
                  return ListView.separated(
                    scrollDirection: Axis.vertical,
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 5,
                      );
                    },
                    shrinkWrap: true,
                    itemCount: snapshot.data?.length ?? 1,
                    itemBuilder: (context, index) {
                      final article = snapshot.data![index];
                      return ListTile(
                        title: Text(article.title ?? 'No title',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text(article.author ?? 'No author',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        ),
                        leading: Container(
                                decoration: const  BoxDecoration(
                                  shape: BoxShape.circle, 
                                ),
                          child: CachedNetworkImage(
                            imageUrl: article.urlToImage ?? 'images/jungle.png',
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      
                      );
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }
}



