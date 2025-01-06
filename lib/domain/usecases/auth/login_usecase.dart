import '../../../core/services/injectables/locator.dart';
import '../../../core/common/usecase/usecase.dart';
import '../../../data/models/request/auth/login_request.dart';
import '../../../data/models/response/user.dart';
import '../../../domain/repositories/auth/i_auth_repository.dart';

class LoginUsecase extends IUseCase<LoginResponse, LoginRequest> {
  @override
  Future<LoginResponse> call({LoginRequest? params}) async {
    return await locator<IAuthRepository>().login(params!);
  }
}
