import 'package:flutter/material.dart';
import 'package:nodetodo/widgets/textfield_widget.dart';

class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({super.key});

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  final TextEditingController title = TextEditingController();
  final TextEditingController content = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextfieldWidget(
              controller: title, hintText: "Enter Title", labelText: "Title"),
          const SizedBox(height: 20),
          TextfieldWidget(
              controller: content,
              hintText: "Enter Content..",
              labelText: "Content"),
          const SizedBox(height: 20),
          ElevatedButton(onPressed: () {
            
          }, child: const Text("Save"))
        ],
      ),
    );
  }
}
