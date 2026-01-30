import 'package:flutter/material.dart';

class DropDownPopup extends StatelessWidget {
  const DropDownPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdown ve Popup'),
        actions: [PopupMenuKullanimi()],
        backgroundColor: Colors.blueAccent.shade100,
      ),

      body: Center(
        child: Column(
          children: [DropDwonButtonKullanimi(), PopupMenuKullanimi()],
        ),
      ),
    );
  }
}

class DropDwonButtonKullanimi extends StatefulWidget {
  const DropDwonButtonKullanimi({super.key});

  @override
  State<DropDwonButtonKullanimi> createState() =>
      _DropDwonButtonKullanimiState();
}

final _sehirler = ['Ankara', 'Bursa', 'İstanbul', 'İzmir', 'Rize'];

class _DropDwonButtonKullanimiState extends State<DropDwonButtonKullanimi> {
  var _secilenSehir = null;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: Text('Şehir Seçin'),
      value: _secilenSehir,
      //items: [
      //DropdownMenuItem(child: Text('İstanbul'), value: 'İstanbul'),
      //DropdownMenuItem(child: Text('Ankara'), value: 'Ankara'),
      //DropdownMenuItem(child: Text('Rize'), value: 'Rize'),
      //DropdownMenuItem(child: Text('Çanakkale'), value: 'Çanakkale'),

      //],
      items: _sehirler
          .map(
            (String sehir) =>
                DropdownMenuItem(child: Text(sehir), value: sehir),
          )
          .toList(),
      onChanged: (String? value) {
        debugPrint('seçilen şehir $value');
        setState(() {
          _secilenSehir = value!;
        });
      },
    );
  }
}

class PopupMenuKullanimi extends StatefulWidget {
  const PopupMenuKullanimi({super.key});

  @override
  State<PopupMenuKullanimi> createState() => _PopupMenuKullanimiState();
}

class _PopupMenuKullanimiState extends State<PopupMenuKullanimi> {
  var _secilenSehir = 'Ankara';
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      initialValue: _secilenSehir,
      //icon: Icon(Icons.add),
      //child: Text(_secilenSehir),
      itemBuilder: (context) {
        return _sehirler.map((String sehir) {
          return PopupMenuItem(child: Text(sehir), value: sehir);
        }).toList();
      },
      onSelected: (value) => setState(() {
        _secilenSehir = value;
      }),
    );
  }
}
