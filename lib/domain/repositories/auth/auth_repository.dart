import '../../../core/services/injectables/locator.dart';
import '../../../data/models/request/auth/login_request.dart';
import '../../../data/models/request/auth/register_request.dart';
import '../../../data/models/response/user.dart';
import '../../../data/sources/auth/i_auth_service.dart';
import '../../../domain/repositories/auth/i_auth_repository.dart';

class AuthRepository extends IAuthRepository {
  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    try {
      LoginResponse loginResponse =
          await locator<IAuthService>().login(loginRequest);
      return loginResponse;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<User> register(RegisterRequest registerRequest) async {
    try {
      User user = await locator<IAuthService>().register(registerRequest);
      return user;
    } catch (e) {
      rethrow;
    }
  }
  
  @override
  Future<User> userInfo() async{
    try{
      User user = await locator<IAuthService>().userInfo();
      return user;
    }catch(e){
      rethrow;
    }
  }
}
