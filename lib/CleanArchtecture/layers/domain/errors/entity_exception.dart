import 'package:roadmap_flutter_dart/CleanArchtecture/core/erros/failure.dart';

class EntityException extends Failure {
  final String errorMessage;
  EntityException(this.errorMessage);

  @override
  List<Object> get props => [this.errorMessage];
}
