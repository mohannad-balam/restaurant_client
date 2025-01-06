import '../../../core/services/injectables/locator.dart';
import '../../../core/common/usecase/usecase.dart';
import '../../../data/models/response/user.dart';
import '../../../domain/repositories/auth/i_auth_repository.dart';

class GetUserInfoUsecase extends IUseCase<User, dynamic> {
  @override
  Future<User> call({params}) async {
    return await locator<IAuthRepository>().userInfo();
  }
}
