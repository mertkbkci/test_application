import 'package:flutter/material.dart';
// import 'package:test_application/demos/petow_home.dart';
import 'package:test_application/demos/petow_page_view.dart';
import 'package:test_application/demos/petow_sign_in_page.dart';

class PetowRegisterScreen extends StatefulWidget {
  const PetowRegisterScreen({Key? key}) : super(key: key);

  @override
  State<PetowRegisterScreen> createState() => _PetowSignInScreenState();
}

class _PetowSignInScreenState extends State<PetowRegisterScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 100, bottom: 30),
                    child: FadeTransition(
                      opacity: _animation,
                      child: Image.asset('assets/png/ic_petow.png')
                    ),
                  ),
                   Padding(
                     padding: const EdgeInsets.only(left: 15, right: 15),
                     child: TextField(
                      maxLength: 50,
                      decoration: _RequaredInputDecorator().signInTextFieldDecoration
                                     ),
                   ),
                   Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                     child: TextField(
                      maxLength: 50,
                      decoration: _RequaredInputDecorator().signInTextFieldDecoration2
                                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(left: 15, right: 15),
                     child: TextField(
                      maxLength: 50,
                      decoration: _RequaredInputDecorator().signInTextFieldDecoration3
                                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(left: 15, right: 15),
                     child: TextField(
                      maxLength: 50,
                      obscureText: true,
                      decoration: _RequaredInputDecorator().signInTextFieldDecoration4
                                     ),
                   ),
                 TextButton(onPressed: (){
                  Navigator.push(
                      context,
                        MaterialPageRoute(
                         builder: (context) => const PetowPageView(),
                          ),
                          );
                 }, child: const Text('Kayıt Ol',style: TextStyle(
                  color: Colors.blue
                  ),
                  ),
                  )
                ],
              ),

               TextButton(
                onPressed: (){
                  Navigator.pop(
                   context,
                    MaterialPageRoute(
                    builder: (context) => const PetowSignInPage(),
                    ));
                }, 
                child: const Text('Zaten Hesabın var mı? Giriş Yap',
                style: TextStyle(
                 color: Colors.blue
                 ),
                 
                 ),
                 
                 )
            ],
          ),
        ),
      ),
    );
  }
}

class _PetowTextStyle {
  final petowTextStyle = const TextStyle(
    fontStyle: FontStyle.italic,
    fontSize: 50,
    color: Colors.purple,
    fontWeight: FontWeight.bold,
  );
}

class _RequaredInputDecorator {
  final signInTextFieldDecoration = const InputDecoration(
    border: OutlineInputBorder(),
    prefix: Icon(Icons.abc_outlined),
    filled: false,
    labelText: 'Kullanıcı adı',
  );
final signInTextFieldDecoration2 = const InputDecoration(
    border: OutlineInputBorder(),
    prefix: Icon(Icons.abc_outlined),
    filled: false,
    labelText: 'Ad Soyad',
  );
  final signInTextFieldDecoration3 = const InputDecoration(
    border: OutlineInputBorder(),
    prefix: Icon(Icons.email_outlined),
    filled: false,
    labelText: AutofillHints.email,
  );
  final signInTextFieldDecoration4 = const InputDecoration(
    border: OutlineInputBorder(),
    prefix: Icon(Icons.password_outlined),
    filled: false,
    labelText: 'Şifre',

  );


}
