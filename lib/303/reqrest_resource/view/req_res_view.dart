import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_application/303/reqrest_resource/service/reqres_service.dart';
import 'package:test_application/303/reqrest_resource/viewModel/req_res_provider.dart';
import 'package:test_application/product/extension/string_extension.dart';
import 'package:test_application/product/global/resource_context.dart';

import '../../../202/image_learn_202.dart';
import '../../../product/global/theme_notifier.dart';
import '../model/resource_model.dart';

class ReqResView extends StatefulWidget {
  const ReqResView({Key? key}) : super(key: key);

  @override
  State<ReqResView> createState() => _ReqResViewState();
}

//class _ReqResViewState extends ReqresViewModel {
class _ReqResViewState extends State<ReqResView> {
  final service = Dio(BaseOptions(baseUrl: 'https://reqres.in/api'));
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ReqResProvider>(
      create: (context) => ReqResProvider(ReqresServise(service)),
      builder: (context, child) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(onPressed: () {
            context.read<ThemeNotifier>().changeTheme();
          }),
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    context.read<ReqResProvider>().saveToLocale(context.read<ResourceContext>());
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return const ImageLearnView202();
                        },
                      ),
                    );
                  },
                  icon: const Icon(Icons.save)),
            ],
            title: context.watch<ReqResProvider>().isLoading
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : null,
          ),
          body: Column(
            children: [
              Selector<ReqResProvider, bool>(builder: (context, value, child) {
                return value ? const Placeholder() : const Text('data');
              }, selector: (context, provider) {
                return provider.isLoading;
              }),
              Expanded(child: _resourceListView(context, context.watch<ReqResProvider>().resources)),
            ],
          ),
          // appBar: AppBar(title: isLoading ? const CircularProgressIndicator() : null),
          // body: ListView.builder(
          //   itemCount: resources.length,
          //   itemBuilder: (BuildContext context, int index) {
          //     return Card(
          //         color: Color(resources[index].color?.colorValue ?? 0),
          //         child: Center(child: Text(resources[index].name ?? '')));
          //   },
          // ),
        );
      },
    );
  }

  ListView _resourceListView(BuildContext context, List<Data> items) {
    return ListView.builder(
      itemCount: context.watch<ReqResProvider>().resources.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
            color: Color(items[index].color?.colorValue ?? 0), child: Center(child: Text(items[index].name ?? '')));
      },
    );
  }
}
