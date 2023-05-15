import 'package:clean_architecture_template/data/enums/flavors.dart';
import 'main.dart';

void main() {
  F.appFlavor = Flavor.qa;
  runMainApp(F.appFlavor!);
}
