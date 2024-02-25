import 'package:coffee_makers/screens/menu_screen.dart';
import 'package:coffee_makers/screens/offers_screen.dart';
import 'package:coffee_makers/screens/order_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedBottomBarIndex = 0;

  Widget getSelectedScreen() {
    switch (selectedBottomBarIndex) {
      case 0:
        return const MenuScreen();
      case 1:
        return const OffersScreen();
      case 2:
        return const OrderScreen();
      default:
        return const MenuScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Image.asset('images/logo.png'),
        centerTitle: true,
      ),
      body: getSelectedScreen(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Offers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Order',
          ),
        ],
        currentIndex: selectedBottomBarIndex,
        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.onPrimaryContainer,
        selectedItemColor: Theme.of(context).colorScheme.onPrimary,
        onTap: (int index) {
          setState(() {
            selectedBottomBarIndex = index;
          });
        },
      ),
    );
  }
}
