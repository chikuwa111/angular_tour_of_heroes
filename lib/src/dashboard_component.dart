import 'package:angular/angular.dart';
import 'package:angular_app/src/hero.dart';
import 'package:angular_app/src/hero_service.dart';
import 'package:angular_app/src/routes.dart';
import 'package:angular_router/angular_router.dart';

@Component(
    selector: 'my-dashboard',
    templateUrl: 'dashboard_component.html',
    styleUrls: ['dashboard_component.css'],
    directives: [coreDirectives, routerDirectives])
class DashboardComponent implements OnInit {
  final HeroService _heroService;

  DashboardComponent(this._heroService);

  List<Hero> heroes;

  void ngOnInit() async {
    heroes = (await _heroService.getAll()).skip(1).take(4).toList();
  }

  String heroUrl(int id) => RoutePaths.hero.toUrl(parameters: {idParam: '$id'});
}
