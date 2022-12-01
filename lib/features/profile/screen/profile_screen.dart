import 'package:education_social_platform_app/global/model/auth.dart';
import 'package:education_social_platform_app/global/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ionicons/ionicons.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text(Auth.getInstance()?.user?.getFullName ?? ''),
          Text('@${Auth.getInstance()?.user?.username}'),
          ListTile(
            title: const Text('Çıkış Yap'),
            onTap: () async {
              Auth.getInstance()?.removeFromPrefs();
              Auth.setInstance(null);
              Navigator.pushNamedAndRemoveUntil(context, Routes.LOGIN, (route) => false);
            },
            leading: const Icon(Ionicons.log_out_outline),
          ),
        ],
      ),
    );
  }
}
