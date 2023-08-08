import 'package:app_filmes/application/ui/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../application/ui/my_flutter_app_icons.dart';
import '../favorites/favorites_page.dart';
import '../movies/movies_bindings.dart';
import '../movies/movies_page.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('App Bar')),
      body: Navigator(
        initialRoute: '/movies',
        key: Get.nestedKey(HomeController.NAVIGATOR_KEY),
        //* onGenerateRoute>> responsável por controlar toda a navegação
        onGenerateRoute: (settings) {
          //* se vier /movies ... fazer alguma coisa
          if (settings.name == '/movies') {
            return GetPageRoute(
              //* repassar os settings recebidos
              settings: settings,
              page: () => const MoviesPage(),
              binding: MoviesBindings(),
            );
          }
          if (settings.name == '/favorites') {
            return GetPageRoute(
              //* repassar os settings recebidos
              settings: settings,
              page: () => const FavoritesPage(),
            );
          }
          return null;
        },
      ),
      bottomNavigationBar: Obx(
        () {
          return BottomNavigationBar(
            selectedItemColor: context.themeRed,
            unselectedItemColor: Colors.grey,
            onTap: controller.goToPage,
            currentIndex: controller.pageIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(MdiIcons.filmstripBox),
                label: 'Movie',
              ),
              // ignore: prefer_const_constructors
              BottomNavigationBarItem(
                // ignore: prefer_const_constructors
                icon: Icon(FilmesAppIcons.heart_empty),
                label: 'Favorite',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.logout_outlined),
                label: 'Sair',
              ),
            ],
          );
        },
      ),
    );
  }
}
