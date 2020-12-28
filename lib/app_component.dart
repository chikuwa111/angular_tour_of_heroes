import 'package:angular/angular.dart';
import 'package:angular_app/src/hero.dart';
import 'package:angular_app/src/hero_component.dart';
import 'package:angular_app/src/hero_service.dart';

@Component(
    selector: 'my-app',
    templateUrl: 'app_component.html',
    styleUrls: ['app_component.css'],
    directives: [coreDirectives, HeroComponent],
    providers: [ClassProvider(HeroService)])
class AppComponent implements OnInit {
  final title = 'Tour of Heroes';

  final HeroService _heroService;

  AppComponent(this._heroService);

  List<Hero> heroes;
  Hero selected;

  void ngOnInit() => _getHeroes();

  void _getHeroes() async {
    heroes = await _heroService.getAll();
  }

  void onSelect(Hero hero) => selected = hero;
}
