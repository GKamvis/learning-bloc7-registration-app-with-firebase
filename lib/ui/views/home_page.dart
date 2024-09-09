import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/entity/people.dart';
import '../cubit/home_page_cubit.dart';
import '../cubit/search_Repo_cubit.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomePageCubit()..getPerson()),
        BlocProvider(create: (context) => SearchCubit()),
      ],
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.grey[300],
          automaticallyImplyLeading: false,
          title: BlocBuilder<SearchCubit, bool>(
            builder: (context, showSearch) {
              return showSearch
                  ? TextField(
                      decoration: const InputDecoration(
                        hintText: 'Search...',
                      ),
                      onChanged: (newQuery) {
                        if (newQuery.isEmpty) {
                          context.read<HomePageCubit>().getPerson();
                          return;
                        }
                        context.read<HomePageCubit>().findPerson(newQuery);
                      },
                    )
                  : const Text('Home Page');
            },
          ),
          actions: [
            BlocBuilder<SearchCubit, bool>(
              builder: (context, showSearch) {
                return IconButton(
                  onPressed: () {
                    context.read<SearchCubit>().toggleSearch();
                    if (!showSearch) {
                      context.read<HomePageCubit>().getPerson();
                    }
                  },
                  icon: showSearch ? const Icon(Icons.cancel) : const Icon(Icons.search),
                );
              },
            ),
          ],
        ),
        body: BlocBuilder<HomePageCubit, List<People>>(
          builder: (context, people) {
            print("People list: $people"); // Debug print
            if (people.isNotEmpty) {
              return ListView.builder(
                itemCount: people.length,
                itemBuilder: (context, index) {
                  var person = people[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/update', arguments: person)
                          .then((_) {
                        context.read<HomePageCubit>().getPerson();
                      });
                    },
                    child: Container(
  margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10), // Daha böyük boşluq
  padding: const EdgeInsets.all(16), // İçəridə boşluq
  decoration: BoxDecoration(
    color: Colors.grey[300],
    borderRadius: const BorderRadius.all(
      Radius.circular(12), // Daha kiçik border radius
    ),
    boxShadow: const [
      BoxShadow(
        color: Colors.grey, // Kölgə
        offset: Offset(6.0, 6.0),
        spreadRadius: 2.0,
        blurRadius: 20.0,
      ),
      BoxShadow(
        color: Colors.white, // İşıq effekti
        offset: Offset(-6.0, -6.0),
        blurRadius: 20.0,
        spreadRadius: 2.0,
      ),
    ],
  ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 18.0),
        child: Text(person.name, style: TextStyle(fontSize: 16)), // Daha böyük mətn
      ),
      Text(person.phone, style: TextStyle(fontSize: 16)), // Daha böyük mətn
      IconButton(
        onPressed: () {
          context.read<HomePageCubit>().deletePerson(person.id);
        },
        icon: const Icon(Icons.delete),
      ),
    ],
  ),
)

                    
                  );
                
                },
              );
            } else {
              return const Center(
                child: Text('No results found.'),
              );
            }
          },
        ),
      ),
    );
  }
}

