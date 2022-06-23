import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:sanai3i/logic/auth/auth_bloc.dart';
import 'package:sanai3i/logic/auth/auth_state_event.dart';
import 'package:sanai3i/shared/src/localization/trans.dart';
import 'package:sanai3i/shared/theme/colors.dart';
import 'package:sanai3i/shared/theme/helper.dart';
import 'package:sanai3i/shared/theme/text_theme.dart';
import 'package:sanai3i/view/widgets/loading_overlay.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return LoadingOverlay(
          isLoading: state.maybeWhen(loading: () => true, orElse: () => false),
          child: const WritingPhone(),
        );
      },
    );
  }
}

class WritingPhone extends StatefulWidget {
  const WritingPhone({Key? key}) : super(key: key);

  @override
  State<WritingPhone> createState() => _WritingPhoneState();
}

class _WritingPhoneState extends State<WritingPhone> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  String countryCode = '+20';
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
      child: Form(
        key: formKey,
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    autofocus: true,
                    controller: _phoneController,
                    style: KTextStyle.of(context).title,
                    textAlign: TextAlign.center,
                    cursorColor: KColors.of(context).cursor,
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
                    decoration: InputDecoration(
                      hintText: Tr.get.phone,
                      hintStyle: KTextStyle.of(context).hint,
                      suffixIcon: TextButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            AuthCubit.of(context).validatePhone(countryCode + _phoneController.text);
                          }
                        },
                        child: Text(Tr.get.send_code, style: KTextStyle.of(context).title),
                      ),
                      errorStyle: KTextStyle.of(context).error,
                      errorText: state.whenOrNull(error: (error) => error),
                      prefixIcon: CountryCodeWidget(
                        onChanged: (code) {
                          countryCode = code?.dialCode ?? '+20';
                        },
                        onInit: (code) {
                          countryCode = code?.dialCode ?? '+20';
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (AuthCubit.of(context).codeSentFlag)
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(child: Divider(color: KColors.of(context).divider, thickness: .5)),
                            Text(Tr.get.enter_6_digts, style: KTextStyle.of(context).hint),
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
                              border: Border.all(color: KColors.of(context).background),
                              borderRadius: BorderRadius.circular(KHelper.btnRadius),
                            ),
                          ),
                        ),
                      ],
                    )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class CountryCodeWidget extends StatelessWidget {
  final void Function(CountryCode?)? onChanged, onInit;
  const CountryCodeWidget({Key? key, this.onChanged, this.onInit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CountryCodePicker(
      onChanged: onChanged,
      showFlag: false,
      barrierColor: KColors.of(context).background,
      hideSearch: true,
      textStyle: KTextStyle.of(context).title,
      dialogTextStyle: KTextStyle.of(context).body,
      initialSelection: 'EG',
      favorite: const ['SA', 'EG', 'AE', 'SY', 'OM', 'MC', 'KW', 'JO', 'IR', 'IQ', 'PS', 'QA', 'BH', 'YE', 'TN', 'DZ', 'LB', 'LY'],
      showFlagDialog: true,
      closeIcon: Icon(Icons.close, color: KColors.of(context).icon),
      dialogBackgroundColor: KColors.of(context).codePicker,
      comparator: (a, b) => b.name!.compareTo(a.name!),
      onInit: onInit,
    );
  }
}
