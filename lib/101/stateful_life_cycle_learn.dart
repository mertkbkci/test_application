import 'package:flutter/material.dart';

class StatefulLifeCycleLearn extends StatefulWidget {
  const StatefulLifeCycleLearn({super.key, required this.message});
  // valueyu müşteriden 1 defa alıcaksak buraya yazıyoruz

  final String message; //bu mesaj değiştirilemez bu mesaj dışardan geliyor

  @override
  State<StatefulLifeCycleLearn> createState() => _StatefulLifeCycleLearnState();
}

//Müşteri sana diyor ki ben bu sayfayı kullanırken sana bir tane value yollayacam sende bu sayfa açılırken o value yu kontrol et tekse tek yaz değilse çift yaz derse şöyle yapıyoruz

class _StatefulLifeCycleLearnState extends State<StatefulLifeCycleLearn> {
  String _message = '';
  late final bool _isOdd; //constructor anında değerini alacak diyorsan late koymalısın

  //Bir diğer yaşam döngüsü companentte ve initstateten sonra çalışır->
  //didChangeDependencies herhangi bir durumdan ötürü tekrar çağırılma durumu var
  //sayfanın içerisinde elementleriniz de veya widgetlarınız da içerisindeki state değeri komple update edildiğinde tekrardan çağırılıyor

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
     print('c');
  }

  //bir diğer companentimizde genelde az kullanılır
  //üst classtan çağırılarak gelen durumlardan bir tanesi

  @override
  void didUpdateWidget(covariant StatefulLifeCycleLearn oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.message != widget.message) {
      _message = widget.message;
      _computeName();
      setState(() {
        
      });
    }
  }

//sayfanızı yaptınız sayfadan çıkış yaptığınız andır yani sayfanın öldüğü andır
  @override
  void dispose() {
    super.dispose();
    _message = ""; //mesajı temizle, null et
  }

  //yaşam döngüsü initstate ->
  //init state aslında classların içindeki constructor methodlardır,
  //StatefulWidgetlar çizilmeye baslamadan önce başlayıp aslında çizilmeden ince biten yani initstate bittikten sonra build methodu çağırılıyor,
  //yani initstate içersinde logic yazdığınız yerde javayı güncelleyemez

  @override
  void initState() {
    super.initState();
    _message = widget.message;
    _isOdd = widget.message.length.isOdd;
    _computeName();
    print('a');
  }

  void _computeName() {
    if (_isOdd) {
      _message += " Tek";
    } else {
      _message += " Çift";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_message)

          /// _isOdd ? const Text('kelime tek') : const Text( 'kelime çift'), //messageye erişmek için witget.message kelime uzunluğu lenght '?' ise şunu yaz ':' veya bunu yaz
          ),
      //sonra müşteri şöyle dedi bir tane button kullancaz çiftse text button olcak tekse Elevated button olcak
      body: _isOdd
          ? TextButton(onPressed: () {}, child: Text(_message))
          : ElevatedButton(
              onPressed: () {
                setState(() {
                  _message = "a";
                });
              },
              child: Text(_message)),

      //sonra dediki bu data tek gelirse yanına bitişiğine tek yaz çirf gelirse çift yaz dediği noktaya yaşam döngüleri devreye giriyor ve bunlardan 1 tanesi initState
    );
  }
}
