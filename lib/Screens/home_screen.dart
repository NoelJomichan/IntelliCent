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
  final dailyNeedsController = TextEditingController();
  final transportationController = TextEditingController();
  final foodBevController = TextEditingController();
  final healthcareController = TextEditingController();
  final shoppingController = TextEditingController();
  final servicesController = TextEditingController();
  final othersController = TextEditingController();
  int gender = 0;
  int maritalStatus = 0;
  int profIndustrial = 0;
  int profKnowledge = 0;
  int profPublic = 0;
  int profService = 0;

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
                  controller: dailyNeedsController,
                  keyboardType: TextInputType.number,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please enter amount you spent on daily needs';
                    }
                    return null;
                  },
                  decoration:  const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter the amount you spent on daily needs',
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
                const Padding(padding: EdgeInsets.all(10)),
                const Text('Gender'),
                Column(
                  // gender
                  children: [
                    RadioListTile(
                        title: const Text('Male'),
                        value: 1,
                        groupValue: gender,
                        onChanged: (value){
                          setState(() {
                            gender = value!;
                          });
                        } ),
                    RadioListTile(
                        title: const Text('Female'),
                        value: 0,
                        groupValue: gender,
                        onChanged: (value){
                          setState(() {
                            gender = value!;
                          });
                        } )
                  ],
                ),
                const Padding(padding: EdgeInsets.all(10)),
                const Text('Marital Status'),
                Column(
                  //marital status
                  children: [
                    RadioListTile(
                        title: const Text('Married'),
                        value: 1,
                        groupValue: maritalStatus,
                        onChanged: (value){
                          setState(() {
                            maritalStatus = value!;
                          });
                        } ),
                    RadioListTile(
                        title: const Text('Not Married'),
                        value: 0,
                        groupValue: maritalStatus,
                        onChanged: (value){
                          setState(() {
                            maritalStatus = value!;
                          });
                        } )
                  ],
                ),
                const Padding(padding: EdgeInsets.all(10)),
                const Text('Profession'),
                Column(
                  //profession
                  children: [
                    RadioListTile(
                        title: const Text('Industrial'),
                        value: 1,
                        groupValue: profIndustrial,
                        onChanged: (value){
                          setState(() {
                            profIndustrial = value!;
                            profKnowledge = 0;
                            profPublic = 0;
                            profService = 0;
                          });
                        } ),
                    RadioListTile(
                        title: const Text('Knowledge'),
                        value: 1,
                        groupValue: profKnowledge,
                        onChanged: (value){
                          setState(() {
                            profIndustrial = 0;
                            profKnowledge = value!;
                            profPublic = 0;
                            profService = 0;
                          });
                        } ),
                    RadioListTile(
                        title: const Text('Public'),
                        value: 1,
                        groupValue: profPublic,
                        onChanged: (value){
                          setState(() {
                            profIndustrial = 0;
                            profKnowledge = 0;
                            profPublic = value!;
                            profService = 0;
                          });
                        } ),
                    RadioListTile(
                        title: const Text('Service'),
                        value: 1,
                        groupValue: profService,
                        onChanged: (value){
                          setState(() {
                            profIndustrial = 0;
                            profKnowledge = 0;
                            profPublic = 0;
                            profService = value!;
                          });
                        } )
                  ],
                ),
              ],
            ),
          )
        ),
        floatingActionButton: FloatingActionButton(
            child: const Text('Enter'),
            onPressed: () {
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
              print(gender);
              print(maritalStatus);
              print(profIndustrial);
              print(profKnowledge);
              print(profPublic);
              print(profService);

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
                  gender,
                  maritalStatus,
                  profIndustrial,
                  profKnowledge,
                  profPublic,
                  profService
              );
            }),
        ),
      );
  }
}