/// Global constants for Flutter applications
/// 
/// This file contains commonly used constants that can be reused across
/// different Flutter applications. These values can be customized per project
/// by overriding them in a project-specific constants file.
class GlobalConstants {
  /// Default padding values
  static const double paddingXS = 4.0;
  static const double paddingS = 8.0;
  static const double paddingM = 16.0;
  static const double paddingL = 24.0;
  static const double paddingXL = 32.0;
  static const double paddingXXL = 48.0;

  /// Default margin values
  static const double marginXS = 4.0;
  static const double marginS = 8.0;
  static const double marginM = 16.0;
  static const double marginL = 24.0;
  static const double marginXL = 32.0;
  static const double marginXXL = 48.0;

  /// Border radius values
  static const double radiusXS = 4.0;
  static const double radiusS = 8.0;
  static const double radiusM = 12.0;
  static const double radiusL = 16.0;
  static const double radiusXL = 24.0;
  static const double radiusXXL = 32.0;

  /// Icon sizes
  static const double iconXS = 12.0;
  static const double iconS = 16.0;
  static const double iconM = 24.0;
  static const double iconL = 32.0;
  static const double iconXL = 48.0;
  static const double iconXXL = 64.0;

  /// Font sizes
  static const double fontXS = 12.0;
  static const double fontS = 14.0;
  static const double fontM = 16.0;
  static const double fontL = 18.0;
  static const double fontXL = 20.0;
  static const double fontXXL = 24.0;
  static const double fontHuge = 32.0;

  /// Animation durations
  static const Duration animationFast = Duration(milliseconds: 200);
  static const Duration animationNormal = Duration(milliseconds: 300);
  static const Duration animationSlow = Duration(milliseconds: 500);

  /// Network timeouts
  static const Duration timeoutShort = Duration(seconds: 10);
  static const Duration timeoutMedium = Duration(seconds: 30);
  static const Duration timeoutLong = Duration(seconds: 60);

  /// Cache durations
  static const Duration cacheShort = Duration(minutes: 5);
  static const Duration cacheMedium = Duration(hours: 1);
  static const Duration cacheLong = Duration(days: 1);

  /// Pagination
  static const int itemsPerPage = 20;
  static const int maxItemsPerRequest = 50;

  /// Layout constraints
  static const double mobileMaxWidth = 600;
  static const double tabletMaxWidth = 900;
  static const double desktopMaxWidth = 1200;

  /// Form constraints
  static const int minPasswordLength = 8;
  static const int maxPasswordLength = 32;
  static const int minUsernameLength = 3;
  static const int maxUsernameLength = 20;
  static const int maxEmailLength = 254; // RFC 5321
  static const int maxPhoneLength = 15;  // E.164 standard

  /// File size limits (in bytes)
  static const int maxImageSize = 5 * 1024 * 1024;  // 5MB
  static const int maxFileSize = 10 * 1024 * 1024;  // 10MB
  static const int maxAvatarSize = 2 * 1024 * 1024; // 2MB

  /// Image quality
  static const double highImageQuality = 0.9;
  static const double mediumImageQuality = 0.7;
  static const double lowImageQuality = 0.5;

  /// API related
  static const int maxRetryAttempts = 3;
  static const Duration retryDelay = Duration(seconds: 1);

  /// Debounce and throttle
  static const Duration defaultDebounceTime = Duration(milliseconds: 300);
  static const Duration defaultThrottleTime = Duration(milliseconds: 500);

  /// Default list spacing
  static const double listSpacing = 8.0;
  static const double listSpacingSmall = 4.0;
  static const double listSpacingLarge = 16.0;

  /// Form field spacing
  static const double formSpacing = 16.0;
  static const double formSpacingSmall = 8.0;
  static const double formSpacingLarge = 24.0;

  /// Progress indicators
  static const double progressIndicatorSize = 24.0;
  static const double progressIndicatorSizeSmall = 16.0;
  static const double progressIndicatorSizeLarge = 32.0;
  static const double progressIndicatorStrokeWidth = 3.0;

  /// Bottom sheet heights
  static const double bottomSheetHeaderHeight = 64.0;
  static const double bottomSheetMinHeight = 100.0;
  static const double bottomSheetMaxHeight = 600.0;

  /// App bar heights
  static const double appBarHeight = 56.0;
  static const double appBarHeightLarge = 128.0;

  /// Bottom navigation bar
  static const double bottomNavHeight = 56.0;
  static const double bottomNavItemWidth = 60.0;

  /// Drawer
  static const double drawerWidth = 304.0;
  static const double drawerMaxWidth = 400.0;

  /// FAB
  static const double fabSize = 56.0;
  static const double fabMiniSize = 40.0;
  static const double fabElevation = 6.0;
  
  /// Stepper
  static const double stepperIconSize = 30.0;
  static const double stepperLineThickness = 1.0;
  static const double stepperLineThicknessActive = 2.0;
  static const double stepperIconSmallSize = 16.0;
  static const double stepperLineIndent = 10.0;
  static const double stepperMinHeight = 60.0;
  
  /// Buttons
  static const double buttonMinWidth = 120.0;
  static const double buttonHeight = 45.0;
  static const double buttonMaxWidth = 150.0;
  static const double buttonBorderRadius = 12.0;
  
  /// Button specific sizes
  static const double buttonNormalHeight = 55.0;
  static const double buttonSmallHeight = 41.25;
  static const double buttonNormalMinWidth = 170.0;
  static const double buttonSmallMinWidth = 100.0;
  static const double buttonProgressIndicatorRatio = 0.7;
  static const double buttonTextSizeRatio = 0.7;
  
  /// Opacity values
  static const double opacityLow = 0.2;
  static const double opacityMedium = 0.5;
  static const double opacityHigh = 0.7;
  
  /// Shadows and Blurs
  static const double shadowBlurRadius = 4.0;
  static const double shadowSpreadRadius = 1.0;
}