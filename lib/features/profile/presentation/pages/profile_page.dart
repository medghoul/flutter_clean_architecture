import 'package:clean_architecture/extensions/context_extension.dart';
import 'package:clean_architecture/features/profile/presentation/cubits/profile_page_cubit/profile_page_cubit.dart';
import 'package:clean_architecture/features/profile/presentation/cubits/profile_page_cubit/profile_page_state.dart';
import 'package:clean_architecture/resources/res.dart';
import 'package:clean_architecture/routing/app_routes.dart';
import 'package:clean_architecture/widgets/layout/custom_scaffold.dart';
import 'package:clean_architecture/widgets/ui/custom_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  void _showSnackBar(BuildContext context, String message) {
    if (message.isNotEmpty) {
      final snackBar = SnackBar(content: Text(message), behavior: SnackBarBehavior.floating);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Widget _aboutMeSection(ProfilePageCubit cubit, ProfilePageState state, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: Dimension.paddingXS,
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                context.translate('profilePage.nameAndSurname'),
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              Text(
                '${state.name} ${state.surname}',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: Dimension.paddingS),
              Text(
                'Email',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              Text(
                state.email,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: Dimension.paddingS),
            ],
          ),
          IconButton(
            onPressed: () => GoRouter.of(context).pushNamed(AppRoute.editProfile.path),
            icon: const Icon(
              Icons.edit,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget drawer(ProfilePageCubit cubit, BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              ListTile(
                title: Text(context.translate('profilePage.editPersonalData')),
                onTap: () => GoRouter.of(context).pushNamed(AppRoute.editProfile.path),
              ),
              const Divider(),
              ListTile(
                title: Text(context.translate('profilePage.privacyPolicy')),
                onTap: (){
                  //TODO: implement privacy policy
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: Dimension.padding),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: ListTile(
                leading: const Icon(Icons.exit_to_app),
                title: Text(context.translate('generic.logout')),
                onTap: () async {
                  await cubit.logout(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfilePageCubit(),
      child: BlocBuilder<ProfilePageCubit, ProfilePageState>(
        builder: (context, state) {
          final cubit = context.read<ProfilePageCubit>();

          return CustomScaffold(
            appBarBody: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppBarTitle(title: context.translate('profilePage.myDatas')),
                const SizedBox(
                  height: Dimension.padding,
                ),
                _aboutMeSection(cubit, state, context),
              ],
            ),
            key: state.scaffoldKey,
            body: Builder(
              builder: (context) {
                return SafeArea(
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(Dimension.padding24),
                        child: Column(
                          children: [
                            ListTile(
                              onTap: () => GoRouter.of(context).pushNamed(AppRoute.settings.name),
                              trailing: const Icon(
                                Icons.chevron_right_rounded,
                                color: AppColors.primaryColor650,
                              ),
                              leading: const Icon(
                                Icons.settings_rounded,
                                color: AppColors.primaryColor650,
                              ),
                              title: Text(context.translate('profilePage.settings')),
                            ),
                            const SizedBox(height: Dimension.padding),
                            ListTile(
                              onTap: () => GoRouter.of(context).pushNamed(AppRoute.support.name),
                              trailing: const Icon(
                                Icons.chevron_right_rounded,
                                color: AppColors.primaryColor650,
                              ),
                              leading: const Icon(
                                Icons.help_outline,
                                color: AppColors.primaryColor650,
                              ),
                              title: Text(context.translate('profilePage.support')),
                            ),
                            const Spacer(),
                            ListTile(
                              onTap: () async => await cubit.logout(context),
                              trailing: const Icon(
                                Icons.chevron_right_rounded,
                                color: AppColors.primaryColor650,
                              ),
                              leading: const Icon(
                                Icons.logout_rounded,
                                color: AppColors.primaryColor650,
                              ),
                              title: Text(context.translate('profilePage.logout')),
                            ),
                          ],
                        ),
                      ),
                      if (state.showPageLoader) const CustomCircularProgressIndicator(),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
