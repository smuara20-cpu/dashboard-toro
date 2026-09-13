import 'package:flutter/material.dart';

import '../design_tokens/color_tokens.dart';
import 'dark_theme.dart';
import 'light_theme.dart';
import 'theme_extensions.dart';

abstract final class VentraThemeData {
  static ThemeData get light => lightTheme.copyWith(
        extensions: const <ThemeExtension<dynamic>>[
          VentraSemanticColors.light,
        ],
      );

  static ThemeData get dark => darkTheme.copyWith(
        extensions: const <ThemeExtension<dynamic>>[
          VentraSemanticColors.light,
        ],
      );

  static Color semanticAiColor(BuildContext context) {
    return Theme.of(context).extension<VentraSemanticColors>()?.ai ??
        VentraColors.ai;
  }
}
