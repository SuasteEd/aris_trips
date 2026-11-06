import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failure_message.dart';
import '../../../../core/theme/app_tokens.dart';
import '../cubit/login_cubit.dart';
import '../cubit/session_cubit.dart';
import '../widgets/login_validators.dart';

/// Email and password sign-in. Expects a [LoginCubit] and a [SessionCubit]
/// above it.
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    FocusScope.of(context).unfocus();
    if (!(_formKey.currentState?.validate() ?? false)) return;
    context.read<LoginCubit>().submit(
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state case LoginSuccess(:final admin)) {
          context.read<SessionCubit>().signedIn(admin);
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: BlocBuilder<LoginCubit, LoginState>(
                builder: (context, state) {
                  final submitting =
                      state is LoginSubmitting || state is LoginSuccess;
                  return AutofillGroup(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Icon(
                            Icons.flight_takeoff,
                            size: AppSpacing.xxl,
                            color: theme.colorScheme.primary,
                          ),
                          const SizedBox(height: AppSpacing.md),
                          Text(
                            'Aris Admin',
                            style: theme.textTheme.headlineSmall,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: AppSpacing.xs),
                          Text(
                            'Inicia sesión con tu cuenta de administrador.',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: AppSpacing.xl),
                          TextFormField(
                            key: const Key('login_email'),
                            controller: _emailController,
                            enabled: !submitting,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            autofillHints: const [AutofillHints.email],
                            autocorrect: false,
                            decoration: const InputDecoration(
                              labelText: 'Correo',
                            ),
                            validator: LoginValidators.email,
                          ),
                          const SizedBox(height: AppSpacing.md),
                          TextFormField(
                            key: const Key('login_password'),
                            controller: _passwordController,
                            enabled: !submitting,
                            obscureText: _obscurePassword,
                            textInputAction: TextInputAction.done,
                            autofillHints: const [AutofillHints.password],
                            onFieldSubmitted: (_) => _submit(),
                            decoration: InputDecoration(
                              labelText: 'Contraseña',
                              suffixIcon: IconButton(
                                tooltip: _obscurePassword
                                    ? 'Mostrar contraseña'
                                    : 'Ocultar contraseña',
                                icon: Icon(
                                  _obscurePassword
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                ),
                                onPressed: () => setState(
                                  () => _obscurePassword = !_obscurePassword,
                                ),
                              ),
                            ),
                            validator: LoginValidators.password,
                          ),
                          if (state case LoginFailure(:final failure)) ...[
                            const SizedBox(height: AppSpacing.md),
                            Text(
                              failure.message,
                              key: const Key('login_error'),
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.error,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                          const SizedBox(height: AppSpacing.lg),
                          FilledButton(
                            key: const Key('login_submit'),
                            onPressed: submitting ? null : _submit,
                            child: submitting
                                ? const SizedBox.square(
                                    dimension: AppSpacing.lg,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  )
                                : const Text('Iniciar sesión'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
