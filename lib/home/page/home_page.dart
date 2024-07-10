import 'package:flutter/material.dart';
import 'package:practise/home/model/newstype.dart';
import 'package:practise/home/widgets/homepage_widget.dart';
import 'package:practise/api/modeldata.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Homepage extends StatefulWidget {
  const Homepage({
    super.key,
  });

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: const  Drawerclass(),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          Container(
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
          const SizedBox(width: 5),
          Container(
            padding: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.shade200,
            ),
            child: const Icon(Icons.search, size: 20),
          ),
          const SizedBox(
            width: 15,
          )
        ],
        title: const Text(
          textAlign: TextAlign.left,
          "ANTUMN",
          style: TextStyle(
              fontSize: 20, color: Colors.red, fontWeight: FontWeight.w900),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.only(top: 5, left: 15),
        child: Column(children: [
          FutureBuilder<List<Articles>?>(
            future: fetchNews(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                return SizedBox(
                  height: 180,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            '/profile',
                            arguments: snapshot.data?[index],
                          );
                        },
                        child: Stack(children: [
                          SizedBox(
                            height: 180,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(17),
                              child: CachedNetworkImage(
                                imageUrl: '${snapshot.data?[index].urlToImage}',
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) =>
                                        CircularProgressIndicator(
                                            value: downloadProgress.progress),
                                errorWidget: (context, url, error) {
                                  snapshot.data?[index].urlToImage =
                                      'images/jungle.png';
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
                                        'enviroment',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 240, 107, 98)),
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
                                snapshot.data?[index].title ??
                                    'No subtitle here',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                                style: const TextStyle(color: Colors.white),
                              )),
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
                                        imageUrl:
                                            '${snapshot.data?[index].urlToImage}',
                                        progressIndicatorBuilder: (context, url,
                                                downloadProgress) =>
                                            CircularProgressIndicator(
                                                value:
                                                    downloadProgress.progress),
                                        errorWidget: (context, url, error) {
                                          snapshot.data?[index].urlToImage =
                                              'images/jungle.png';
                                          return const Image(
                                              image: AssetImage(
                                                  'images/jungle.png'));
                                        },
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    snapshot.data?[index].author ?? '',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'sans-serif',
                                        fontSize: 10,
                                        fontWeight: FontWeight.w100),
                                  ),
                                ],
                              ))
                        ]),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: 20,
                      );
                    },
                    itemCount: snapshot.data?.length ?? 0,
                  ),
                );
              }
            },
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(top: 0, left: 10),
            child: Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: SizedBox(
                    height: 30,
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final title = Newstype[index];
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
                        return const SizedBox(
                          width: 10,
                        );
                      },
                      itemCount: Newstype.length,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FutureBuilder<List<Articles>?>(
            future: fetchNews(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                return Flexible(
                  child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final articledata = snapshot.data?[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            '/profile',
                            arguments: articledata,
                          );
                        },
                        child: CoverImage(
                          bodytitle: Text(
                            articledata?.description ??
                                ' the description is not available',
                            maxLines: 2,
                          ),
                          subtitle: Text(
                            articledata?.publishedAt ??
                                'subtitle is not available',
                            maxLines: 1,
                          ),
                          title: Text(
                            articledata?.author ?? 'Mac  roy',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          smallImage: CachedNetworkImage(
                            imageUrl: '${articledata?.urlToImage}',
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) =>
                                    CircularProgressIndicator(
                                        value: downloadProgress.progress),
                            errorWidget: (context, url, error) {
                              articledata?.urlToImage = 'images/jungle.png';
                              return const Image(
                                  image: AssetImage('images/jungle.png'));
                            },
                            fit: BoxFit.cover,
                          ),
                          assetImage: CachedNetworkImage(
                            imageUrl: '${articledata?.urlToImage}',
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) =>
                                    CircularProgressIndicator(
                                        value: downloadProgress.progress),
                            errorWidget: (context, url, error) {
                              articledata?.urlToImage = 'images/jungle.png';
                              return const Image(
                                  image: AssetImage('images/jungle.png'));
                            },
                            fit: BoxFit.cover,
                          ),
                          icons: const Icon(Icons.bookmark_outline_outlined),
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(children: [
                  Icon(
                    Icons.home_rounded,
                    color: Color.fromARGB(255, 130, 70, 70),
                  ),
                  Text(
                    'Home',
                    style: TextStyle(
                      color: Color.fromARGB(255, 130, 70, 70),
                    ),
                  ),
                ]),
                Column(children: [
                  Icon(
                    Icons.explore_outlined,
                    color: Color.fromARGB(255, 130, 70, 70),
                  ),
                  Text(
                    'Discover',
                    style: TextStyle(
                      color: Color.fromARGB(255, 130, 70, 70),
                    ),
                  ),
                ]),
                Column(children: [
                  Icon(
                    Icons.bookmark_border,
                    color: Color.fromARGB(255, 130, 70, 70),
                  ),
                  Text(
                    'Saved',
                    style: TextStyle(
                      color: Color.fromARGB(255, 130, 70, 70),
                    ),
                  ),
                ]),
                Column(children: [
                  Icon(
                    Icons.person_2_outlined,
                    color: Color.fromARGB(255, 130, 70, 70),
                  ),
                  Text(
                    'Account',
                    style: TextStyle(
                      color: Color.fromARGB(255, 130, 70, 70),
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class Drawerclass extends StatefulWidget {
  const Drawerclass({
    super.key,
  });

  @override
  State<Drawerclass> createState() => _DrawerclassState();
}

class _DrawerclassState extends State<Drawerclass> {
  @override
  Widget build(BuildContext context) {
    // final  String userName =
    //     ModalRoute.of(context)!.settings.arguments as String;
    return Drawer(
      width: 200,
      child: ListView(padding: EdgeInsets.zero, children: [
        const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blueAccent,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('images/army.png'),
                ),
                SizedBox(height: 2),
                Text('userName'),
                Text('userName'),
              ],
            )),
        ListTile(
          title: const Text('message'),
          leading: const Icon(Icons.chat_bubble),
          onTap: () {},
        ),
        ListTile(
          title: const Text('message'),
          leading: const Icon(Icons.chat_bubble),
          onTap: () {},
        ),
        ListTile(
          title: const Text('message'),
          leading: const Icon(Icons.chat_bubble),
          onTap: () {},
        ),
        ListTile(
          title: const Text('message'),
          leading: const Icon(Icons.chat_bubble),
          onTap: () {},
        ),
      ]),
    );
  }
}
