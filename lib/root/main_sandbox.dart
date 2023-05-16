import 'package:clean_architecture_template/core/enums/flavors.dart';
import 'package:clean_architecture_template/root/main.dart';

void main() {
  F.appFlavor = Flavor.sandbox;
  runMainApp(F.appFlavor!);
}
