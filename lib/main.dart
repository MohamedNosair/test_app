import 'dart:developer';

class AssistantCutter implements VegetableTask {
  void prepareVegetables() => log("prepareVegetables");
}

abstract class VegetableTask {
  void prepareVegetables();
}

class Chef {
  final VegetableTask vegetableTask;

  Chef({required this.vegetableTask});
  void cut() {
    vegetableTask.prepareVegetables();
  }
}

void main() {
  final AssistantCutter assistantCutter = AssistantCutter();
  final Chef chef = Chef(vegetableTask: assistantCutter);
  chef.cut();

  // Chef chef = Chef();
  // chef.cutter.prepareVegetables();
}
