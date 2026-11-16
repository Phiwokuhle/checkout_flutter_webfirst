import 'package:flutter/material.dart';
import 'package:refreshi_checkout/presentation/auth/widgets/sign_in_form.dart';
import 'package:refreshi_checkout/presentation/common/widgets/app_shell.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) => AssessmentShell(
    activeStep: 0,
    child: Column(
      children: [
        const SizedBox(height: 24),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 470),
          child: const SignInForm(),
        ),
      ],
    ),
  );
}
