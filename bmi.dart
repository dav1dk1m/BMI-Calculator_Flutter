import 'package:flutter/material.dart';

class BMI extends StatefulWidget {
  @override
  _BMIState createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  final TextEditingController _weightController = TextEditingController();
  double _result = 0;
  int? _selectedFeet;
  int? _selectedInches;
  String _errorMessage = '';

  void calculateBMI() {
    if (_selectedFeet == null) {
      _showError('Enter feet');
      return;
    }
    if (_selectedInches == null) {
      _showError('Enter inches');
      return;
    }
    if (_weightController.text.isEmpty) {
      _showError('Enter weight');
      return;
    }

    int totalInches = (_selectedFeet ?? 0) * 12 + (_selectedInches ?? 0);
    double heightInInches = totalInches.toDouble();
    double weightInLbs = double.parse(_weightController.text);

    double heightInM = heightInInches * 0.0254;
    double weightInKg = weightInLbs * 0.45359237;

    double heightSquared = heightInM * heightInM;
    _result = weightInKg / heightSquared;
    _clearError();
    setState(() {});
  }

  void _showError(String errorMessage) {
    setState(() {
      _errorMessage = errorMessage;
    });
  }

  void _clearError() {
    setState(() {
      _errorMessage = '';
    });
  }

  String getWeightRange(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi >= 18.5 && bmi <= 25) {
      return 'Healthy Weight';
    } else if (bmi > 25 && bmi <= 30) {
      return 'Overweight';
    } else {
      return 'Severely Overweight';
    }
  }

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<int?>> feetDropdownItems = List.generate(
      5,
      (index) => DropdownMenuItem<int?>(
        value: index + 3,
        child: Text('${index + 3} feet'),
      ),
    );

    List<DropdownMenuItem<int?>> inchesDropdownItems = List.generate(
      12,
      (index) => DropdownMenuItem<int?>(
        value: index,
        child: Text('${index} inches'),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropdownButton<int?>(
                  value: _selectedFeet,
                  items: feetDropdownItems,
                  hint: Text('Feet'),
                  onChanged: (value) {
                    setState(() {
                      _selectedFeet = value;
                    });
                  },
                ),
                DropdownButton<int?>(
                  value: _selectedInches,
                  items: inchesDropdownItems,
                  hint: Text('Inches'),
                  onChanged: (value) {
                    setState(() {
                      _selectedInches = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 50),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Weight (lbs)',
              ),
            ),
            SizedBox(height: 50),
            OutlinedButton(
              child: Text('Calculate'),
              onPressed: calculateBMI,
            ),
            SizedBox(height: 50),
            Text('Result'),
            Text(
              _result == 0 ? 'Enter Value' : '${_result.toStringAsFixed(2)}',
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: 19.4,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20),
            Text(
              _result == 0 ? '' : getWeightRange(_result),
              style: TextStyle(
                fontSize: 19.4,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20),
            Text(
              _errorMessage,
              style: TextStyle(
                color: Colors.red,
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
