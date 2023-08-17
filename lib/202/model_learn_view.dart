import 'package:flutter/material.dart';

import 'model_learn.dart';

class ModelLearnView extends StatefulWidget {
  const ModelLearnView({super.key});

  @override
  State<ModelLearnView> createState() => _ModelLearnViewState();
}

class _ModelLearnViewState extends State<ModelLearnView> {
  var user9 = PostModel8(body: 'a');

  @override
  void initState() {
    super.initState();

    final user1 = PostModel1()
      ..userId = 1
      ..body = 'vb';
    user1.body = 'hello';

    final user2 = PostModel2(
      1,
      2,
      'a',
      'b',
    );
    user2.body = 'b';

    final user3 = PostModel3(
      1,
      2,
      'a',
      'b',
    );
    //user3.body = 'b';

    //lokalden data çekiyorsan bu yöntem daha iyi
    final user4 = PostModel4(
      userId: 1,
      id: 2,
      title: 'a',
      body: 'b',
    );
    // user4.body = 'b';
    final user5 = PostModel5(
      userId: 1,
      id: 2,
      title: 'a',
      body: 'b',
    );
    user5.userId;

    final user6 = PostModel6(
      userId: 1,
      id: 2,
      title: 'a',
      body: 'b',
    );
    final user7 = PostModel7(); //default alır

    //service
    final user8 = PostModel8(body: 'b');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          user9 = user9.copyWith(title: 'vb');
          user9.updateBody('mert');
        });
      }),
      appBar: AppBar(
        title: Text(user9.body ?? 'Not has any data'), //bir değer varsa onu yazdır yoksa bunu yazdır demek
      ),
    );
  }
}
