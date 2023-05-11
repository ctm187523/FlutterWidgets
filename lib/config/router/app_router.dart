
import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/screens.dart';


//He instalado go_router con --> flutter pub add go_router
// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: HomeScreeen.name, //el name es opcional cogemos el name del atributo estatico de la clase
      path: '/',
      builder: (context, state) => const HomeScreeen(),//widget al que nos dirigimos
    ),
    GoRoute(
      name: ButtonsScreen.name, //el name es opcional cogemos el name del atributo estatico de la clase
      path: '/buttons',
      builder: (context, state) => const ButtonsScreen(),//widget al que nos dirigimos
    ),
    GoRoute(
      name: CardsScreen.name, //el name es opcional cogemos el name del atributo estatico de la clase
      path: '/cards',
      builder: (context, state) => const CardsScreen(), //widget al que nos dirigimos
    ),
  ],
);