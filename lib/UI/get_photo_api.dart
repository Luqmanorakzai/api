import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/photo_api/photo_provider.dart';
class PhotoApis extends StatefulWidget {
  const PhotoApis({super.key});
  @override
  State<PhotoApis> createState() => _PhotoApisState();
}
class _PhotoApisState extends State<PhotoApis> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PhotoProvider(),
      child: Consumer<PhotoProvider>(
        builder: (context, model, child) => Scaffold(
          // backgroundColor: AppColors.bgtColor,
          appBar: AppBar(
            backgroundColor: Colors.amber,
            centerTitle: true,
            title: const Text('photos'),
          ),
          body: Column(
            children: [
              FutureBuilder(
                future: model.getPhotoData(),
                builder: (context, snapshot) {
                  return Expanded(
                      child: ListView.builder(
                        itemCount: model.photosList.length,
                        // itemCount: model.snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text('${model.photosList[index].title}'),
                            subtitle: Image.network(
                                fit: BoxFit.cover,
                                '${model.photosList[index].url}'
                            ),
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
