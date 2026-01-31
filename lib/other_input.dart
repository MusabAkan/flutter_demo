import 'package:flutter/material.dart';

class OtherInputState extends StatefulWidget {
  const OtherInputState({super.key});

  @override
  State<OtherInputState> createState() => _OtherInputStateState();
}

class _OtherInputStateState extends State<OtherInputState> {
  bool _isChecked = false;
  bool _isCheckedForRadio = true;
  String _secilenSehir = 'Ankara';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Radio<String>(
              value: 'Ankara',
              groupValue: _secilenSehir,
              onChanged: (value) {
                setState(() {
                  _secilenSehir = value!;
                });
              },
            ),
            Text("Ankara"),
            Radio<String>(
              value: 'İzmit',
              groupValue: _secilenSehir,
              onChanged: (value) {
                setState(() {
                  _secilenSehir = value!;
                });
              },
            ),
            Text('İzmir'),
            Expanded(
              child: RadioListTile<String>(
                value: 'Bursa',
                title: const Text('Title Değeri'),
                subtitle: const Text('Subtitle Değeri'),
                groupValue: _secilenSehir,
                onChanged: (value) {
                  setState(() {
                    _secilenSehir = value!;
                  });
                },
              ),
            ),
            Text('Bursa'),
          ],
        ),

        Row(
          children: [
            Expanded(
              child: SwitchListTile(
                title: const Text('Title Değeri'),
                subtitle: const Text('Subtitle Değeri'),
                value: _isCheckedForRadio,
                onChanged: (value) {
                  setState(() {
                    _isCheckedForRadio = value;
                  });
                },
              ),
            ),
          ],
        ),

        const Divider(),

        Row(
          children: [
            Switch(
              value: _isCheckedForRadio,
              onChanged: (value) {
                setState(() {
                  _isCheckedForRadio = value;
                });
              },
            ),
            const Text("Bildirimleri Aç"),
          ],
        ),

        // Checkbox ve Text kullanımı
        Row(
          children: [
            Checkbox(
              value: _isChecked,
              onChanged: (value) {
                setState(() {
                  _isChecked = value ?? false;
                });
              },
            ),
            const Text('Anlaşmayı kabul ettin'),
          ],
        ),

        const Divider(),
        CheckboxListTile(
          secondary: const Icon(Icons.add),
          title: const Text('Title Değeri'),
          subtitle: const Text('Subtitle Değeri'),
          value: _isChecked,
          onChanged: (value) {
            setState(() {
              _isChecked = value ?? false;
            });
          },
        ),
      ],
    );
  }
}
