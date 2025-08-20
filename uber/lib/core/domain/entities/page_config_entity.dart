import 'package:equatable/equatable.dart';

class PageConfigEntity extends Equatable {
  const PageConfigEntity({
    this.perPage,
    this.page,
    this.token,
    this.refreshToken,
    this.filter,
    this.search,
    this.id,
    this.data,
  });
  final int? perPage;
  final int? page;
  final String? refreshToken;
  final String? token;
  final String? filter;
  final String? search;

  final dynamic id;

  final dynamic data;

  @override
  List<Object?> get props => [
        perPage,
        page,
        token,
        id,
        search,
        refreshToken,
        data,
        filter,
      ];
}

class PageConfigModel extends PageConfigEntity {
  const PageConfigModel({
    super.perPage,
    super.page,
    super.token,
    super.refreshToken,
    super.filter,
    super.search,
    super.id,
    super.data,
  });

  factory PageConfigModel.convert(PageConfigEntity params) {
    return PageConfigModel(
        token: params.token,
        id: params.id,
        data: params.data,
        filter: params.filter,
        page: params.page,
        perPage: params.perPage,
        refreshToken: params.refreshToken,
        search: params.search);
  }
}
