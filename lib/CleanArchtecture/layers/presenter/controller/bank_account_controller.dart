import 'package:roadmap_flutter_dart/CleanArchtecture/core/mapper/mapper.dart';

import '../../domain/entities/bank_account_entity.dart';
import '../../domain/usecases/bank_account_usecase.dart';

import '../../infra/dto/bank_account_dto.dart';

class BankAccountController {
  final BankAccountUseCase _useCase;
  final Mapper _mapper;
  BankAccountController(this._useCase, this._mapper);

  BankAccountDTO dto = new BankAccountDTO();
  List<BankAccountDTO> accounts = [];

  Future<String> getAccounts() async {
    var result = await _useCase.findAll();
    return result.fold(
      (left) => ('Algo de errado acorreu.: ' + left.props[0]),
      (right) {
        accounts = right
            .map((e) => this._mapper.to(e))
            .toList()
            .cast<BankAccountDTO>();
        return 'Sucesso!';
      },
    );
  }

  Future<String> save() async {
    BankAccount account = _mapper.from(this.dto);

    var result = await _useCase.save(account);
    return result.fold(
      (l) => ('Algo de errado acorreu.: ' + l.props[0]),
      (r) => ('Sucesso!'),
    );
  }
}
