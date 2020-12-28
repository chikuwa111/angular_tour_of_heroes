import 'package:angular_app/src/hero.dart';
import 'package:angular_app/src/mock_heroes.dart';

class HeroService {
  Future<List<Hero>> getAll() async => mockHeroes;
}
