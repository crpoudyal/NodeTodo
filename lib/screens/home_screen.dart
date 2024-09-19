import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nodetodo/bloc/todo_bloc.dart';
import 'package:nodetodo/widgets/bottomsheet_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<TodoBloc>().add(GetTodosEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: BlocBuilder<TodoBloc, TodoState>(
            builder: (context, state) {
              if (state is TodoLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is TodoLoadedState) {
                return ListView.builder(
                    itemCount: state.todos.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(state.todos[index].title),
                        subtitle: Text(state.todos[index].content),
                      );
                    });
              } else if (state is TodoErrorState) {
                return Center(
                    child: Text("Unable to Load Todos : ${state.message}"));
              }
              return const SizedBox.shrink();
            },
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet(
            builder: (context) {
              return const BottomSheetWidget();
            },
            context: context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
