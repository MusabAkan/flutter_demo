import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/photo_model.dart';

class DioUsingBuilder extends StatelessWidget {
  const DioUsingBuilder({super.key});
  Future<List<Photo>> _getPhotos() async {
    try {
      final dio = Dio();
      final url = 'https://jsonplaceholder.typicode.com/photos';

      final response = await dio.get(
        url,
        options: Options(
          validateStatus: (status) => status! < 500,
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'User-Agent': 'Mozilla/5.0',
          },
        ),
      );
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        final List<Photo> photoList = data
            .map((toElement) => Photo.fromJson(toElement))
            .toList();
        return photoList;
      } else {
        return [];
      }
    } on DioException catch (e) {
      return Future.error(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    _getPhotos();
    return FutureBuilder(
      future: _getPhotos(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var photoList = snapshot.data!;

          return ListView.builder(
            itemBuilder: (context, index) {
              var currentElement = photoList[index];
              return ExpansionTile(
                trailing: CircleAvatar(child: Image.network(currentElement.thumbnailUrl),),
                leading: CircleAvatar(
                  child: Text(currentElement.albumId.toString()),
                ),
                title: Text(currentElement.title),
                children: [
                  Image.network(currentElement.thumbnailUrl)
                ],
              );
            },
            itemCount: photoList.length,
          );
        } else if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
