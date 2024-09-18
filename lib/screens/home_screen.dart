import 'package:flutter/material.dart';
import 'package:nodetodo/widgets/bottomsheet_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
          child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return const ListTile(
                  title: Text("Hello"),
                  subtitle: Text("HEEEEE"),
                );
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet(
            builder: (context) {
              return BottomSheetWidget();
            },
            context: context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
