import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:practise/home/model/newstype.dart';
import 'package:practise/home/page/savedfile.dart';
import 'package:practise/home/widgets/homepage_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:practise/model/savenews.dart';
import 'package:practise/service/database/database_service.dart';
import 'package:practise/service/provider/news_provider.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'profile',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout_outlined),
              onTap: () async {
                GoogleSignIn().signOut();
                FirebaseAuth.instance.signOut();
              },
              title: const Text('Log Out'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        actions: [
          Consumer<NewsProvider>(
            builder: (context, value, child) {
              return BookmarkWidget(
                ispressed: value.isButtonPressed,
                onpressed: value.isBooMarked,
              );
            },
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/notificationpage');
            },
            child: Container(
              padding: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade200,
              ),
              child: const Icon(
                Icons.notifications_outlined,
                size: 20,
              ),
            ),
          ),
          const SizedBox(width: 5),
          Container(
            padding: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.shade200,
            ),
            child: const Icon(Icons.search, size: 20),
          ),
          const SizedBox(width: 15),
        ],
        title: const Text(
          "ANTUMN",
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 20,
            color: Colors.red,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 5, left: 15),
              child: Column(
                children: [
                  topViewOfHomepage(),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(top: 0, left: 10),
                    child: SizedBox(
                      height: 30,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final title = newstype[index];
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                height: 30,
                                width: 100,
                                color: Colors.grey.shade200,
                                child: Center(
                                  child: Text(
                                    title.buttonText,
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 130, 70, 70),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(width: 10);
                        },
                        itemCount: newstype.length,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // newslist Center
                  centerNewsList(),
                ],
              ),
            ),
          ),

          // Footer Section
          bottonBar(context),
        ],
      ),
    );
  }

  Align bottonBar(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 60,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                children: [
                  Icon(
                    Icons.home_rounded,
                    color: Color.fromARGB(255, 130, 70, 70),
                  ),
                  Text(
                    'Home',
                    style: TextStyle(color: Color.fromARGB(255, 130, 70, 70)),
                  ),
                ],
              ),
              const Column(
                children: [
                  Icon(
                    Icons.explore_outlined,
                    color: Color.fromARGB(255, 130, 70, 70),
                  ),
                  Text(
                    'Discover',
                    style: TextStyle(color: Color.fromARGB(255, 130, 70, 70)),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Savedfile(),
                    ),
                  );
                },
                child: const Column(
                  children: [
                    Icon(
                      Icons.bookmark_border,
                      color: Color.fromARGB(255, 130, 70, 70),
                    ),
                    Text(
                      'Saved',
                      style: TextStyle(color: Color.fromARGB(255, 130, 70, 70)),
                    ),
                  ],
                ),
              ),
              const Column(
                children: [
                  Icon(
                    Icons.person_2_outlined,
                    color: Color.fromARGB(255, 130, 70, 70),
                  ),
                  Text(
                    'Account',
                    style: TextStyle(color: Color.fromARGB(255, 130, 70, 70)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Consumer<NewsProvider> centerNewsList() {
    return Consumer<NewsProvider>(
      builder: (BuildContext __, newsProvider, Widget? _) {
        if (newsProvider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (newsProvider.articles.isEmpty) {
          return const Center(child: Text('No articles available'));
        } else {
          return ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            shrinkWrap: true,
            itemCount: newsProvider.articles.length,
            itemBuilder: (context, index) {
              final articledata = newsProvider.articles[index];
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/profile',
                    arguments: articledata,
                  );
                },
                child: CoverImage(
                  bodytitle: Text(
                    articledata.description ??
                        'The description is not available',
                    selectionColor: Colors.red,
                    maxLines: 2,
                  ),
                  subtitle: Text(
                    articledata.publishedAt ?? 'Subtitle is not available',
                    selectionColor: Colors.red,
                    maxLines: 1,
                  ),
                  title: Text(
                    articledata.author ?? 'Unknown author',
                    selectionColor: Colors.red,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  smallImage: CachedNetworkImage(
                    imageUrl: articledata.urlToImage ?? 'images/jungle.png',
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress),
                    errorWidget: (context, url, error) {
                      return const Image(
                          image: AssetImage('images/jungle.png'));
                    },
                    fit: BoxFit.cover,
                  ),
                  assetImage: CachedNetworkImage(
                    imageUrl: articledata.urlToImage ?? 'images/jungle.png',
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress),
                    errorWidget: (context, url, error) {
                      return const Image(
                          image: AssetImage('images/jungle.png'));
                    },
                    fit: BoxFit.cover,
                  ),
                  icons: InkWell(
                    onTap: () async {
                      final data = NewsDbModel(
                        id: index,
                        author: articledata.author,
                        title: articledata.title,
                        description: articledata.description,
                        urlToImage: articledata.urlToImage,
                        publishedAt: articledata.publishedAt,
                      );
                      await DatabaseService().insertNews(data);
                    },
                    child: const Icon(Icons.bookmark_add_outlined),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }

  Consumer<NewsProvider> topViewOfHomepage() {
    return Consumer<NewsProvider>(
      builder: (BuildContext __, newsProvidervalue, Widget? _) {
        if (newsProvidervalue.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (newsProvidervalue.articles.isEmpty) {
          return const Center(child: Text('No articles available'));
        } else {
          return SizedBox(
            height: 180,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return const SizedBox(width: 20);
              },
              itemCount: newsProvidervalue.articles.length,
              itemBuilder: (context, index) {
                final articledata = newsProvidervalue.articles[index];
                // log(" article data : ${articledata.description.toString()}");
                log(articledata.title.toString());
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      '/profile',
                      arguments: articledata,
                    );
                  },
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 180,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(17),
                          child: CachedNetworkImage(
                            imageUrl: '${articledata.urlToImage}',
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) =>
                                    CircularProgressIndicator(
                                        value: downloadProgress.progress),
                            errorWidget: (context, url, error) {
                              articledata.urlToImage = 'images/jungle.png';
                              return const Image(
                                  image: AssetImage('images/jungle.png'));
                            },
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 55,
                        left: 10,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 25,
                              color: Colors.grey.shade200,
                              child: const Padding(
                                padding: EdgeInsets.only(left: 8, right: 8),
                                child: Center(
                                  child: Text(
                                    'environment',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 240, 107, 98),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 87,
                        left: 10,
                        right: 30,
                        child: Text(
                          articledata.title ?? 'No subtitle here',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      Positioned(
                        top: 150,
                        left: 10,
                        child: Row(
                          children: [
                            SizedBox(
                              height: 20,
                              width: 20,
                              child: ClipRRect(
                                clipBehavior: Clip.hardEdge,
                                borderRadius: BorderRadius.circular(50),
                                child: CachedNetworkImage(
                                  imageUrl: '${articledata.urlToImage}',
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) =>
                                          CircularProgressIndicator(
                                              value: downloadProgress.progress),
                                  errorWidget: (context, url, error) {
                                    articledata.urlToImage =
                                        'images/jungle.png';
                                    return const Image(
                                        image: AssetImage('images/jungle.png'));
                                  },
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              articledata.author ?? '',
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'sans-serif',
                                fontSize: 10,
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}

class BookmarkWidget extends StatelessWidget {
  const BookmarkWidget(
      {super.key, required this.ispressed, required this.onpressed});

  final bool ispressed;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onpressed,
      child: Icon(ispressed ? Icons.bookmark : Icons.bookmark_add_outlined),
    );
  }
}
