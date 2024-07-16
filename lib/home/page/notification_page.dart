import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notification',
          textAlign: TextAlign.center,
        ),
      ),
      body: FutureBuilder(
          future: getNotification(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: ListTile(
                      leading: Text('$FlutterLogo'),
                      title: const Text('data'),
                      subtitle: const Text('data'),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const  SizedBox(
                    height: 5,
                  );
                },
              );
            }
            return const Text(
              'something went wrong',
              textAlign: TextAlign.center,
            );
          }),
    );
  }
}

getNotification() {}
