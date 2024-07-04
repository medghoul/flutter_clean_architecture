import 'package:clean_architecture/features/login/presentation/cubits/login_cubit.dart';
import 'package:clean_architecture/features/login/presentation/cubits/login_state.dart';
import 'package:clean_architecture/i18n/translations.dart';
import 'package:clean_architecture/resources/res.dart';
import 'package:clean_architecture/routing/app_routes.dart';
import 'package:clean_architecture/widgets/ui/custom_circular_progress_indicator.dart';
import 'package:clean_architecture/widgets/ui/text_form_fields/email_text_form_field.dart';
import 'package:clean_architecture/widgets/ui/text_form_fields/password_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _keyboardVisible = false;

  @override
  @protected
  void initState() {
    super.initState();
    /*KeyboardVisibilityController().onChange.listen((bool visible) {
      if (mounted) {
        setState(() {
          _keyboardVisible = visible;
        });
      }
    });*/
  }

  void _showSnackBar(BuildContext context, String message) {
    if (message.isNotEmpty) {
      final snackBar =
          SnackBar(content: Text(message), behavior: SnackBarBehavior.floating);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future<void> _showForgotPasswordDialog(LoginPageCubit cubit) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          //backgroundColor: Colors.grey,
          title: Text(
            translation.loginPage.recoverPassword,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.black),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  translation.loginPage.insertEmailToRecoverPwd,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black),
                ),
                const SizedBox(height: Dimension.padding),
                Form(
                  key: cubit.state.forgotPwdFormKey,
                  child: EmailTextFormField(
                    onChanged: cubit.setEmail,
                    controller: cubit.state.email,
                  ),
                ),
                const SizedBox(height: Dimension.paddingM),
                ElevatedButton(
                  onPressed: () async {
                    Navigator.of(context).pop();
                    await cubit.onForgotPwdUserClick();
                  },
                  child: Text(translation.loginPage.recover),
                ),
                const SizedBox(height: Dimension.paddingS),
                TextButton(
                  child: Text(
                    translation.generic.cancel,
                    style: const TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginPageCubit(),
      child: BlocBuilder<LoginPageCubit, LoginPageState>(
          builder: (context, state) {
        final cubit = context.read<LoginPageCubit>();

        return Scaffold(
          appBar: AppBar(),
          body: Builder(
            builder: (context) {
              return Form(
                key: state.loginFormKey,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Dimension.padding),
                      child: ListView(
                        children: [
                          Text(
                            translation.generic.welcome,
                            textAlign: TextAlign.start,
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          const SizedBox(height: Dimension.padding),
                          Text(
                            translation.loginPage.email,
                            textAlign: TextAlign.start,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: Dimension.paddingS),
                          EmailTextFormField(controller:state.email,
                            onChanged: cubit.setEmail),
                          const SizedBox(height: Dimension.paddingM),
                          Text(
                            translation.loginPage.password,
                            textAlign: TextAlign.start,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: Dimension.paddingS),
                          PasswordTextFormField(
                            state.password,
                            hintText: translation.textFormFieldHints.password,
                            obscureText: state.showPassword,
                            suffixIcon: IconButton(
                              icon: Icon(
                                state.showPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: cubit.toggleShowPassword,
                            ),
                          ),
                          const SizedBox(height: Dimension.paddingXS),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: const Size(50, 30),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              onPressed: () => _showForgotPasswordDialog(cubit),
                              child: Text(
                                'Password dimenticata?',
                                textAlign: TextAlign.end,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.w400,
                                      color: Theme.of(context).primaryColor,
                                    ),
                              ),
                            ),
                          ),
                          const SizedBox(height: Dimension.paddingM),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: AnimatedCrossFade(
                        crossFadeState: _keyboardVisible
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst,
                        duration: const Duration(
                          milliseconds: Dimension.standardAnimationDuration,
                        ),
                        secondChild: const SizedBox(
                          width: double.infinity,
                          height: 0,
                        ),
                        firstChild: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: Dimension.padding,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(
                                height: Dimension.padding,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: ElevatedButton(
                                  onPressed: cubit.onLoginClick,
                                  child: Text(translation.generic.login),
                                ),
                              ),
                              const SizedBox(
                                height: Dimension.padding,
                              ),
                              Column(
                                children: [
                                  const SizedBox(
                                    height: Dimension.paddingM,
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        context.goNamed(AppRoute.signUp.name),
                                    child: Text.rich(
                                      TextSpan(
                                        children: <InlineSpan>[
                                          TextSpan(
                                            text:
                                                '${translation.loginPage.dontHaveAnAccount} ',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          TextSpan(
                                            text: translation
                                                .loginPage.signupHere,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                ),
                                          ),
                                        ],
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: Dimension.padding,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    if (state.showPageLoader)
                      const CustomCircularProgressIndicator(),
                  ],
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
