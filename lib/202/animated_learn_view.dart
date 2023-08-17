import 'package:flutter/material.dart';

class AnimatedLearnView extends StatefulWidget {
  const AnimatedLearnView({super.key});

  @override
  State<AnimatedLearnView> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<AnimatedLearnView> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 2));
  }

  //Text('Animated Learn',style: context.textTheme().headlineLarge,),
  bool _isVisible = false;
  bool _isOpacity = false;

  late AnimationController controller;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _changeVisible() {
    setState(() {
      _isVisible = !_isVisible;
      _isOpacity = !_isOpacity;
    });
  }

  void _changeOpacity() {
    setState(() {
      _isOpacity = !_isOpacity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: _placeHolderWidget(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _changeVisible();
          controller.animateTo(_isVisible ? 1 : 0);
        },
        child: const Icon(Icons.flip),
      ),
      body: Column(
        children: [
          ListTile(
            title: AnimatedOpacity(
              opacity: _isOpacity ? 1 : 0,
              duration: const Duration(seconds: 1),
              child: const Text('data'),
            ),
            trailing: IconButton(
              onPressed: () {
                _changeOpacity();
              },
              icon: const Icon(
                Icons.precision_manufacturing_outlined,
              ),
            ),
          ),
          AnimatedDefaultTextStyle(
            style: (_isVisible ? context.textTheme().headlineLarge : context.textTheme().headlineMedium) ??
                const TextStyle(),
            duration: const Duration(seconds: 1),
            child: const Text('Animated Learn'),
          ),
          AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: controller,
          ),
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            height: _isVisible ? 0 : MediaQuery.of(context).size.width * 0.2,
            width: MediaQuery.of(context).size.height * 0.2,
            color: Colors.blue,
          ),
          const Expanded(
              child: Stack(
            children: [
              AnimatedPositioned(
                top: 150,
                curve: Curves.elasticOut,
                duration: Duration(seconds: 1),
                child: Text('data'),
              ),
            ],
          )),
          Expanded(
            child: AnimatedList(
                initialItemCount: 3,
                itemBuilder: (contex, index, animation) {
                  return const Text('data');
                }),
          )
        ],
      ),
    );
  }

  AnimatedCrossFade _placeHolderWidget() {
    return AnimatedCrossFade(
      crossFadeState: _isVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: const Duration(seconds: 1),
      firstChild: const Placeholder(
        color: Colors.red,
      ),
      secondChild: const Placeholder(
        color: Colors.blue,
      ),
    );
  }
}

extension BuildContextExtension on BuildContext {
  TextTheme textTheme() {
    return Theme.of(this).textTheme;
  }
}
