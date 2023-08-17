import 'package:flutter/material.dart';

class IndicatorLearn extends StatelessWidget {
  const IndicatorLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        actions: const [ Center(child: CenterCircularProgress())],
      ),
      body: const LinearProgressIndicator(),//düz çizgi dolumu
    );
  }
}

class CenterCircularProgress extends StatelessWidget {
  const CenterCircularProgress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        strokeWidth: 10, //kalınlık
        value:  0.9, //dolma yüzdesi
        backgroundColor: Colors.white,//kalan kısmın rengi
      ),
    );
  }
}