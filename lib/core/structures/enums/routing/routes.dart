part 'route_level.dart';

enum Routes {
  authentication("/auth", "Log out", RouteLevel.root),
  recoverPassword("/reset-password", "Recupera password", RouteLevel.root),
  changePassword("change-password", "Cambia password", RouteLevel.primary),
  register("/register", "Registrati", RouteLevel.root),
  tutorial("/tutorial", "Tutorial", RouteLevel.root),
  home("/home", "Home", RouteLevel.root),
  languageSelection("/language-selection", "Scelta lingua", RouteLevel.dialog),
  manageAccount("/manage-account", "Gestisci dati account", RouteLevel.dialog),
  effects("effects", "Effetti", RouteLevel.primary),
  scenarioDetail("scenario-detail", "Dettaglio scenario", RouteLevel.primary),
  lampScan("lamp-scan", "Bluetooth", RouteLevel.primary),
  lampAssociation("lamp-association", "Associa Bluetooth", RouteLevel.secondary),
  addTank("add-tank", "Conferma dati vasca", RouteLevel.secondary),
  addLamp("add-lamp", "Aggiungi nuova lampada", RouteLevel.secondary),
  wifiPassword("wifi-password", "Inserisci wifi password", RouteLevel.secondary),
  wifiScan("wifi-scan", "Configura wifi", RouteLevel.secondary),
  wifiEdit("wifi-edit", "Modifica wifi", RouteLevel.secondary),
  wifiEditPassword("wifi-edit-password", "Modifica password wifi", RouteLevel.secondary);

  final String path;
  final RouteLevel level;
  final String displayName;

  const Routes(this.path, this.displayName, this.level);
}
