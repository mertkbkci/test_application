import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_application/202/widget/card/high_card.dart';
import 'package:test_application/303/generic_learn.dart';

void main() {
  setUp(() {});

  test('List best of', () {
    List<GenericUser> users = [
      const GenericUser('mert', '10', 5),
      const GenericUser('mehmet', '11', 127),
      const GenericUser('ahmet', '12', 113),
    ];
    List<HighCard> highCards = users.map((e) {
      //maplemenin amacı her bir elemanı dönüştürmek
      return HighCard(
        items: [e.name.split('').toString()],
      );
    }).toList();

    try {
      final response = users.singleWhere((element) => element.findUserName('mert'), orElse: () {
        return const GenericUser('name', 'id', 15);
      });
      if (kDebugMode) {
        print(response.name);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    if (kDebugMode) {
      print('${users.where((element) => element.money > 10)}');
    }

    users.take(5); //içlerinden 5 tanesini almak istiyorsan
    users.remove(const GenericUser('mert', '10', 5)); //mert idli kullanıcıyı silmek istiyorsan
    users.removeAt(2);
    users.removeWhere((element) => element.money > 10);

    users.indexOf(const GenericUser('mert', '10', 5)); //mert idli kullanıcının indexini bulmak istiyorsan
    final result = users.indexWhere((element) => element.money > 10);

    if (result >= 0) {
      users[result] = const GenericUser('a', 'b', 55);
    }
    users.expand((element) => [GenericUser('name', 'id', 22)]).toList();  //users listesine yeni bir liste entegre etmek istiyorsna
    // users.map((e) => e.money).toList(); //sadece paraları almak istiyorsan
  });

  test('List best of with collection', () {
    List<GenericUser> users = [
      const GenericUser('mert', '10', 5),
      const GenericUser('mehmet', '11', 127),
      const GenericUser('ahmet', '12', 113),
    ];

    final response = users.singleWhereOrNull(
      (element) => element.findUserName('mert'),
    );

    users.lastWhereOrNull((element) => element.id == '10');

    users.lastOrNull;
    users.forEachIndexed((index, element) {});
    users.sample( 2);//listenin içerisinden bir tane eleman seçmek istiyorsan ve kaç tane istiyorsan
   

    if (kDebugMode) {
      print(response);
    }
  });
}
