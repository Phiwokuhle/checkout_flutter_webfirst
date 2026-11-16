import 'package:flutter/material.dart';
import 'package:refreshi_checkout/presentation/auth/widgets/sign_in_form.dart';
import 'package:refreshi_checkout/presentation/common/widgets/app_shell.dart';

/// Page-level composition only. Form controllers and validation live in SignInForm.
class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) => AssessmentShell(
    activeStep: 0,
    child: const Column(
      children: [
        SizedBox(height: 24),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 470),
          child: SignInForm(),
        ),
      ],
    ),
  );
}
