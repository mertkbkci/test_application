import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBarLearnView extends StatelessWidget {
  const AppBarLearnView({super.key});
  final String _title = 'Welcome';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),centerTitle: true,
        leading: const Icon(Icons.chevron_left, size: 30),//appbarın sol tarafını kullannır
        backgroundColor: Colors.transparent,//backgrarundcolor olmayacak demek
        elevation: 0, //Sayfayı birebir tasarımmış gibi gösterir
        systemOverlayStyle: SystemUiOverlayStyle.light, //saat şarj yeri vs aladındaki yazıları iconları aydınlatır, statüs bar
        leadingWidth: 23, //sola yakınlığını ayarlar
        automaticallyImplyLeading: false,//back butonunun otomatik gelmesini engeller
        // actionsIconTheme: const IconThemeData(color:Colors.red,size: 30), -> //sağ taraftaki icon özelleştirmeleri
        actions:[//appbarın sağ tarafını kullanır
        IconButton(
          onPressed: () {}, 
          icon: const Icon(Icons.menu),
        ),
        const Center(child: CircularProgressIndicator(),//servise istekleri internete çıkcaz internetten gelcez falan prograsif bbar gibi genelde centerla kullanırız
        )
       ],
      ),
     
       
    );
  }
}
