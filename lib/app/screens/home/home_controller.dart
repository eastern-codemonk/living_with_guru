

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:living_with_guru/data/repositories/data_authentication_repository.dart';

class HomeController extends Controller
{
  HomeController(DataAuthenticationRepository dataAuthenticationRepository) {
    _repository = dataAuthenticationRepository;
  }

  DataAuthenticationRepository _repository;

  @override
  void initListeners() {
    // TODO: implement initListeners
  }
  
}