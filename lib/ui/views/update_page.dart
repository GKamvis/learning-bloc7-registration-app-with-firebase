import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/data/entity/people.dart';

import '../cubit/update_page_cubit.dart';


class UpdatePage extends StatelessWidget {
   const UpdatePage({super.key});
  @override
  Widget build(BuildContext context) {
      final People person = ModalRoute.of(context)!.settings.arguments as People;
      final TextEditingController nameController = TextEditingController(text: person.name);
      final TextEditingController phoneController = TextEditingController(text: person.phone);

          return  Scaffold(
     
      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: nameController,decoration: const InputDecoration(border:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20),)),hintText: 'update  your name',)),  
              TextField(controller: phoneController,decoration: const InputDecoration(border:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20),)),hintText: 'update your name',)),   
              ElevatedButton(onPressed: () {
                context.read<UpdatePageCubit>().updatePerson(person.id, nameController.text, phoneController.text);
                 Navigator.pushNamed(context, '/home');
              }, child: const Text('update'))
            ],
          )
        ),
      ),
    );
  }
}