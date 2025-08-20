part of remote;

class UrlLauncherUsecase implements Usecase<void, String> {
  final IUrlLauncherRepository repository;

  UrlLauncherUsecase(this.repository);
  @override
  Future<Either<Failure, void>> call(String params) async {
    return repository.link(params);
  }
}
