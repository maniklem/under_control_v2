import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../assets/presentation/widgets/asset_status_dropdown_button.dart';
import '../../assets/utils/asset_status.dart';
import '../../core/presentation/widgets/glass_layer.dart';
import '../data/models/work_order/work_order_model.dart';
import '../domain/entities/work_order/work_order.dart';
import '../presentation/blocs/work_order_management/work_order_management_bloc.dart';

Future<dynamic> showWorkOrderCancelDialog({
  required BuildContext context,
  required WorkOrder workOrder,
}) {
  final formKey = GlobalKey<FormState>();
  String comment = '';
  String assetStatus = '';
  return showDialog(
    context: context,
    barrierColor: Colors.transparent,
    builder: (context) => StatefulBuilder(builder: (context, setInnerState) {
      return Material(
        color: Colors.transparent,
        child: GlassLayer(
          onDismiss: () => Navigator.pop(context),
          child: AlertDialog(
            actionsAlignment: MainAxisAlignment.spaceEvenly,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            title: Text(
              AppLocalizations.of(context)!.work_order_confirm_cancel,
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppLocalizations.of(context)!
                      .work_order_confirm_cancel_description,
                ),
                const SizedBox(
                  height: 4,
                ),
                Form(
                  key: formKey,
                  child: TextFormField(
                    minLines: 1,
                    maxLines: 6,
                    onChanged: (value) {
                      comment = value;
                    },
                    validator: (value) {
                      if (value!.trim().length < 5) {
                        return AppLocalizations.of(context)!
                            .validation_min_five_characters;
                      }
                      return null;
                    },
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!
                          .work_order_confirm_cancel_hint,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                if (workOrder.assetId.isNotEmpty)
                  AssetStatusDropdownButton(
                    assetStatus: assetStatus,
                    onSelected: (val) => setInnerState(() => assetStatus = val),
                  ),
              ],
            ),
            actions: [
              TextButton(
                child: Text(
                  AppLocalizations.of(context)!
                      .user_profile_add_user_personal_data_back,
                  style: TextStyle(
                    color: Theme.of(context).textTheme.headline1!.color,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: Text(
                  AppLocalizations.of(context)!.confirm,
                  style: const TextStyle(
                    color: Colors.amber,
                  ),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate() &&
                      (workOrder.assetId.isEmpty || assetStatus.isNotEmpty)) {
                    context.read<WorkOrderManagementBloc>().add(
                          CancelWorkOrderEvent(
                            workOrder: WorkOrderModel.fromWorkOrder(workOrder)
                                .copyWith(
                              assetStatus: AssetStatus.fromString(assetStatus),
                            ),
                            comment: comment,
                          ),
                        );
                    Navigator.pop(context, true);
                  }
                },
              ),
            ],
          ),
        ),
      );
    }),
  );
}
