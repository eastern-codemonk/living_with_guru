
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:living_with_guru/data/exceptions/authentication_exception.dart';
import 'package:living_with_guru/domain/entities/user.dart';
import 'package:living_with_guru/domain/repositories/authentication_repositary.dart';
import 'package:living_with_guru/domain/usecases/auth/login_usecase.dart';
import 'package:mockito/mockito.dart';

class MockAuthenticationRepository extends Mock implements AuthenticationRepository {}

class _TestLoginObserver implements Observer<User> {
  int complete=0, error=0, next=0;
  User user;
  @override
  void onComplete() {
    complete++;
  }

  @override
  void onError(e) {
    error++;
  }

  @override
  void onNext(User response) {
    user = response;
    next++;
  }
}

main() {
  group('Authentication tests ', () {

    String emailSucess = 'success@email.com';
    String passwordSuccess = 'abc123&';

    test('Authenticat with right user name', () async {
      // Prepare
      final repo = MockAuthenticationRepository();
      LoginUseCase loginUseCase = LoginUseCase(repo);
      when(repo.authenticate(email: emailSucess, password: passwordSuccess))
        .thenAnswer((_) => Future.value());
      _TestLoginObserver testObserver = _TestLoginObserver();

      // Test
      loginUseCase.execute(testObserver, LoginUseCaseParams(emailSucess, passwordSuccess));
      
      // Assert
      await new Future.delayed(const Duration(seconds : 0));
      expect(testObserver.complete, 1);
      expect(testObserver.error, 0);
    });

    test('Authentication failure test', () async {
      // Prepare
      final repo = MockAuthenticationRepository();
      LoginUseCase loginUseCase = LoginUseCase(repo);
      when(repo.authenticate(email: emailSucess, password: passwordSuccess))
        .thenAnswer((_) => throw APIException('generated exception', 200, 'error'));
      _TestLoginObserver testObserver = _TestLoginObserver();

      // Test
      loginUseCase.execute(testObserver, LoginUseCaseParams(emailSucess, passwordSuccess));
      
      // Assert
      await new Future.delayed(const Duration(seconds : 0));
      expect(testObserver.complete, 0);
      expect(testObserver.error, 1);
    });
  });
}