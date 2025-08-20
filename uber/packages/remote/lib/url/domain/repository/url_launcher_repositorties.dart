part of remote;

abstract class IUrlLauncherRepository {
  Future<Either<Failure, void>> link(String params);
}
