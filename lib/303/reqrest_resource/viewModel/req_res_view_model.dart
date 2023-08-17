import 'package:dio/dio.dart';
import 'package:test_application/202/cache/shared_learn_cache.dart';
import 'package:test_application/product/service/project_network_manager.dart';

import '../model/resource_model.dart';
import '../service/reqres_service.dart';
import '../view/req_res_view.dart';

abstract class ReqresViewModel extends LoadingStatefull<ReqResView> {
  late final IReqresService reqresService;

  final service = Dio(BaseOptions(baseUrl: 'https://reqres.in/api'));

  List<Data> resources = [];
  @override
  void initState() {
    super.initState();
    reqresService = ReqresServise(
        //service
    ProjectNetworkManager.instance.service);
    ProjectNetworkManager.instance.addBaseHeaderToToken('mert');

    _fetch();
  }

  Future<void> _fetch() async {
    changeLoading();
    resources = (await reqresService.fetchResourceItem())?.data ?? [];
    changeLoading();
  }
}
