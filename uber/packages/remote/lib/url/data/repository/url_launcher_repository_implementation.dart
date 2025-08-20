part of remote;

class UrlLauncherRepositoryImplementation implements IUrlLauncherRepository {
  UrlLauncherRepositoryImplementation(this.datasource);
  final IUrlLauncherDatasource datasource;
  @override
  Future<Either<Failure, void>> link(String params) async {
    try {
      final result = await datasource.link(params);
      return Right(result);
    } on FetchDataException catch (e) {
      return Left(FetchDataFailure("$e"));
    }
  }
}
