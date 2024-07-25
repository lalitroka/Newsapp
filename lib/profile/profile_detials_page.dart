import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:practise/api/modeldata.dart';

class ProfileDetail extends StatefulWidget {
  const ProfileDetail({super.key});
  @override
  State<ProfileDetail> createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {

  
  @override
  void initState() {
    super.initState();
    _loadCount();
  }

  late int likecount;
  late int favoritecount;
  late int commentcount;
  late int sharecount;
  
  

  // NewsModel? model;

  Future<void> _storeCount() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setInt('likecount', likecount);
    await pref.setInt('favoritecount', favoritecount);
    await pref.setInt('commentcount', commentcount);
    await pref.setInt('sharecount', sharecount);
  }

  Future<void> _loadCount() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      likecount = pref.getInt('likecount') ?? 100;
      sharecount = pref.getInt('sharecount') ?? 100;
      favoritecount = pref.getInt('favoritecount') ?? 100;
      commentcount = pref.getInt('commentcount') ?? 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    final argumentData = ModalRoute.of(context)?.settings.arguments as Articles;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {},
            child: const Text('Saved'),
          ),
          const SizedBox(
            width: 15,
          ),
        ],
        title: const Center(
          child: Text(
            'Happy Reading',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w100,
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: ListView.builder(
                              itemCount: 1,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pushNamed(
                                        '/photopage',
                                        arguments: argumentData.urlToImage,
                                      );
                                    },
                                    child: SizedBox(
                                      height: 200,
                                      width: double.infinity,
                                      child: Image.network(
                                        argumentData.urlToImage ?? '',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                );
                              })),
                      Positioned(
                        top: 10,
                        right: 25,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.grey.shade200,
                          ),
                          child: const Text(
                            'Environment',
                            style: TextStyle(
                                color: Color.fromARGB(255, 240, 107, 98)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListView.builder(
                            itemCount: 1,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(children: [
                                Text(
                                  argumentData.title ?? '',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(250),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).pushNamed(
                                            '/photopage',
                                            arguments: argumentData.urlToImage,
                                          );
                                        },
                                        child: Image.network(
                                          argumentData.urlToImage ?? '',
                                          height: 20,
                                          width: 20,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      argumentData.author ?? '',
                                      style: const TextStyle(
                                          fontSize: 12,
                                          // overflow: TextOverflow.ellipsis,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      argumentData.publishedAt ?? '',
                                      style: const TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 12,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  argumentData.description ?? '',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600),
                                ),
                              ]);
                            }),
                        const SizedBox(
                          height: 5,
                        ),
                        const SizedBox(height: 7),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // footer

          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: const Color.fromARGB(255, 241, 237, 237),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _storeCount();
                        setState(() {
                          likecount++;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(microseconds: 20),
                        width: 70,
                        height: 45,
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          color: Colors.white,
                        ),
                        child: Row(children: [
                          const Icon(
                            Icons.favorite_border_outlined,
                            size: 15,
                          ),
                          Text(
                            '$likecount',
                            style: const TextStyle(fontSize: 10),
                          ),
                        ]),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _storeCount();
                          favoritecount++;
                        });
                      },
                      child: Container(
                        width: 70,
                        height: 45,
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          color: Colors.white,
                        ),
                        child: Row(children: [
                          const Icon(
                            Icons.bookmark,
                            size: 15,
                          ),
                          Text(
                            '$favoritecount',
                            style: const TextStyle(fontSize: 10),
                          ),
                        ]),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _storeCount();
                        setState(() {
                          commentcount++;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(),
                        width: 70,
                        height: 45,
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          color: Colors.white,
                        ),
                        child: Row(children: [
                          const Icon(
                            Icons.comment_bank_outlined,
                            size: 15,
                          ),
                          Text(
                            '$commentcount',
                            style: const TextStyle(fontSize: 10),
                          ),
                        ]),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _storeCount();
                        setState(() {
                          sharecount++;
                        });
                      },
                      child: Container(
                        width: 75,
                        height: 45,
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          color: Colors.white,
                        ),
                        child: Row(children: [
                          const Icon(
                            Icons.share,
                            size: 15,
                          ),
                          Text(
                            '$sharecount',
                            style: const TextStyle(fontSize: 10),
                          ),
                        ]),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
