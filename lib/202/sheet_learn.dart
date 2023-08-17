import 'package:flutter/material.dart';

class SheetLearn extends StatefulWidget {
  const SheetLearn({super.key});

  @override
  State<SheetLearn> createState() => _SheetLearnState();
}

class _SheetLearnState extends State<SheetLearn> {
  Color _backgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sheet Learn'),
      ),
      backgroundColor: _backgroundColor,
      floatingActionButton: FloatingActionButton.large(
        onPressed: () async {
          final result = await showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              isScrollControlled: true,
              builder: (context) {
                return _CustomSheet(backgroundColor: _backgroundColor);
              });
          // inspect(result); debugsız kontrol

          if (result is bool) {
            setState(() {
              _backgroundColor = Colors.cyan;
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _CustomSheet extends StatefulWidget {
  const _CustomSheet({
    Key? key,
    required Color backgroundColor,
  }) : super(key: key);

  @override
  State<_CustomSheet> createState() => _CustomSheetState();
}

class _CustomSheetState extends State<_CustomSheet> {
  Color _backgroundColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 24,
              child: Stack(
                children: [
                  Divider(
                    thickness: 4,
                    indent: MediaQuery.of(context).size.width * 0.35,
                    endIndent: MediaQuery.of(context).size.width * 0.35,
                    color: Colors.grey,
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      alignment: Alignment.topCenter,
                      onPressed: () {
                        Navigator.of(context).pop<bool>(false);
                      },
                      icon: const Icon(Icons.close),
                    ),
                  )
                ],
              ),
            ),
            const Text('data'),
            Image.network(
              'https://media.istockphoto.com/id/1301066601/tr/foto%C4%9Fraf/g%C3%BCne%C5%9Fli-g%C3%BCnde-efesteki-celsus-antik-k%C3%BCt%C3%BCphanesinin-cephesi.jpg?s=612x612&w=is&k=20&c=T7XV_y07kQksZ2WkCvWc0kguSljS6qyzRU7iFl6n9jM=',
              height: 200,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _backgroundColor = Colors.amber;
                  });
                  Navigator.of(context).pop<bool>(true);
                },
                child: const Text('OK'))
          ],
        ),
      ),
    );
  }
}
