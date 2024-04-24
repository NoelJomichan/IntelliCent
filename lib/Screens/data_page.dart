import 'package:flutter/material.dart';
import 'package:untitled/Python/sendRequest.dart';
import 'package:shared_preferences/shared_preferences.dart';

void showAlertDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Predicted Savings'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop(); // Closes the alert dialog
            },
          ),
        ],
      );
    },
  );
}

void showGeneralAlert(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Input Error'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop(); // Closes the alert dialog
            },
          ),
        ],
      );
    },
  );
}

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

  late SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    initSharedPreferences();
  }

  void initSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IntelliCent',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        fontFamily: 'Open Sans',
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey[200],
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            primary: Colors.white,
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('IntelliCent'),
          backgroundColor: Colors.blueGrey[800],
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 10.0),
                _buildTextFormField(ageController, 'Enter your age', 'Please enter age'),
                SizedBox(height: 16.0),
                _buildTextFormField(incomeController, 'Enter your income', 'Please enter income'),
                SizedBox(height: 16.0),
                _buildTextFormField(fixedExpenseController, 'Enter your fixed expense', 'Please enter fixed expense'),
                SizedBox(height: 16.0),
                _buildTextFormField(dailyNeedsController, 'Enter the amount you spent on daily needs', 'Please enter amount you spent on daily needs'),
                SizedBox(height: 16.0),
                _buildTextFormField(transportationController, 'Enter the amount you spent on transportation', 'Please enter amount you spent on transportation'),
                SizedBox(height: 16.0),
                _buildTextFormField(foodBevController, 'Enter amount you spent on Food and Beverages', 'Please enter Food and Beverage amount'),
                SizedBox(height: 16.0),
                _buildTextFormField(healthcareController, 'Enter amount spent on healthcare', 'Please enter amount spent on healthcare'),
                SizedBox(height: 16.0),
                _buildTextFormField(shoppingController, 'Enter amount spent on shopping', 'Please enter amount spent on shopping'),
                SizedBox(height: 16.0),
                _buildTextFormField(servicesController, 'Enter amount spent on services', 'Please enter amount spent on services'),
                SizedBox(height: 16.0),
                _buildTextFormField(othersController, 'Enter amount spent on other expenses', 'Please enter amount spent on other expenses'),
                SizedBox(height: 20.0),
                const Text('Profession', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                _buildRadioListTile('Industrial', 1, profIndustrial, (val) {
                  setState(() {
                    profIndustrial = val!;
                    profKnowledge = 0;
                    profPublic = 0;
                    profService = 0;
                  });
                }),
                _buildRadioListTile('Knowledge', 1, profKnowledge, (val) {
                  setState(() {
                    profIndustrial = 0;
                    profKnowledge = val!;
                    profPublic = 0;
                    profService = 0;
                  });
                }),
                _buildRadioListTile('Public', 1, profPublic, (val) {
                  setState(() {
                    profIndustrial = 0;
                    profKnowledge = 0;
                    profPublic = val!;
                    profService = 0;
                  });
                }),
                _buildRadioListTile('Service', 1, profService, (val) {
                  setState(() {
                    profIndustrial = 0;
                    profKnowledge = 0;
                    profPublic = 0;
                    profService = val!;
                  });
                }),
                SizedBox(height: 20.0),
                ElevatedButton(
                  child: const Text('Enter'),
                  onPressed: () async {
                    String? username = sharedPreferences.getString('username');
                    if (_formKey.currentState?.validate() ?? false) {
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
                          profService,
                          username
                      );

                      if (predictedSavings != null) {
                        showAlertDialog(context, 'Predicted Savings received: $predictedSavings');
                      } else {
                        print("Request failed.");
                      }
                    } else {
                      showGeneralAlert(context, 'Please fill in all fields before submitting.');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField(TextEditingController controller, String label, String errorText) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return errorText;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: label,
      ),
    );
  }

  Widget _buildRadioListTile(String title, int value, int groupValue, Function(int?) onChanged) {
    return RadioListTile(
      title: Text(title),
      value: value,
      groupValue: groupValue,
      onChanged: (int? newValue) => onChanged(newValue),
    );
  }
}