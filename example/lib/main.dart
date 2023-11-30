import 'package:flutter/material.dart';
import 'package:akeneo_api_client/akeneo_api_client.dart';
import 'package:example/src/home.dart';
import 'package:example/src/routes.dart';
import 'package:example/src/select_attributes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

/// The main application widget.
class MyApp extends StatelessWidget {
  /// The Akeneo API client used for making API calls.
  final AkeneoApiClient apiClient = AkeneoApiClient(
    endpoint: Uri.parse('http://192.168.1.13'),
    clientId: '1_api_connection_1',
    clientSecret: 'api_secret',
    userName: 'admin',
    password: 'Admin123',
  );

  /// The initially selected attributes to display in the application.
  final List<String> selectedAttributes = [
    "Family",
    "Enabled",
    "Created",
  ];

  /// Creates a [MyApp] widget.
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Akeneo Products List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.home,
      routes: {
        // Define routes for the application
        Routes.home: (context) => Home(
              apiClient: apiClient,
              selectedAttributes: selectedAttributes,
            ),
        Routes.selectAttributes: (context) => SelectAttributes(
              apiClient: apiClient,
              selectedAttributes: selectedAttributes,
            ),
      },
    );
  }
}
