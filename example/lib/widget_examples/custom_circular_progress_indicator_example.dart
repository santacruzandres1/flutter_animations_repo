import 'package:design_aplication/src/widgets/custom_circular_progress_indicator.dart';
import 'package:flutter/material.dart';

class CustomCircularProgressIndicatorExample extends StatefulWidget {
  const CustomCircularProgressIndicatorExample({super.key});

  @override
  State<CustomCircularProgressIndicatorExample> createState() => _CustomCircularProgressIndicatorExampleState();
}

class _CustomCircularProgressIndicatorExampleState extends State<CustomCircularProgressIndicatorExample> {
  bool isLoading = false;
  final ValueNotifier<bool> isCompleteNotifier = ValueNotifier<bool>(false);

  void _toggleLoading() {
    if (isCompleteNotifier.value) {
      isCompleteNotifier.value = false; 
    }
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  void initState() {
    super.initState();
    isCompleteNotifier.addListener(() {
      if (isCompleteNotifier.value) {
        setState(() {
          isLoading = false; 
        });
      }
    });
  }

  @override
  void dispose() {
    isCompleteNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyBuilder(context),
      floatingActionButton: _floatingActionButtonBuilder(),
    );
  }

  Widget _bodyBuilder(BuildContext context) {
    return  Center(
      child: CustomCircularProgressIndicator(
        //Estos argumentos son para controlar el widget desde el FloatingActionButton
        isLoading: isLoading,//maneja si la animacion esta activa o no
        isCompleteNotifier: isCompleteNotifier,//notifica cuando se completó la animacion
      ),
    );
  }

  Widget _floatingActionButtonBuilder() {
    return FloatingActionButton(
      onPressed: _toggleLoading,
      child: Icon(isLoading ? Icons.stop : Icons.play_arrow),
    );
  }
}
