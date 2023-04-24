import 'package:e_com/common/widgets/custom_button.dart';
// import 'package:e_com/common/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';

import '../../constants/global_variable.dart';

class CarbonFootprintCalculator extends StatefulWidget {
  const CarbonFootprintCalculator({super.key});

  static const String routeName = '/corbon';

  @override
  // ignore: library_private_types_in_public_api
  _CarbonFootprintCalculatorState createState() =>
      _CarbonFootprintCalculatorState();
}

class _CarbonFootprintCalculatorState extends State<CarbonFootprintCalculator> {
  double carbonFootprint = 0.0;
  // Define variables to store user inputs
  double electricity = 0.0;

  double gas = 0.0;
  double waste = 0.0;
  double water = 0.0;

  // Define a function to calculate the carbon footprint
  void calculateCarbonFootprint() {
    setState(() {
      carbonFootprint =
          electricity * 0.57 + gas * 0.19 + waste * 1.48 + water * 0.07;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 252, 250, 235),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          // ignore: prefer_const_constructors
          title: Text(
            'Carbon Footprint',
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                // ignore: prefer_const_constructors
                decoration: InputDecoration(
                    labelText: 'Electricity (kWh)',
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.black,
                    )),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.black,
                    ))),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  electricity = double.tryParse(value) ?? 0.0;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: const InputDecoration(
                    labelText: 'Gas (therms)',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.black,
                    )),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.black,
                    ))),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  gas = double.tryParse(value) ?? 0.0;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                // ignore: prefer_const_constructors
                decoration: InputDecoration(
                    labelText: 'Waste (lbs)',
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.black,
                    )),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.black,
                    ))),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  waste = double.tryParse(value) ?? 0.0;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: const InputDecoration(
                    labelText: 'Water (gal)',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.black,
                    )),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.black,
                    ))),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  water = double.tryParse(value) ?? 0.0;
                },
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: ElevatedButton(
            //     onPressed: calculateCarbonFootprint,
            //     child: const Text('Calculate'),
            //   ),
            // ),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomButton(
                  text: 'Calculate',
                  onTap: calculateCarbonFootprint,
                  color: GlobalVariables.mainColor,
                )),
            if (carbonFootprint != 0)
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Your carbon footprint ',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
            if (carbonFootprint != 0)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  carbonFootprint.toStringAsFixed(2),
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            // ignore: prefer_const_constructors
            if (carbonFootprint != 0)
              const Padding(
                padding: EdgeInsets.all(2.0),
                // ignore: prefer_const_constructors
                child: Text(
                  'metric tons of CO2 equivalent.',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
