import 'package:flutter/material.dart'; 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(centerTitle: true, title: Text('Profil Sayfası')),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(url),
                ),
              ),
              Text(
                'Musab Akan',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Software Developer',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),

              SizedBox(height: 24),

              Card(
                child: Row(
                  children: [
                    _buildItem('1.5k', 'Takipçi'),
                    _buildItem('2.5k', 'Takip'),
                    _buildItem('150', 'Gönderi'),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hakkımda',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'Flutter ile mobil geliştirmeyi seviyorum. Yeni teknolojileri öğrenmek en büyük hobim',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final String url =
      'https://media.licdn.com/dms/image/v2/D4D03AQFuiYKKxhzZcQ/profile-displayphoto-scale_200_200/B4DZreIcZ9H0AY-/0/1764663347407?e=1770854400&v=beta&t=iXDfcmkO40GhOHAJhGkfEHbtVGd6pM8pHS5Kj46Zwek';

  Widget _buildItem(String text1, String text2) {
    return Expanded(
      child: Column(
        children: [
          Text(
            text1,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(text2),
        ],
      ),
    );
  }
}
