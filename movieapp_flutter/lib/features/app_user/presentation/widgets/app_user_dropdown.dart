import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp_flutter/features/app_user/presentation/cubit/app_user_cubit.dart';
import 'package:movieapp_flutter/features/auth/presentation/bloc/auth_bloc.dart';

class AppUserDropdown extends StatelessWidget {
  const AppUserDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppUserCubit, AppUserState>(
      builder: (context, state) {
        if (state is! AppUserLoggedIn) {
          return const Text("login");
        }

        return PopupMenuButton(
          itemBuilder: (context) {
            return [
              PopupMenuItem(child: Text(state.user.username)),
              PopupMenuItem(
                onTap: () {
                  context.read<AuthBloc>().add(AuthLogoutEvent());
                },
                child: const Text('Logout'),
              ),
            ];
          },
        );
      },
    );
  }
}
