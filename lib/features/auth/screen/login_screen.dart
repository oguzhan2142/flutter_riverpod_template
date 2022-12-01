import 'package:education_social_platform_app/features/auth/repository/auth_repository.dart';
import 'package:education_social_platform_app/gen/assets.gen.dart';
import 'package:education_social_platform_app/global/model/app_response.dart';
import 'package:education_social_platform_app/global/model/auth.dart';
import 'package:education_social_platform_app/global/route/routes.dart';
import 'package:education_social_platform_app/global/widget/info_dialog.dart';
import 'package:education_social_platform_app/global/widget/scaffold_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widget/or.dart';

final _loginLoadingProvider = StateProvider<bool>((ref) {
  return false;
});

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: ScaffoldPadding(
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            const SizedBox(height: 30),
            Assets.svg.mobileLogin.svg(
              width: size.width * 0.5,
            ),
            const SizedBox(height: 50),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Kullanıcı Adı',
              ),
            ),
            const SizedBox(height: 10),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Şifre',
              ),
            ),
            const SizedBox(height: 30),
            Consumer(
              builder: (context, ref, child) {
                bool loading = ref.watch(_loginLoadingProvider);
                return ElevatedButton(
                  onPressed: loading ? null : () => _onLogin(ref),
                  child: const Text('Giriş Yap'),
                );
              },
            ),
            const SizedBox(height: 30),
            const Or(),
            const SizedBox(height: 20),
            Consumer(
              builder: (context, ref, child) {
                bool loading = ref.watch(_loginLoadingProvider);
                return TextButton(
                  onPressed: loading ? null : _navigateRegister,
                  child: const Text('Kayıt Ol'),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  void _onLogin(WidgetRef ref) async {
    ref.read(_loginLoadingProvider.notifier).state = true;
    AppResponse<Auth> response = await ref.read(authRepository).login(
          username: usernameController.text,
          password: passwordController.text,
        );

    ref.read(_loginLoadingProvider.notifier).state = false;
    if (response.isSuccess) {
      Auth.setInstance(response.data);
      if (mounted) {
        Navigator.pushNamed(context, Routes.MAIN);
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => InfoDialog(message: response.message ?? ''),
      );
    }
  }

  void _navigateRegister() {
    Navigator.of(context).pushNamed(Routes.REGISTER);
  }
}
