import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/ui/views/expences_page.dart';
import '../cubit/navigation cubits/navigation_bloc.dart';
import 'home_page.dart';
import 'registration_page_dart.dart';

class MyBottomNavigation extends StatelessWidget {
  MyBottomNavigation({super.key});

  final List<Widget> pages = [
    const ExpencesPage(),
    const HomePage(),
    RegistrationPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NavigationBloc(),
      child: Scaffold(

        appBar: AppBar(
      backgroundColor: Colors.grey[300],
          actions: const [
            Row(
              children: [],
            )
          ],
        ),
        body: BlocBuilder<NavigationBloc, NavigationState>(
          builder: (context, state) {
            return pages[state.selectedIndex];
          },
        ),
bottomNavigationBar: BlocBuilder<NavigationBloc, NavigationState>(
  builder: (context, state) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300], // Arxa fon rəngi
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey, // Kölgə
            offset: Offset(4.0, 4.0),
            blurRadius: 15.0,
            spreadRadius: 1.0,
          ),
          BoxShadow(
            color: Colors.white, // İşıq effekti
            offset: Offset(-4.0, -4.0),
            blurRadius: 15.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.graph_square_fill),
            label: 'Bar Graph',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.house),
            label: 'Home Page',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.add),
            label: 'Add',
          ),
        ],
        currentIndex: state.selectedIndex,
        onTap: (index) {
          context.read<NavigationBloc>().add(NavigateToPage(index));
        },
        backgroundColor: Colors.transparent, // `Container` içindəki arxa fon rəngi artıq tətbiq edilib
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.black,
        elevation: 0, // `BottomNavigationBar`-ın orijinal kölgəsini aradan qaldırmaq
      ),
    );

          },
        ),
      ),
    );
  }
}
