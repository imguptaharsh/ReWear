import 'package:e_com/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/widgets/custom_button.dart';
import '../../../common/widgets/custom_widgets.dart';
import '../../../constants/global_variable.dart';

class AddressScreen extends StatefulWidget {
  static const String routeName = '/address';
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final TextEditingController flatBuildingController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final _addressFormKey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    flatBuildingController.dispose();
    areaController.dispose();
    pincodeController.dispose();
    cityController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var address = context.watch<UserProvider>().user.address;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(55),
          child: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: GlobalVariables.appBarGradient,
              ),
            ),
          )),
      body: Form(
        key: _addressFormKey,
        child: Column(
          children: [
            CustomTextField(
              controller: flatBuildingController,
              hintText: 'Flat, House no, Building',
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: areaController,
              hintText: 'Area, Street',
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: pincodeController,
              hintText: 'Pincode',
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: cityController,
              hintText: 'Town/City',
            ),
          ],
        ),
      ),
    );
  }
}
