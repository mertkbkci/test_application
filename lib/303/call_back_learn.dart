// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_application/product/widget/button/answer_button.dart';
import 'package:test_application/product/widget/button/loading_button.dart';

import '../product/widget/callback_dropdown.dart';

class CallBackLearn extends StatefulWidget {
  const CallBackLearn({super.key});

  @override
  State<CallBackLearn> createState() => _CallBackLearnState();
}

class _CallBackLearnState extends State<CallBackLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CallBackDropdown(
            onUserSelected: (CallbackUser user) {
              if (kDebugMode) {
                print(user);
              }
            },
          ),
          AnswerButton(
            onNumber: (int number) {
              return number % 3 == 1;
            },
          ),
          Center(
            child: LoadingButton(
                title: 'save',
                onPressed: () async {
                  await Future.delayed(const Duration(seconds: 2), () {});
                }),
          )
        ],
      ),
    );
  }
}

class CallbackUser {
  final String name;
  final int id; //crash olduğunda generate quality yap

  CallbackUser(this.name, this.id);

//TODO Dummy Remove it
  static List<CallbackUser> dummyUsers() {
    return [
      CallbackUser('mk', 123),
      CallbackUser('mk1', 1234),
    ];
  }

  @override
  bool operator ==(covariant CallbackUser other) {
    if (identical(this, other)) return true;

    return other.name == name && other.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ id.hashCode;
}
