import 'package:flutter/material.dart';
import 'package:untitled/Python/sendRequest.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String id = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  final ageController = TextEditingController();
  final incomeController = TextEditingController();
  final fixedExpenseController = TextEditingController();
  final dependentCountController = TextEditingController();
  final maritalStatusController = TextEditingController();
  final dailyNeedsController = TextEditingController();
  final transportationController = TextEditingController();
  final foodBevController = TextEditingController();
  final healthcareController = TextEditingController();
  final shoppingController = TextEditingController();
  final servicesController = TextEditingController();
  final othersController = TextEditingController();

  var varList = []
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IntelliCent',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('IntelliCent'),
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please enter age';
                    }
                    return null;
                  },
                  decoration:  const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter your age',
                  ),
                ),
                TextFormField(
                  controller: incomeController,
                  keyboardType: TextInputType.number,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please enter income';
                    }
                    return null;
                  },
                  decoration:  const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter your income',
                  ),
                ),
                TextFormField(
                  controller: fixedExpenseController,
                  keyboardType: TextInputType.number,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please enter fixed expense';
                    }
                    return null;
                  },
                  decoration:  const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter your fixed expense',
                  ),
                ),
                TextFormField(
                  controller: dependentCountController,
                  keyboardType: TextInputType.number,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please enter the dependent count';
                    }
                    return null;
                  },
                  decoration:  const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter the number of people that are dependent on your income',
                  ),
                ),
                TextFormField(
                  controller: transportationController,
                  keyboardType: TextInputType.number,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please enter amount you spent on transportation';
                    }
                    return null;
                  },
                  decoration:  const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter the amount you spent on transportation',
                  ),
                ),
                TextFormField(
                  controller: foodBevController,
                  keyboardType: TextInputType.number,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please enter Food and Beverage amount';
                    }
                    return null;
                  },
                  decoration:  const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter amount you spent on Food and Beverages',
                  ),
                ),
                TextFormField(
                  controller: healthcareController,
                  keyboardType: TextInputType.number,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please enter amount spent on healthcare';
                    }
                    return null;
                  },
                  decoration:  const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter amount spent on healthcare',
                  ),
                ),
                TextFormField(
                  controller: shoppingController,
                  keyboardType: TextInputType.number,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please enter amount spent on shopping';
                    }
                    return null;
                  },
                  decoration:  const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter amount spent on shopping',
                  ),
                ),
                TextFormField(
                  controller: servicesController,
                  keyboardType: TextInputType.number,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please enter amount spent on services';
                    }
                    return null;
                  },
                    decoration:  const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter amount spent on services',
                  ),
                ),
                TextFormField(
                  controller: othersController,
                  keyboardType: TextInputType.number,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please enter amount spent on other expenses';
                    }
                    return null;
                  },
                    decoration:  const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter amount spent on other expenses',
                  ),
                ),
              ],
            ),
          )
        ),
        floatingActionButton: FloatingActionButton(
            child: const Text('Enter'),
            onPressed: () {
              if(_formKey.currentState!.validate()){
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                );
              }
              sendPostRequest(
                  ageController.text,
                  incomeController.text,
                  fixedExpenseController.text,
                  dependentCountController.text,
                  dailyNeedsController.text,
                  transportationController.text,
                  foodBevController.text,
                  healthcareController.text,
                  shoppingController.text,
                  servicesController.text,
                  othersController.text,
                  maritalStatusController,

              );

              print(ageController.text);
              print(incomeController.text);
              print(fixedExpenseController.text);
              print(dependentCountController.text);
              print(dailyNeedsController.text);
              print(transportationController.text);
              print(foodBevController.text);
              print(healthcareController.text);
              print(shoppingController.text);
              print(servicesController.text);
              print(othersController.text);
            }),
        ),
      );
  }
}