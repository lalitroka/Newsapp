import 'package:flutter/material.dart';
import 'package:practise/home/model/admindata.dart';
import 'package:practise/home/model/dataofuser.dart';
import 'package:practise/home/widgets/homepage_widget.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
    @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          padding: const EdgeInsets.only(top:0, left: 10 ),
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
                          child:  Center(
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

      const  SizedBox( height: 2,),
        Flexible(
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return   GestureDetector (
                onTap: () {
                  Navigator.of(context).pushNamed('/profile',
                    arguments: users[index],
                  );
                },
                child: CoverImage(
                    title: Text(users[index].title),
                    bodytitle: Text(
                      users[index].bodytitle,
                      maxLines: 2,
                    ),
                    subtitle: Text(users[index].subtitle),
                    smallImage:
                        Image(image: AssetImage(users[index].smallImage)),
                  
                    assetImage:
                        Image(image: AssetImage(users[index].assetImage)),
                    icons: const Icon(Icons.abc)),
              );
            },
            itemCount: users.length,
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(height: 1);
            },
          ),
        ),
      const  Padding(
          padding:  EdgeInsets.only(left: 10, right: 10),
          child:  Row(
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
