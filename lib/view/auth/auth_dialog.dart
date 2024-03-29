import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:sanai3i/logic/auth/auth_bloc.dart';
import 'package:sanai3i/logic/auth/auth_state_event.dart';
import 'package:sanai3i/shared/localization/trans.dart';
import 'package:sanai3i/shared/theme/colors.dart';
import 'package:sanai3i/shared/theme/helper.dart';
import 'package:sanai3i/shared/theme/text_theme.dart';
import 'package:sanai3i/view/auth/country_code.dart';
import 'package:sanai3i/view/widgets/loading_overlay.dart';
import 'package:sanai3i/view/widgets/text_field.dart';

class AuthDialog extends StatefulWidget {
  const AuthDialog({Key? key}) : super(key: key);

  @override
  State<AuthDialog> createState() => _AuthDialogState();
}

class _AuthDialogState extends State<AuthDialog> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  String countryCode = '+20';
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return SizedBox(
          width: Get.width,
          child: KLoadingOverlay(
            isLoading: state.maybeWhen(loading: () => true, orElse: () => false),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Form(
                key: formKey,
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 60,
                        child: Center(
                          child: Text(
                            Tr.get.login_register,
                            style: KTextStyle.of(context).title,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      KTextFormField(
                        keyboardType: TextInputType.phone,
                        autofocus: true,
                        controller: _phoneController,
                        enabled: state.maybeWhen(codeSent: () => false, orElse: () => true),
                        validator: (value) {
                          RegExp regExp = RegExp(pattern);
                          if (value != null && value.isEmpty) {
                            return Tr.get.empty_phone;
                          } else if (!regExp.hasMatch(value!)) {
                            return Tr.get.wrong_phone;
                          }
                          return null;
                        },
                        hintText: Tr.get.phone,
                        errorText: state.whenOrNull(error: (error) => error),
                        prefixIcon: CountryCodeWidget(
                          onChanged: (code) {
                            countryCode = code?.dialCode ?? '+20';
                          },
                          onInit: (code) {
                            countryCode = code?.dialCode ?? '+20';
                          },
                        ),
                        suffixIcon: TextButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              AuthCubit.of(context).validatePhone(countryCode + _phoneController.text);
                            }
                          },
                          child: Text(Tr.get.send_code, style: KTextStyle.of(context).title),
                        ),
                      ),
                      if (AuthCubit.of(context).codeSentFlag)
                        Column(
                          children: [
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(child: Divider(color: KColors.of(context).divider, thickness: .5)),
                                Text(Tr.get.enter_6_digts, style: KTextStyle.of(context).body),
                                Expanded(child: Divider(color: KColors.of(context).divider, thickness: .5)),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Pinput(
                              length: 6,
                              errorText: state.whenOrNull(error: (error) => error),
                              onCompleted: (pin) => AuthCubit.of(context).validateCode(pin),
                              defaultPinTheme: PinTheme(
                                width: 56,
                                height: 56,
                                textStyle: KTextStyle.of(context).title,
                                decoration: BoxDecoration(
                                  border: Border.all(color: KColors.of(context).reBackground),
                                  borderRadius: BorderRadius.circular(KHelper.btnRadius),
                                ),
                              ),
                            ),
                          ],
                        ),
                      const SizedBox(height: 60),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
