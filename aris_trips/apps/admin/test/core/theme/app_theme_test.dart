import 'package:aris_admin/core/theme/app_theme.dart';
import 'package:aris_admin/core/theme/app_tokens.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('light theme is built from tokens', () {
    final theme = AppTheme.light;

    expect(theme.useMaterial3, isTrue);
    expect(theme.colorScheme.primary, AppColors.primary);
    expect(theme.colorScheme.error, AppColors.error);
    expect(theme.scaffoldBackgroundColor, AppColors.background);
    expect(
      theme.textTheme.titleLarge?.fontSize,
      AppTypography.textTheme.titleLarge?.fontSize,
    );
  });
}
