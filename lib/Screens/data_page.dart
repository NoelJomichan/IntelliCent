import 'package:flutter/material.dart';
import 'package:untitled/Python/sendRequest.dart';

class DataPage extends StatefulWidget {
  const DataPage({Key? key}) : super(key: key);

  static const String id = 'data page';

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
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
  int? gender;
  int? maritalStatus;
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

            onPressed: () async {
              final predictedSavings = await sendPostRequest(
                  ageController.text,
                  incomeController.text,
                  fixedExpenseController.text,
                  dailyNeedsController.text,
                  transportationController.text,
                  foodBevController.text,
                  healthcareController.text,
                  shoppingController.text,
                  servicesController.text,
                  othersController.text,
                  profIndustrial,
                  profKnowledge,
                  profPublic,
                  profService
              );

              if (predictedSavings != null) {
                showAlertDialog(context, 'Predicted Savings received: $predictedSavings');
                // print('Predicted Savings received: $predictedSavings');
              } else {
                print("Request failed.");
              }
              // sendPostRequest(
              //   24, 200000, 70000, 4, 9000, 8300, 9300, 3600, 18000, 9600, 12000,
              //     gender,
              //     maritalStatus,
              //     profIndustrial,
              //     profKnowledge,
              //     profPublic,
              //     profService
              // );
            }),
        ),
      );
  }
  void showAlertDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Predicted Savings'),
          content: Text(message), // Use the provided message
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the alert dialog
              },
            ),
          ],
        );
      },
    );
  }
}
