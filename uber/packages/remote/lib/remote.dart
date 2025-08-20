library remote;

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:errors/errors.dart';
import 'package:interfaces/interfaces.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';


part 'remote_fk_implementation.dart';
part 'remote_implementation.dart';
part 'remote_interface.dart';
part 'url/data/datasource/url_launcher_datasource.dart';
part 'url/data/datasource/url_launcher_datasource_implementation.dart';
part 'url/domain/repository/url_launcher_repositorties.dart';
part 'url/data/repository/url_launcher_repository_implementation.dart';
part 'url/domain/usecase/url_launcher_usecase.dart';
part 'url/service/url_launcher_service.dart';
part 'api_header_helpers.dart';

