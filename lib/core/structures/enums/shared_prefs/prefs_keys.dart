enum PrefsKeys {
  locale('locale', group: PrefsGroup.app),
  theme('theme', group: PrefsGroup.app),
  token('token', group: PrefsGroup.session),
  tokenExpireTime('token_expire_time', group: PrefsGroup.session),
  refreshToken('refresh_token', group: PrefsGroup.session),
  email('email', group: PrefsGroup.user),
  password('password', group: PrefsGroup.user);

  const PrefsKeys(this.key, {this.group});

  final String key;
  final PrefsGroup? group;
}

enum PrefsGroup {
  user,
  app,
  session,
}
