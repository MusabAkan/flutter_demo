import 'package:flutter/material.dart';

class ResimWidgetlari extends StatelessWidget {
  const ResimWidgetlari({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resim Widgetleri"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Image.asset(
                    'assets/images/doğa_1.jpeg',
                    fit: BoxFit.cover,
                  ),
                  width: 150,
                  height: 150,
                  color: Colors.blue.shade300,
                ),
                Container(
                  child: Image.asset(
                    'assets/images/yuki-iadori.jpg',
                    fit: BoxFit.cover,
                  ),
                  width: 150,
                  height: 150,
                  color: Colors.blue.shade300,
                ),
              ],
            ),
            FadeInImage.assetNetwork(
              placeholder: 'assets/images/yuki-iadori.jpg',
              image:
                  'https://avatars.mds.yandex.net/i?id=130c41a667170b39bb3242558f31827984d59752-4259279-images-thumbs&n=13',
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://avatars.mds.yandex.net/i?id=130c41a667170b39bb3242558f31827984d59752-4259279-images-thumbs&n=13',
                      ),
                      radius: 50,
                    ),
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://avatars.mds.yandex.net/i?id=130c41a667170b39bb3242558f31827984d59752-4259279-images-thumbs&n=13',
                      ),
                      radius: 40,
                    ),
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://avatars.mds.yandex.net/i?id=130c41a667170b39bb3242558f31827984d59752-4259279-images-thumbs&n=13',
                      ),
                      radius: 30,
                    ),
                
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://avatars.mds.yandex.net/i?id=130c41a667170b39bb3242558f31827984d59752-4259279-images-thumbs&n=13',
                      ),
                      radius: 20,
                    ),
                     CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://avatars.mds.yandex.net/i?id=130c41a667170b39bb3242558f31827984d59752-4259279-images-thumbs&n=13',
                      ),
                      radius: 10,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
