import 'package:clean_architecture_template/core/enums/flavors.dart';
import 'main.dart';

void main() {
  F.appFlavor = Flavor.dev;
  runMainApp(F.appFlavor!);
}
