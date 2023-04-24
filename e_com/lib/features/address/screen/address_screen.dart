import 'package:e_com/common/widgets/custom_button.dart';
import 'package:e_com/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:pay/pay.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../../common/widgets/custom_widgets.dart';
import '../../../constants/global_variable.dart';
import '../../../constants/utils.dart';
import '../services/address_services.dart';

class AddressScreen extends StatefulWidget {
  static const String routeName = '/address';
  final String totalAmount;
  const AddressScreen({super.key, required this.totalAmount});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  //RAZORPAY SETUP******************************************/
  Razorpay razorpay = Razorpay();
  //Opening razorpay
  void openCheckout() {
    var options = {
      "key": "rzp_test_kts0naJ8Vehrog",
      "amount": num.parse(widget.totalAmount) * 100,
      "name": "ReWear",
      "description": "TOTAL AMOUNT",
      "prefill": {
        "contact": "9898989898",
        "email": "test@test.com",
      },
      "external": {
        "wallets": ["paytm"],
      }
    };

    try {
      razorpay.open(options);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  //Handling results

  void handlePaymentSuccess(PaymentSuccessResponse res) {
    try {
      if (Provider.of<UserProvider>(context, listen: false)
          .user
          .address
          .isEmpty) {
        addressServices.saveUserAddress(
            context: context, address: addressToBeUsed);
      }

      addressServices.placeOrder(
        context: context,
        address: addressToBeUsed,
        totalSum: double.parse(widget.totalAmount),
      );

      paymentItems.add(PaymentItem(
          amount: widget.totalAmount,
          label: 'Total Amount',
          status: PaymentItemStatus.final_price));
    } catch (e) {
      showSnackBar(context, e.toString());
    }

    showSnackBar(context, "ORDER SUCCESSFUL");
  }

  void handlePaymentError(PaymentFailureResponse res) {
    showSnackBar(context, "ORDER FAILURE");
  }

  void handleExternalWallet(ExternalWalletResponse res) {
    showSnackBar(context, "EXTERNAL WALLET");
  }

  //****************************************************** */

  //Variables
  final TextEditingController flatBuildingController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final _addressFormKey = GlobalKey<FormState>();
  String addressToBeUsed = "";
  List<PaymentItem> paymentItems = [];
  final AddressServices addressServices = AddressServices();

  @override
  void initState() {
    super.initState();
    paymentItems.add(
      PaymentItem(
        amount: widget.totalAmount,
        label: 'Total Amount',
        status: PaymentItemStatus.final_price,
      ),
    );
    razorpay = Razorpay();

    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    flatBuildingController.dispose();
    areaController.dispose();
    pincodeController.dispose();
    cityController.dispose();
    razorpay.clear();
  }

  void onApplePayResult(res) {
    if (Provider.of<UserProvider>(context, listen: false)
        .user
        .address
        .isEmpty) {
      addressServices.saveUserAddress(
          context: context, address: addressToBeUsed);
    }
    addressServices.placeOrder(
      context: context,
      address: addressToBeUsed,
      totalSum: double.parse(widget.totalAmount),
    );
  }

  void onGooglePayResult(res) {
    if (Provider.of<UserProvider>(context, listen: false)
        .user
        .address
        .isEmpty) {
      addressServices.saveUserAddress(
          context: context, address: addressToBeUsed);
    }
    addressServices.placeOrder(
      context: context,
      address: addressToBeUsed,
      totalSum: double.parse(widget.totalAmount),
    );
  }

  void payPressed(String addressFromProvider) {
    addressToBeUsed = "";

    bool isForm = flatBuildingController.text.isNotEmpty ||
        areaController.text.isNotEmpty ||
        pincodeController.text.isNotEmpty ||
        cityController.text.isNotEmpty;

    if (isForm) {
      if (_addressFormKey.currentState!.validate()) {
        addressToBeUsed =
            '${flatBuildingController.text}, ${areaController.text}, ${cityController.text} - ${pincodeController.text}';
      } else {
        throw Exception('Please enter all the values!');
      }
    } else if (addressFromProvider.isNotEmpty) {
      addressToBeUsed = addressFromProvider;
    } else {
      showSnackBar(context, 'ERROR');
    }
  }

  @override
  Widget build(BuildContext context) {
    var address = context.watch<UserProvider>().user.address;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 252, 250, 235),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(55),
          child: AppBar(
            title: const Text(
              'Address',
              style: TextStyle(color: Colors.black),
            ),
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: GlobalVariables.appBarGradient,
              ),
            ),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              if (address.isNotEmpty)
                Column(children: [
                  Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black12,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                            Text(address, style: const TextStyle(fontSize: 18)),
                      )),
                  const SizedBox(height: 10),
                  const Text(
                    'OR',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),
                ]),
              Form(
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
              ApplePayButton(
                width: double.infinity,
                style: ApplePayButtonStyle.whiteOutline,
                type: ApplePayButtonType.buy,
                // ignore: deprecated_member_use
                paymentConfigurationAsset: 'applepay.json',
                onPaymentResult: onApplePayResult,
                paymentItems: paymentItems,
                margin: const EdgeInsets.only(top: 15),
                height: 50,
                onPressed: () => payPressed(address),
              ),
              const SizedBox(height: 10),
              GooglePayButton(
                onPressed: () => payPressed(address),
                // ignore: deprecated_member_use
                paymentConfigurationAsset: 'gpay.json',
                onPaymentResult: onGooglePayResult,
                paymentItems: paymentItems,
                type: GooglePayButtonType.pay,
                margin: const EdgeInsets.only(top: 15),
                loadingIndicator: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     payPressed(address);
              //     openCheckout();
              //   },
              //   child: const Text(
              //     "RAZORPAY",
              //     style: TextStyle(color: Colors.black),
              //   ),
              // ),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                  text: "RAZORPAY",
                  onTap: () {
                    payPressed(address);
                    openCheckout();
                  },
                  color: GlobalVariables.mainColor)
            ],
          ),
        ),
      ),
    );
  }
}
