enum AppRoute {
  notification('/notifications'),
  logger('/logger'),
  access('access'),
  onboarding('onboarding'),
  signIn('signIn'),
  signUp('signUp'),
  signUpConfirmation('signUpConfirmation'),
  forgotPassword('forgotPassword'),
  intro('/intro'),
  home('/home'),
  cardDetail('cardDetail'),
  profile('/profile'),
  editProfile('editProfile'),
  settings('settings'),
  support('support'),
  supportSuccess('supportSuccess'),
  changePassword('changePassword'),
  bluetooth('/bluetooth'),
  help('help'),
  notFoundScreen('/404');

  const AppRoute(this.path);

  final String path;
}
