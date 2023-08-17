part of './part_of_learn.dart';

class _PartOfAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _PartOfAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Part of Learn"),
      actions: [
        IconButton(
          icon: const Icon(Icons.arrow_forward),
          onPressed: () {},
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
