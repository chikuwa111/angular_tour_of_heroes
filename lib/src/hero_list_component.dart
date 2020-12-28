import 'package:angular/angular.dart';
import 'package:angular_app/src/hero.dart';
import 'package:angular_app/src/hero_service.dart';
import 'package:angular_app/src/route_paths.dart';
import 'package:angular_router/angular_router.dart';

@Component(
  selector: 'my-heroes',
  templateUrl: 'hero_list_component.html',
  styleUrls: ['hero_list_component.css'],
  directives: [coreDirectives],
  pipes: [commonPipes],
)
class HeroListComponent implements OnInit {
  final HeroService _heroService;
  final Router _router;

  HeroListComponent(this._heroService, this._router);

  List<Hero> heroes;
  Hero selected;

  void ngOnInit() => _getHeroes();

  void _getHeroes() async {
    heroes = await _heroService.getAll();
  }

  void onSelect(Hero hero) => selected = hero;

  Future<NavigationResult> gotoDetail() => _router.navigate(_heroUrl(selected.id));

  String _heroUrl(int id) =>
      RoutePaths.hero.toUrl(parameters: {idParam: '$id'});
}
