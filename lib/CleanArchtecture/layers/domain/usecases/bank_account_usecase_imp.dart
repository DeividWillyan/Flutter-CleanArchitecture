import 'package:dartz/dartz.dart';
import 'package:roadmap_flutter_dart/CleanArchtecture/core/erros/failure.dart';
import 'package:roadmap_flutter_dart/CleanArchtecture/layers/domain/errors/entity_exception.dart';

import '../entities/bank_account_entity.dart';
import '../repositories/bank_account_repository.dart';
import '../errors/use_case_exception.dart';

import 'bank_account_usecase.dart';

class BankAccountUseCaseImp implements BankAccountUseCase {
  final BankAccountRepository _repository;
  BankAccountUseCaseImp(this._repository);

  Future<Either<Failure, BankAccount>> save([BankAccount bankAccount]) async {
    if (bankAccount.isInvalidNumberAccout()) {
      return Left(EntityException('Entity Error: not valid account number.'));
    }

    var result = await _repository.save(bankAccount);
    return result.fold(
      (l) => Left(UseCaseException('UseCase Error on Save Mathod.')),
      (r) => Right(r),
    );
  }

  @override
  Future<Either<Failure, List<BankAccount>>> findAll() async {
    var result = await _repository.findAll();
    return result.fold(
      (l) => Left(UseCaseException('UseCase Error on findAll Mathod.')),
      (r) => Right(r),
    );
  }
}
