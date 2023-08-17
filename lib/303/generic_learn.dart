// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class UserManagement<T extends AdminUser> {
  final T admin;

  UserManagement(this.admin);
  void sayName(GenericUser user) {
    if (kDebugMode) {
      print(user.name);
    }
  }

  int calculateMoney(List<GenericUser> users) {
    int sum = 0;
    for (var item in users) {
      sum += item.money;
    }

    int initialValue = admin.role == 1 ? admin.money : 0;

    final sumMoney =
        users.map((e) => e.money).fold<int>(initialValue, (previousValue, element) => previousValue + element);

    final money = users.fold<int>(initialValue, (previousValue, element) => previousValue + element.money);
    return money;
  }

  Iterable<String> showNames(List<GenericUser> users) {
    //bunu sadece rol 1 olanlar
    final names = users.map((e) => e.name);
 
    return names;
     }
}

class GenericUser extends Equatable {
  final String name;
  final String id;
  final int money;

  const GenericUser(this.name, this.id, this.money);

  bool findUserName(String name) {
    return this.name == name;
  }

  @override
  String toString() => 'GenericUser(name: $name, id: $id, money: $money)';
  
  @override
  // TODO: implement props
  List<Object?> get props =>  [name, id, money];
}

class AdminUser extends GenericUser {
  final int role;
  AdminUser(String name, String id, int money, this.role) : super(name, id, money);
}
