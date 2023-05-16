import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> setupDependencies() async {
  await dotenv.load(fileName: ".env");
}
