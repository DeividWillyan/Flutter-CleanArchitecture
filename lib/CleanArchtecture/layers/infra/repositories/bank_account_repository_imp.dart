import 'package:dartz/dartz.dart';

import 'package:roadmap_flutter_dart/CleanArchtecture/core/erros/failure.dart';
import 'package:roadmap_flutter_dart/CleanArchtecture/core/mapper/mapper.dart';
import 'package:roadmap_flutter_dart/CleanArchtecture/layers/infra/errors/repository_exception.dart';

import '../../domain/entities/bank_account_entity.dart';
import '../../domain/repositories/bank_account_repository.dart';

import '../dto/bank_account_dto.dart';
import '../datasources/bank_account_datasorce.dart';

class BankAccountRepositoryImp implements BankAccountRepository {

  final BankAccountDatasource _datasource;
  final Mapper _mapper;
  BankAccountRepositoryImp(this._datasource, this._mapper);

  @override
  Future<Either<Failure, BankAccount>> save(BankAccount bankAccount) async {
    try {
      BankAccountDTO dto = this._mapper.to(bankAccount);
      await _datasource.save(dto);
      return Right(bankAccount);
    } catch (e) {
      return Left(RepositoryException('Error on repository save.'));
    }
  }

  @override
  Future<Either<Failure, List<BankAccount>>> findAll() async {
    try {
      var result = await _datasource.findAll();
      return Right(result.map((e) => this._mapper.from(e)).toList().cast<BankAccount>());
    } catch (e) {
      return Left(RepositoryException('Error on repository findAll.'));
    }
  }
}
