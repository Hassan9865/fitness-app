import 'package:fitness_tracker/components/app_colors.dart';
import 'package:fitness_tracker/components/default_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class ChangePasswordVerifyview extends StatefulWidget {
  const ChangePasswordVerifyview({super.key});

  @override
  State<ChangePasswordVerifyview> createState() =>
      _ChangePasswordVerifyviewState();
}

class _ChangePasswordVerifyviewState extends State<ChangePasswordVerifyview> {
  final TextEditingController _pinCodeController = TextEditingController();
  void _submit() {
    context.push('/newPasswordView');
  }

  void _onChange() {
    if (_pinCodeController.text.length == 6) {
      _submit();
    }
  }

  @override
  Widget build(BuildContext context) {
    final AppColors appColors = Provider.of<AppColors>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: appColors.background,
      appBar: AppBar(
        title: Text(
          "Enter Verification Code",
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width / 20,
            color: appColors.onSecondary,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            context.push('/settingsview');
          },
          icon: Icon(Icons.arrow_back, color: appColors.onSecondary),
        ),
        backgroundColor: appColors.background,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(38.0).copyWith(top: 80),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                "Enter the One-Time verification code sent to your email",
                style: defaultTextStyle(appColors: appColors),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(
              38.0,
            ).copyWith(top: MediaQuery.of(context).size.width / 3),
            child: PinCodeTextField(
              appContext: context,
              controller: _pinCodeController,
              enableActiveFill: true,
              length: 6,
              keyboardType: TextInputType.number,
              inputFormatters: [
                TextInputFormatter.withFunction((oldValue, newValue) {
                  if (newValue.text.contains(RegExp(r'[^0-9]'))) {
                    return oldValue;
                  }
                  return newValue;
                }),
              ],
              onChanged: (value) {
                _onChange();
              },
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 40,
                activeFillColor: appColors.onPrimary,
                inactiveFillColor: appColors.background,
                selectedFillColor: appColors.onPrimary,
                inactiveColor: appColors.onPrimary,
                selectedColor: appColors.onPrimary,
                errorBorderColor: appColors.error,
                activeColor: appColors.onPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
