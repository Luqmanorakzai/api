import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/postman_api/postman_provider.dart';
class GetPostmanScreen extends StatefulWidget {
  const GetPostmanScreen({super.key});

  @override
  State<GetPostmanScreen> createState() => _GetPostmanScreenState();
}

class _GetPostmanScreenState extends State<GetPostmanScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PostmanProvider(),
      child: Consumer<PostmanProvider>(
        builder: (context, model, child) => Scaffold(
          // backgroundColor: AppColors.bgtColor,
          body: Column(
            children: [
              FutureBuilder(
                future: model.getPostData(),
                builder: (context, snapshot) {
                  return Expanded(
                      child: ListView.builder(
                    itemCount: model.postList.length,
                    // itemCount: model.snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('${model.postList[index].title}'),
                        subtitle: Text('${model.postList[index].body}'),
                        // subtitle: Text('${model.snapshot[index].body}'),
                      );
                    },
                  ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
