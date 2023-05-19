
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
    GoRoute(
      name: ProgressScreen.name, //el name es opcional cogemos el name del atributo estatico de la clase
      path: '/progress',
      builder: (context, state) => const ProgressScreen(), //widget al que nos dirigimos
    ),
    GoRoute(
      name: SnackbarScreen.name, //el name es opcional cogemos el name del atributo estatico de la clase
      path: '/snackbars',
      builder: (context, state) => const SnackbarScreen(), //widget al que nos dirigimos
    ),
    GoRoute(
      name: AnimatedScreen.name, //el name es opcional cogemos el name del atributo estatico de la clase
      path: '/animated',
      builder: (context, state) => const AnimatedScreen(), //widget al que nos dirigimos
    ),
    
    GoRoute(
      name: AppTutorialScreen.name, //el name es opcional cogemos el name del atributo estatico de la clase
      path: '/tutorial',
      builder: (context, state) => const AppTutorialScreen(), //widget al que nos dirigimos
    ),
  ],
);