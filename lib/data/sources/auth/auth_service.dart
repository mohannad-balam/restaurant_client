import '../../../core/constant/api_routes.dart';
import '../../../core/enums/http_methods.dart';
import '../../../core/services/http/http_service.dart';
import '../../../core/services/injectables/locator.dart';
import '../../../data/models/request/auth/login_request.dart';
import '../../../data/models/request/auth/register_request.dart';
import '../../../data/models/response/user.dart';
import '../../../data/sources/auth/i_auth_service.dart';

class AuthService extends IAuthService {
  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    try {
      dynamic loginResponse = await locator<HttpService>()
          .request(HttpMethods.POST, ApiRoutes.login, loginRequest.toJson());
      return LoginResponse.fromJson(loginResponse);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<User> register(RegisterRequest registerRequest) async {
    dynamic user = await locator<HttpService>().request(
        HttpMethods.POST, ApiRoutes.register, registerRequest.toJson());
    return User.fromJson(user);
  }
  
  @override
  Future<User> userInfo() async{
    try{
      dynamic user = await locator<HttpService>().request(HttpMethods.GET, ApiRoutes.getUser, {});
      return User.fromJson(user);
    }catch(e){
      rethrow;
    }
  }
}
