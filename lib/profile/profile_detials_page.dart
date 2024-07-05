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
  }

  @override
  Widget build(BuildContext context) {
    final argumentData = ModalRoute.of(context)?.settings.arguments as Articles;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
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
                          padding: const EdgeInsets.only(left: 10, right: 10),
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
                                    child: Image.network(
                                      argumentData.urlToImage ?? '',
                                      height: 150,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              })),
                      Positioned(
                        right: 10,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.white70),
                          child: const Text('Environment'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListView.builder(
                            itemCount: 1,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(children: [
                                Text(argumentData.title ?? ''),
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
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(argumentData.description ?? ''),
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
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50, bottom: 10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: const Color.fromARGB(58, 227, 215, 215),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 1,
                  ),
                  Icon(Icons.heat_pump_rounded),
                  Icon(Icons.comment_bank_outlined),
                  Icon(Icons.favorite_border_outlined),
                  Icon(Icons.share_outlined),
                  SizedBox(
                    width: 1,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
