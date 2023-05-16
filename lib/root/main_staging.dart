import 'main.dart';
import 'package:clean_architecture_template/core/enums/flavors.dart';

void main() {
  F.appFlavor = Flavor.staging;
  runMainApp(F.appFlavor!);
}
