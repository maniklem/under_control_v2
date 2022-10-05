import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/presentation/widgets/custom_text_form_field.dart';
import '../../../../core/presentation/widgets/image_viewer.dart';
import '../../../../core/presentation/widgets/overlay_icon_button.dart';
import '../../../../core/utils/responsive_size.dart';
import '../../../../core/utils/show_snack_bar.dart';
import '../../../../core/utils/size_config.dart';
import '../../../domain/entities/instruction_step.dart';

class PdfStep extends StatelessWidget with ResponsiveSize {
  const PdfStep({
    Key? key,
    required this.step,
    required this.updateStep,
  }) : super(key: key);

  final InstructionStep step;

  final Function(InstructionStep) updateStep;

  void _pickPdfFile(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      File file = File(result.files.single.path!);
    }
    // try {
    //   final pickedFile = await picker.pickImage(
    //     source: souruce,
    //     imageQuality: 100,
    //     maxHeight: 2000,
    //     maxWidth: 2000,
    //   );
    //   if (pickedFile != null) {
    //     updateStep(
    //       InstructionStep(
    //         id: step.id,
    //         contentType: step.contentType,
    //         contentUrl: step.contentUrl,
    //         title: step.title,
    //         description: step.description,
    //         file: File(pickedFile.path),
    //       ),
    //     );
    //   }
    // } catch (e) {
    //   showSnackBar(
    //     context: context,
    //     message: AppLocalizations.of(context)!
    //         .user_profile_add_user_image_pisker_error,
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        children: [
          // image
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/pdf.png',
                  fit: BoxFit.fill,
                ),
              ),
              if (step.contentUrl != null)
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ImageViewer(
                          imageProvider:
                              CachedNetworkImageProvider(step.contentUrl!),
                          heroTag: step.contentUrl!,
                          title: '',
                        ),
                      ),
                    );
                  },
                  child: SizedBox(
                    width: responsiveSizePct(small: 100),
                    height: responsiveSizePct(small: 100),
                    child: CachedNetworkImage(
                      imageUrl: step.contentUrl!,
                      placeholder: (context, url) => const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => const SizedBox(),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              if (step.file != null)
                SizedBox(
                  width: responsiveSizePct(small: 100),
                  height: responsiveSizePct(small: 100),
                  child: Image.file(
                    step.file!,
                    fit: BoxFit.fitWidth,
                  ),
                ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (step.file != null)
                OverlayIconButton(
                  onPressed: () => updateStep(
                    InstructionStep(
                      id: step.id,
                      contentType: step.contentType,
                      contentUrl: step.contentUrl,
                      title: step.title,
                      description: step.description,
                      file: null,
                    ),
                  ),
                  icon: Icons.clear,
                  title: AppLocalizations.of(context)!.reset_image,
                ),
              OverlayIconButton(
                onPressed: () => _pickPdfFile(context),
                icon: FontAwesomeIcons.filePdf,
                title: AppLocalizations.of(context)!.content_pdf,
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          // header
          CustomTextFormField(
            initialValue: step.title,
            fieldKey: 'header',
            labelText: AppLocalizations.of(context)!.header,
            keyboardType: TextInputType.name,
            textCapitalization: TextCapitalization.sentences,
            validator: (val) {
              if (val!.length < 2) {
                return AppLocalizations.of(context)!
                    .validation_min_two_characters;
              }
              return null;
            },
            onChanged: (val) {
              if (val!.trim().isNotEmpty) {
                updateStep(
                  InstructionStep(
                    id: step.id,
                    contentType: step.contentType,
                    contentUrl: step.contentUrl,
                    description: step.description,
                    file: step.file,
                    title: val.trim(),
                  ),
                );
              }
            },
          ),
          const SizedBox(
            height: 16,
          ),
          // description
          CustomTextFormField(
            initialValue: step.description,
            fieldKey: 'description',
            labelText: AppLocalizations.of(context)!.description_optional,
            keyboardType: TextInputType.name,
            textCapitalization: TextCapitalization.sentences,
            maxLines: 8,
            onChanged: (val) {
              if (val!.trim().isNotEmpty) {
                updateStep(
                  InstructionStep(
                    id: step.id,
                    contentType: step.contentType,
                    contentUrl: step.contentUrl,
                    description: val.trim(),
                    file: step.file,
                    title: step.title,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
