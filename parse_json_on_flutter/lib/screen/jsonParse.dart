import 'package:flutter/material.dart';
import 'package:parse_json_on_flutter/model/user.dart';
import 'package:parse_json_on_flutter/service/service.dart';

class JsonParse extends StatefulWidget {
  const JsonParse({super.key});

  @override
  State<JsonParse> createState() => _JsonParseState();
}

class _JsonParseState extends State<JsonParse> {
  List<User> _user = <User>[];
  bool _loading = false;

  @override
  void initState() {
    Service.getInfo().then((value) {
      setState(() {
        _user = value;
        _loading = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_loading ? "User" : "Loading..."),
      ),
      body: ListView.builder(
        itemCount: _user.length,
        itemBuilder: (context, idx) {
          User user = _user[idx];
          return ListTile(
            leading: const Icon(
              Icons.account_circle_rounded,
              color: Colors.blue,
            ),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(user.name),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("id : ${user.id}"),
                          Text("name : ${user.name}"),
                          Text("username : ${user.username}"),
                          Text("email : ${user.email}"),
                          Text("phone : ${user.phone}"),
                          Text("website : ${user.website}"),
                          const SizedBox(height: 15),
                          Text(user.address.street),
                          Text(user.address.suite),
                          Text(user.address.city),
                          Text(user.address.zipcode),
                          const SizedBox(height: 30),
                          Text(user.company.name),
                          Text(user.company.catchPhrase),
                          Text(user.company.bs),
                          const SizedBox(height: 15),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("close"),
                          )
                        ],
                      ),
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.dehaze_outlined,
                color: Colors.grey,
              ),
            ),
            title: Text(user.name),
            subtitle: Text(user.email),
            shape: const Border(
              bottom: BorderSide(
                color: Colors.grey,
                width: 1,
              ),
            ),
          );
        },
      ),
    );
  }
}
