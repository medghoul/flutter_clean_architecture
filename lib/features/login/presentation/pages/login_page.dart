import 'package:clean_architecture/core/extensions/context_extension.dart';
import 'package:clean_architecture/core/resources/utils/validators.dart';
import 'package:clean_architecture/features/login/presentation/cubits/login_cubit.dart';
import 'package:clean_architecture/features/login/presentation/cubits/login_state.dart';
import 'package:clean_architecture/core/resources/res.dart';
import 'package:clean_architecture/i18n/lang_keys.dart';
import 'package:clean_architecture/routing/app_routes.dart';
import 'package:clean_architecture/widgets/ui/custom_circular_progress_indicator.dart';
import 'package:clean_architecture/widgets/ui/text_form_fields/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final bool _keyboardVisible = false;

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
            context.translate(LangKeys.recoverPassword),
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.black),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  context.translate(LangKeys.insertEmailToRecoverPwd),
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black),
                ),
                const SizedBox(height: AppDimensions.paddingM),
                Form(
                  key: cubit.state.forgotPwdFormKey,
                  child: CustomTextField(
                    onChanged: cubit.setEmail,
                    controller: cubit.state.email,
                  ),
                ),
                const SizedBox(height: AppDimensions.paddingM),
                ElevatedButton(
                  onPressed: () async {
                    Navigator.of(context).pop();
                    await cubit.onForgotPwdUserClick();
                  },
                  child: Text(context.translate(LangKeys.recover)),
                ),
                const SizedBox(height: AppDimensions.paddingS),
                TextButton(
                  child: Text(
                    context.translate(LangKeys.cancel),
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
                          horizontal: AppDimensions.paddingM),
                      child: ListView(
                        children: [
                          Text(
                            context.translate(LangKeys.welcome),
                            textAlign: TextAlign.start,
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          const SizedBox(height: AppDimensions.paddingM),
                          Text(
                            context.translate(LangKeys.email),
                            textAlign: TextAlign.start,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: AppDimensions.paddingS),
                          CustomTextField(
                            controller: state.email,
                            onChanged: cubit.setEmail,
                            hintText: context.translate(LangKeys.email),
                            validator: (value) => Validators(context).validateEmail(value ?? ''),
                          ),
                          const SizedBox(height: AppDimensions.paddingM),
                          Text(
                            context.translate(LangKeys.password),
                            textAlign: TextAlign.start,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: AppDimensions.paddingS),
                          CustomTextField(
                            controller: state.password,
                            hintText: context.translate(LangKeys.password),
                            obscureText: state.showPassword,
                            suffixIcon: IconButton(
                              icon: Icon(
                                state.showPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: cubit.toggleShowPassword,
                            ),
                            validator: (value) => Validators(context).validatePassword(value ?? ''),
                          ),
                          const SizedBox(height: AppDimensions.paddingXS),
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
                          const SizedBox(height: AppDimensions.paddingM),
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
                          milliseconds: AppDimensions.standardAnimationDuration,
                        ),
                        secondChild: const SizedBox(
                          width: double.infinity,
                          height: 0,
                        ),
                        firstChild: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppDimensions.paddingM,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(
                                height: AppDimensions.paddingM,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: ElevatedButton(
                                  onPressed: cubit.onLoginClick,
                                  child: Text(context.translate(LangKeys.login)),
                                ),
                              ),
                              const SizedBox(
                                height: AppDimensions.paddingM,
                              ),
                              Column(
                                children: [
                                  const SizedBox(
                                    height: AppDimensions.paddingM,
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        context.goNamed(AppRoute.signUp.name),
                                    child: Text.rich(
                                      TextSpan(
                                        children: <InlineSpan>[
                                          TextSpan(
                                            text:
                                                '${context.translate(LangKeys.dontHaveAnAccount)} ',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          TextSpan(
                                            text: context.translate(LangKeys.signupHere),
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
                                    height: AppDimensions.paddingM,
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
