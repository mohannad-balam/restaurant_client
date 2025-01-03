import '../../../data/models/request/auth/login_request.dart';
import '../../../data/models/request/auth/register_request.dart';
import '../../../data/models/response/user.dart';

abstract class IAuthRepository {
  Future<LoginResponse> login(LoginRequest loginRequest);
  Future<User> register(RegisterRequest registerRequest);
}
