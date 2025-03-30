import 'dart:ui';

/// Core color palette for Flutter applications.
/// 
/// This class provides a standard set of colors that can be used across
/// different Flutter applications. Colors are defined using standard
/// Material Design color values.
class AppColors {
  /// Primary colors
  static const Color primary = Color(0xFF1976D2);      // Material Blue 700
  static const Color primaryLight = Color(0xFF42A5F5);  // Material Blue 400
  static const Color primaryDark = Color(0xFF1565C0);   // Material Blue 800

  /// Secondary colors
  static const Color secondary = Color(0xFF00796B);     // Material Teal 700
  static const Color secondaryLight = Color(0xFF26A69A); // Material Teal 400
  static const Color secondaryDark = Color(0xFF00695C);  // Material Teal 800

  /// Accent colors
  static const Color accent = Color(0xFFFFA726);        // Material Orange 400
  static const Color accentLight = Color(0xFFFFB74D);   // Material Orange 300
  static const Color accentDark = Color(0xFFF57C00);    // Material Orange 700

  /// Semantic colors
  static const Color success = Color(0xFF4CAF50);       // Material Green 500
  static const Color warning = Color(0xFFFFC107);       // Material Amber 500
  static const Color error = Color(0xFFF44336);         // Material Red 500
  static const Color info = Color(0xFF2196F3);          // Material Blue 500

  /// Neutral colors
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color transparent = Color(0x00000000);

  /// Grey scale
  static const Color grey50 = Color(0xFFFAFAFA);
  static const Color grey100 = Color(0xFFF5F5F5);
  static const Color grey200 = Color(0xFFEEEEEE);
  static const Color grey300 = Color(0xFFE0E0E0);
  static const Color grey400 = Color(0xFFBDBDBD);
  static const Color grey500 = Color(0xFF9E9E9E);
  static const Color grey600 = Color(0xFF757575);
  static const Color grey700 = Color(0xFF616161);
  static const Color grey800 = Color(0xFF424242);
  static const Color grey900 = Color(0xFF212121);

  /// Text colors
  static const Color textPrimary = Color(0xFF212121);    // Grey 900
  static const Color textSecondary = Color(0xFF757575);  // Grey 600
  static const Color textHint = Color(0xFF9E9E9E);       // Grey 500
  static const Color textDisabled = Color(0xFFBDBDBD);   // Grey 400

  /// Background colors
  static const Color background = Color(0xFFFFFFFF);     // White
  static const Color backgroundDark = Color(0xFF121212); // Material Dark theme background
  static const Color surface = Color(0xFFFFFFFF);        // White
  static const Color surfaceVariant = Color(0xFFF5F5F5); // Grey 100

  /// Border colors
  static const Color border = Color(0xFFE0E0E0);         // Grey 300
  static const Color borderLight = Color(0xFFEEEEEE);    // Grey 200
  static const Color borderDark = Color(0xFFBDBDBD);     // Grey 400

  /// Overlay colors
  static const Color overlay = Color(0x52000000);        // 32% black
  static const Color overlayLight = Color(0x26000000);   // 15% black
  static const Color overlayDark = Color(0x80000000);    // 50% black

  /// Shadow colors
  static const Color shadow = Color(0x1F000000);         // 12% black
  static const Color shadowLight = Color(0x0A000000);    // 4% black
  static const Color shadowDark = Color(0x3D000000);     // 24% black

  /// Status colors variants
  static const Color successLight = Color(0xFFA5D6A7);   // Material Green 200
  static const Color successDark = Color(0xFF388E3C);    // Material Green 700
  static const Color warningLight = Color(0xFFFFE082);   // Material Amber 200
  static const Color warningDark = Color(0xFFFFA000);    // Material Amber 700
  static const Color errorLight = Color(0xFFEF9A9A);     // Material Red 200
  static const Color errorDark = Color(0xFFD32F2F);      // Material Red 700
  static const Color infoLight = Color(0xFF90CAF9);      // Material Blue 200
  static const Color infoDark = Color(0xFF1976D2);       // Material Blue 700

  /// Social media colors
  static const Color facebook = Color(0xFF1877F2);
  static const Color google = Color(0xFFDB4437);
  static const Color apple = Color(0xFF000000);
  static const Color twitter = Color(0xFF1DA1F2);
  static const Color linkedin = Color(0xFF0A66C2);

  /// Chart colors
  static const List<Color> chartColors = [
    Color(0xFF2196F3), // Blue
    Color(0xFFFFA726), // Orange
    Color(0xFF66BB6A), // Green
    Color(0xFFEF5350), // Red
    Color(0xFF9C27B0), // Purple
    Color(0xFF009688), // Teal
  ];
}
