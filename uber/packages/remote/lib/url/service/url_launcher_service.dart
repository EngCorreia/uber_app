part of remote;

class UrlLauncherService {
  UrlLauncherService(this.usecase);
  final UrlLauncherUsecase usecase;
  ApiResponse<void> response = ApiResponse.loading("loading...");

  Future<ApiResponse<void>> link(String params) async {
    final result = await usecase(params);
    response = result.fold((l) => ApiResponse.error('$l'), (r) {
      return ApiResponse.completed(r);
    });

    return response;
  }
}
