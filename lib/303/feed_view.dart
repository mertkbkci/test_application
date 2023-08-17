import 'package:flutter/material.dart';

import '../202/service/post_model.dart';
import '../202/service/post_service.dart';

class FeedView extends StatefulWidget {
  const FeedView({super.key});

  @override
  State<FeedView> createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView> with AutomaticKeepAliveClientMixin {
  //sayfalar arası geçişte sayfanın durmasını sağlar
  final IPostService _postService = PostService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _postService.fetchPostItemsAdvance();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: FutureBuilder<List<PostModel>?> (
        future: _postService.fetchPostItemsAdvance(),
        builder: (BuildContext context, AsyncSnapshot<List<PostModel>?> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none: //internet olmadığında

              return const Placeholder();

            case ConnectionState.waiting: //interneti beklediğinde
              return const Center(child: CircularProgressIndicator());

            case ConnectionState.active: //internet varken

              return const Center(child: CircularProgressIndicator());

            case ConnectionState.done: //bittiğinde

              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        title: Text(snapshot.data?[index].title ?? ''),
                        subtitle: Text(snapshot.data?[index].body ?? ''),
                      ),
                    );
                  },
                );
              } else {
                return const Placeholder();
              }
          }
        },
      )
    );
  }

  @override
  bool get wantKeepAlive => true;
}
