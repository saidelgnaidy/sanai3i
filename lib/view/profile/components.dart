import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sanai3i/logic/complete_register/complete_reg_state.dart';
import 'package:sanai3i/logic/complete_register/complete_regster.dart';
import 'package:sanai3i/models/auth/register_model.dart';
import 'package:sanai3i/shared/const.dart';
import 'package:sanai3i/shared/src/localization/trans.dart';
import 'package:sanai3i/shared/theme/colors.dart';
import 'package:sanai3i/shared/theme/text_theme.dart';
import 'package:sanai3i/view/widgets/button_to_dialog.dart';

class KCheckMark extends StatelessWidget {
  final Widget child;
  final bool checked;
  const KCheckMark({Key? key, required this.child, required this.checked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          left: 10,
          child: IgnorePointer(
            child: KIconButton(
              child: checked ? const Icon(Icons.check, color: Colors.green) : const Icon(Icons.close, color: Colors.red),
            ),
          ),
        )
      ],
    );
  }
}

class KSelectAccType extends StatelessWidget {
  final String title;
  const KSelectAccType({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KButtonToDialog(
      tag: Tr.get.select_location,
      title: title,
      dialog: SizedBox(
        width: Get.width * .7,
        child: BlocBuilder<CompleteRegisterBloc, CompleteRegisterState>(
          builder: (context, state) {
            return Column(
              children: [
                SizedBox(
                  height: 60,
                  child: Center(
                    child: Text(
                      Tr.get.acc_type,
                      style: KTextStyle.of(context).title,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Divider(color: KColors.of(context).divider, height: 1),
                const SizedBox(height: 10),
                RadioListTile(
                  value: AccType.client,
                  groupValue: CompleteRegisterBloc.of(context).accType,
                  title: Text(
                    Tr.get.client,
                    style: KTextStyle.of(context).title,
                  ),
                  onChanged: CompleteRegisterBloc.of(context).setAccType,
                ),
                RadioListTile(
                  value: AccType.serviceProvider,
                  groupValue: CompleteRegisterBloc.of(context).accType,
                  title: Text(
                    Tr.get.service_provider,
                    style: KTextStyle.of(context).title,
                  ),
                  onChanged: CompleteRegisterBloc.of(context).setAccType,
                ),
                const SizedBox(height: 10),
              ],
            );
          },
        ),
      ),
    );
  }
}
