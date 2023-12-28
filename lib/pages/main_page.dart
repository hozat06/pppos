import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});
  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // List<Widget> pages = [
  //   HomePage(),
  //   CustomerPage(
  //     mobileView: const CustomerPhoneListView(),
  //     tabletView: const CustomerTabletListView(),
  //   ),
  //   const OrderPage(),
  //   const CategoryPage(),
  //   const ProductPage(),
  //   const SettingsPage()
  // ];

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        elevation: 0,
      ),
      body: const Center(
        child: Text("data"),
      ),
    );
  }

  BottomNavigationBar _mainBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.grey[200],
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.black87,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      iconSize: 32,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(Icons.group_rounded), label: "Customers")
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }
}
