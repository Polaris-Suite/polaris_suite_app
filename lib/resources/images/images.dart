const baseImagePath = 'assets/images/';

final backgroundImage = getBasePath('bg.png');
final logoImage = getBasePath('logo.png');

String getBasePath(String name) {
  return baseImagePath + name;
}
