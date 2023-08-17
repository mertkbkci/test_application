import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_application/product/global/resource_context.dart';

class ImageLearnView202 extends StatefulWidget {
  const ImageLearnView202({super.key});

  @override
  State<ImageLearnView202> createState() => _ImageLearnViewState();
}

class _ImageLearnViewState extends State<ImageLearnView202> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  context.read<ResourceContext>().clear();
                  setState(() {});
                },
                icon: const Icon(Icons.delete_forever_outlined))
          ],
          title: Text(context.read<ResourceContext>().model?.data?.length.toString() ?? ''),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            height: 400,
            width: 400,
            child: ImagePaths.ic_red_apple.toWidget(),
          ),
        ),
      ),
    );
  }
}

enum ImagePaths {
  // ignore: constant_identifier_names
  ic_red_apple,
}

extension ImagePathsExtension on ImagePaths {
  String path() {
    return 'assets/png/$name.png';
  }

  Widget toWidget() {
    return Image.asset(
      path(),
      fit: BoxFit.cover,
    );
  }
}
