const baseImagePath = 'assets/images/';

final backgroundImage = getBasePath('bg.png');

String getBasePath(String name) {
  return baseImagePath + name;
}
