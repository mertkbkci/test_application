import 'package:test_application/404/bloc/feature/login/model/login_model.dart';
import 'package:vexana/vexana.dart';

import '../../../../../product/model/token_model.dart';

abstract class ILoginService {
  final INetworkManager networkManager;

  ILoginService(this.networkManager);
  Future<IResponseModel<TokenModel?, INetworkModel<dynamic>?>> login(LoginModel model);

  final String _loginPath = 'api/login';
}

class LoginService extends ILoginService {
  LoginService(INetworkManager networkManager) : super(networkManager);

  @override
  Future<IResponseModel<TokenModel?, INetworkModel<dynamic>?>> login(LoginModel model) async {
    final response = await networkManager.send<TokenModel, TokenModel>(_loginPath,
        parseModel: TokenModel(), method: RequestType.POST, data: model);

    return response;
  }
}
