import 'package:flutter/material.dart';

import '../design_tokens/color_tokens.dart';

@immutable
class VentraSemanticColors extends ThemeExtension<VentraSemanticColors> {
  final Color success;
  final Color successSurface;
  final Color warning;
  final Color warningSurface;
  final Color error;
  final Color errorSurface;
  final Color info;
  final Color infoSurface;
  final Color ai;
  final Color aiSurface;

  const VentraSemanticColors({required this.success, required this.successSurface, required this.warning, required this.warningSurface, required this.error, required this.errorSurface, required this.info, required this.infoSurface, required this.ai, required this.aiSurface});

  static const light = VentraSemanticColors(
    success: VentraColors.success, successSurface: VentraColors.successSurface,
    warning: VentraColors.warning, warningSurface: VentraColors.warningSurface,
    error: VentraColors.error, errorSurface: VentraColors.errorSurface,
    info: VentraColors.info, infoSurface: VentraColors.infoSurface,
    ai: VentraColors.ai, aiSurface: VentraColors.aiSurface,
  );

  @override
  VentraSemanticColors copyWith({Color? success, Color? successSurface, Color? warning, Color? warningSurface, Color? error, Color? errorSurface, Color? info, Color? infoSurface, Color? ai, Color? aiSurface}) => VentraSemanticColors(
    success: success ?? this.success, successSurface: successSurface ?? this.successSurface,
    warning: warning ?? this.warning, warningSurface: warningSurface ?? this.warningSurface,
    error: error ?? this.error, errorSurface: errorSurface ?? this.errorSurface,
    info: info ?? this.info, infoSurface: infoSurface ?? this.infoSurface,
    ai: ai ?? this.ai, aiSurface: aiSurface ?? this.aiSurface,
  );

  @override
  VentraSemanticColors lerp(covariant ThemeExtension<VentraSemanticColors>? other, double t) {
    if (other is! VentraSemanticColors) return this;
    return VentraSemanticColors(
      success: Color.lerp(success, other.success, t)!, successSurface: Color.lerp(successSurface, other.successSurface, t)!,
      warning: Color.lerp(warning, other.warning, t)!, warningSurface: Color.lerp(warningSurface, other.warningSurface, t)!,
      error: Color.lerp(error, other.error, t)!, errorSurface: Color.lerp(errorSurface, other.errorSurface, t)!,
      info: Color.lerp(info, other.info, t)!, infoSurface: Color.lerp(infoSurface, other.infoSurface, t)!,
      ai: Color.lerp(ai, other.ai, t)!, aiSurface: Color.lerp(aiSurface, other.aiSurface, t)!,
    );
  }
}

extension VentraThemeContext on BuildContext {
  VentraSemanticColors get ventraColors => Theme.of(this).extension<VentraSemanticColors>() ?? VentraSemanticColors.light;
}