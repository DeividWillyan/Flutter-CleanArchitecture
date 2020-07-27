import 'package:roadmap_flutter_dart/CleanArchtecture/core/erros/failure.dart';

class UseCaseException extends Failure {
  final String errorMessage;
  UseCaseException(this.errorMessage);

  @override
  List<Object> get props => [this.errorMessage];
}
