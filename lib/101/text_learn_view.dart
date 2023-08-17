import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextLearnView extends StatelessWidget {
   TextLearnView({Key? key, this.userName}) : super(key: key);
  final String name = 'Mert';
  final String? userName;
  final ProjectKeys keys = ProjectKeys();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CupertinoButton(child: const Text('a'), onPressed: () {}),
         TextButton(onPressed: () {}, child: const Text('a')),
          Text("Welcome $name ",
              maxLines: 2,
              overflow: TextOverflow
                  .ellipsis, //iki satırdan büyük varsa yanına 3 nokta için
              textAlign: TextAlign.right,
              style: const TextStyle(
                  wordSpacing: 2,
                  decoration: TextDecoration.underline,
                  fontStyle: FontStyle.italic,
                  fontSize: 16,
                  letterSpacing: 2,
                  color: Colors.amber,
                  fontWeight: FontWeight.w600)),
          Text("Welcome $name ",
              maxLines: 2,
              overflow: TextOverflow
                  .ellipsis, //iki satırdan büyük varsa yanına 3 nokta için
              textAlign: TextAlign.right,
              style: ProjectStyles.welcomeStyle),
          Text(
            "Hello $name ",
            maxLines: 2,
            overflow: TextOverflow
                .ellipsis, //iki satırdan büyük varsa yanına 3 nokta için
            textAlign: TextAlign.right,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: ProjectColors.welcomeColor),
          ),
          Text(userName ?? ''),
          Text(keys.welcome)
        ],
      )),
    );
  }
}

class ProjectStyles {
  static const TextStyle welcomeStyle = TextStyle(
      decoration: TextDecoration.underline,
      fontStyle: FontStyle.italic,
      color: Colors.amber,
      wordSpacing: 2,
      letterSpacing: 2,
      fontSize: 16,
      fontWeight: FontWeight.w600);
}

class ProjectColors {
  static Color welcomeColor = Colors.red;
}

class ProjectKeys {
  final String welcome = "Merhaba";
}
