import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoSnackbar extends GetSnackBar {
  const InfoSnackbar(final String message) : super(message: message);

  @override
  Widget? get messageText {
    return SelectableText(
      message!,
      style: GoogleFonts.poppins(
        color: Colors.white,
      ),
    );
  }

  @override
  SnackPosition get snackPosition => SnackPosition.TOP;

  @override
  Color get backgroundColor => Colors.blueGrey;

  @override
  Duration? get duration => const Duration(seconds: 20);

  @override
  Widget? get icon => const Icon(Icons.error_outlined, color: Colors.white);

  @override
  Widget? get mainButton {
    return IconButton(
      onPressed: () => Get.back(),
      icon: const Icon(Icons.close),
    );
  }
}
