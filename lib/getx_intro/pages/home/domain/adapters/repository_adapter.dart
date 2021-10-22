import '../entity/cases_model.dart';

abstract class IHomeRepository {
  Future<CasesModel> getCases();
}
