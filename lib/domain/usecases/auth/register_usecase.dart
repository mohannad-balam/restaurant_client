import '../../../core/services/injectables/locator.dart';
import '../../../core/common/usecase/usecase.dart';
import '../../../data/models/request/auth/register_request.dart';
import '../../../data/models/response/user.dart';
import '../../../domain/repositories/auth/i_auth_repository.dart';

class RegisterUsecase extends IUseCase<User, RegisterRequest> {
  @override
  Future<User> call({RegisterRequest? params}) async {
    return await locator<IAuthRepository>().register(params!);
  }
}
