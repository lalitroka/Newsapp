import 'package:flutter/material.dart';
import 'package:practise/home/model/admindata.dart';
import 'package:practise/home/widgets/homepage_widget.dart';
import 'package:practise/api/modeldata.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

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
      drawer: const Drawerclass(),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        actions: const [
          Icon(Icons.notification_add),
          Icon(Icons.search),
        ],
        title: const Text(
          "AUTUM",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Column(children: [
        Flexible(
          fit: FlexFit.loose,
          child: Row(
            children: [
              Flexible(
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return const TopCoverImage(
                      mainImage: Image(
                        image: AssetImage('images/mountain.png'),
                        fit: BoxFit.cover,
                      ),
                      iconText: Text(
                        'element',
                        textAlign: TextAlign.center,
                      ),
                      mainText: Text(
                        'hello i am from nepal our country is the richest and happiest country in the world',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      mainIcon: Image(
                        image: AssetImage('images/army.png'),
                        fit: BoxFit.cover,
                      ),
                      name: Text(
                        'mina agrawal',
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 20,
                    );
                  },
                  itemCount: 6,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 1),
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
                      final title = admindata[index];
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                          height: 30,
                          width: 100,
                          color: Colors.yellow,
                          child: Center(
                            child: Text(title.buttonText),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: 10,
                      );
                    },
                    itemCount: admindata.length,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 2,
        ),
        Flexible(
          child: FutureBuilder<List<Articles>?>(
            future: fetchNews(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final articledata = snapshot.data?[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacementNamed(
                          '/profile',
                          arguments: articledata,
                        );
                      },
                      child: CoverImage(
                        title: Text(articledata?.author ?? 'Mac  roy'),
                        bodytitle: Text(
                          articledata?.description ??
                              ' the description is not available',
                          maxLines: 2,
                        ),
                        subtitle: Text(
                            articledata?.title ?? 'subtitle is not available'),

                        smallImage: CachedNetworkImage(
                          imageUrl: '${articledata?.urlToImage}',
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) =>
                                  CircularProgressIndicator(
                                      value: downloadProgress.progress),
                          errorWidget: (context, url, error) {
                            articledata?.urlToImage = 'images/army.png';
                            return const Image(
                                image: AssetImage('images/army.png'));
                          },
                        ),

                        //  Image.network(
                        //     ("${snapshot.data?[index].urlToImage ?? const Image(image: AssetImage('images.army.png'))} ")),

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
                        ),

                        //  Image.network(
                        //           ("${snapshot.data?[index].urlToImage ??  const Image(image: AssetImage('images.army.png')) } ")),

                        icons: const Icon(Icons.abc),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(children: [
                Icon(Icons.home),
                Text('home'),
              ]),
              Column(children: [
                Icon(Icons.discord),
                Text('discover'),
              ]),
              Column(children: [
                Icon(Icons.favorite),
                Text('saved'),
              ]),
              Column(children: [
                Icon(Icons.account_balance_rounded),
                Text('account'),
              ]),
            ],
          ),
        ),
      ]),
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
    final  String userName =
        ModalRoute.of(context)!.settings.arguments as String;
    return Drawer(
      width: 200,
      child: ListView(padding: EdgeInsets.zero, children: [
        DrawerHeader(
          
            decoration: const BoxDecoration(
              color: Colors.blueAccent,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('images/army.png'),
                ),
                const SizedBox(height: 2),
                Text(userName),
                Text(userName),
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
