/// Generated file. Do not edit.
///
/// Original: lib/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 268 (134 per locale)
///
/// Built on 2024-06-12 at 08:02 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.it;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.it) // set locale
/// - Locale locale = AppLocale.it.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.it) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
  it(languageCode: 'it', build: Translations.build),
  en(languageCode: 'en', build: _TranslationsEn.build);

  const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

  @override final String languageCode;
  @override final String? scriptCode;
  @override final String? countryCode;
  @override final TranslationBuilder<AppLocale, Translations> build;

  /// Gets current instance managed by [LocaleSettings].
  Translations get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of translation).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = translation.someKey.anotherKey;
/// String b = translation['someKey.anotherKey']; // Only for edge cases!
Translations get translation => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final translation = Translations.of(context); // Get translation variable.
/// String a = translation.someKey.anotherKey; // Use translation variable.
/// String b = translation['someKey.anotherKey']; // Only for edge cases!
class TranslationProvider extends BaseTranslationProvider<AppLocale, Translations> {
  TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

  static InheritedLocaleData<AppLocale, Translations> of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.translation.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
  Translations get translation => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, Translations> {
  LocaleSettings._() : super(utils: AppLocaleUtils.instance);

  static final instance = LocaleSettings._();

  // static aliases (checkout base methods for documentation)
  static AppLocale get currentLocale => instance.currentLocale;
  static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
  static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
  static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
  static AppLocale useDeviceLocale() => instance.useDeviceLocale();
  @Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
  @Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
  static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
    language: language,
    locale: locale,
    cardinalResolver: cardinalResolver,
    ordinalResolver: ordinalResolver,
  );
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
  AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

  static final instance = AppLocaleUtils._();

  // static aliases (checkout base methods for documentation)
  static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
  static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
  static AppLocale findDeviceLocale() => instance.findDeviceLocale();
  static List<Locale> get supportedLocales => instance.supportedLocales;
  static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class Translations implements BaseTranslations<AppLocale, Translations> {
  /// Returns the current translations of the given [context].
  ///
  /// Usage:
  /// final translation = Translations.of(context);
  static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  Translations.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
      : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
        $meta = TranslationMetadata(
          locale: AppLocale.it,
          overrides: overrides ?? {},
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        ) {
    $meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <it>.
  @override final TranslationMetadata<AppLocale, Translations> $meta;

  /// Access flat map
  dynamic operator[](String key) => $meta.getTranslation(key);

  late final Translations _root = this; // ignore: unused_field

  // Translations
  late final _TranslationsGenericIt generic = _TranslationsGenericIt._(_root);
  late final _TranslationsTextFieldValidationsIt textFieldValidations = _TranslationsTextFieldValidationsIt._(_root);
  late final _TranslationsTextFormFieldHintsIt textFormFieldHints = _TranslationsTextFormFieldHintsIt._(_root);
  late final _TranslationsTutorialIt tutorial = _TranslationsTutorialIt._(_root);
  late final _TranslationsProfilePageIt profilePage = _TranslationsProfilePageIt._(_root);
  late final _TranslationsSignupPageIt signupPage = _TranslationsSignupPageIt._(_root);
  late final _TranslationsLoginPageIt loginPage = _TranslationsLoginPageIt._(_root);
  late final _TranslationsAccessPageIt accessPage = _TranslationsAccessPageIt._(_root);
  late final _TranslationsStartPageIt startPage = _TranslationsStartPageIt._(_root);
  late final _TranslationsHomePageIt homePage = _TranslationsHomePageIt._(_root);
}

// Path: generic
class _TranslationsGenericIt {
  _TranslationsGenericIt._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get next => 'Avanti';
  String get access => 'Accedi';
  String get notificationDefaultChannel => 'Notifiche in arrivo';
  String get notificationDescriptionDefaultChannel => 'Aggiornamenti sull\' app @@';
  String get genericError => 'Errore imprevisto';
  String get logout => 'Logout';
  String get continueTxt => 'Continua';
  String get skip => 'Salta';
  String get login => 'Accedi';
  String get signup => 'Registrati';
  String get cancel => 'Annulla';
  String get welcome => 'Benvenuto';
  String get username => 'Username';
  String get email => 'Email';
  String get password => 'Password';
  String get confirmEmail => 'Conferma email';
  String get confirmPassword => 'Conferma password';
  String get name => 'Nome';
  String get surname => 'Cognome';
  String get backToLogin => 'Torna alla login';
  String get save => 'Salva';
  String get areYourSure => 'Sei sicuro?';
  String get profile => 'Profilo';
  String get home => 'Home';
  String get updates => 'Aggiornamenti';
}

// Path: textFieldValidations
class _TranslationsTextFieldValidationsIt {
  _TranslationsTextFieldValidationsIt._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get textFormFieldEmpty => 'Questo campo non può essere vuoto';
  String get maxLenght => 'La lunghezza massima è di @@ caratteri';
  String get wrongCharacters => 'Caratteri non validi.';
  String get weakPassword => 'Password troppo debole';
  String get emailAlreadyInUse => 'Questa mail è già in uso';
  String get invalidEmail => 'Email non valida';
  String get emptySpace => 'Hai inserito uno spazio vuoto nella mail';
  String get passwordsDontMatch => 'Le password non corrispondono';
  String get emailsDontMatch => 'Le email non corrispondono';
}

// Path: textFormFieldHints
class _TranslationsTextFormFieldHintsIt {
  _TranslationsTextFormFieldHintsIt._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get confirmNewPassword => 'Conferma la password';
  String get password => '\*******';
  String get insertNewPassword => 'Nuova password';
  String get insertOldPassword => 'Vecchia password';
  String get email => 'Es. nome.cognome@email.com';
  String get name => 'Nome';
  String get surname => 'Cognome';
  String get editPassword => 'Cambia password';
}

// Path: tutorial
class _TranslationsTutorialIt {
  _TranslationsTutorialIt._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get tutorialFirstMessageTitle => 'Lorem ipsum 1';
  String get tutorialFirstMessageDescription => 'Lorem ipsum 1';
  String get tutorialSecondMessageTitle => 'Lorem ipsum 2';
  String get tutorialSecondMessageDescription => 'Lorem ipsum 2';
  String get tutorialThirdMessageTitle => 'Lorem ipsum 3';
  String get tutorialThirdMessageDescription => 'Lorem ipsum 3';
}

// Path: profilePage
class _TranslationsProfilePageIt {
  _TranslationsProfilePageIt._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get editPersonalData => 'Modifica dati personali';
  String get settings => 'Impostazioni';
  String get support => 'Supporto';
  String get privacyPolicy => 'Privacy Policy';
  String get changeProfileImage => 'Cambia immagine del profilo';
  String get username => 'Username';
  String get editPassword => 'Modifica password';
  String get name => 'Nome';
  String get surname => 'Cognome';
  String get email => 'Email';
  String get city => 'Città';
  String get genre => 'Genere';
  String get darkTheme => 'Tema alternativo';
  String get darkThemeDescription => 'Prova ora l\'app con un colore diverso!';
  String get accessibility => 'Accessibilità';
  String get accessibilityDescription => 'Lorem ipsum dolor sic amet';
  String get aboutMe => 'About me';
  String get phoneNumber => 'Numero di telefono';
  String get nameAndSurname => 'Nome e cognome';
  String get resetPassword => 'Reset password';
  String get changePersonalInfos => 'Modifica informazioni personali';
  String get atTheMomentYouCantChangeEmail => 'Al momento non è possibile modificare l\'email!';
  String get myDatas => 'I miei dati';
  String get logout => 'Logout';
}

// Path: signupPage
class _TranslationsSignupPageIt {
  _TranslationsSignupPageIt._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get signupCompleted => 'Registrazione completata!';
  String get signup => 'Registrazione';
  String get title => 'Crea il tuo account:';
  String get signupViaMail => 'Registrati via Email';
  String get signupWithGoogle => 'Registrati con Google';
  String get signupWithFacebook => 'Registrati con Facebook';
  String get clickingYouAccept => 'Cliccando accetti';
  String get termsAndConditions => 'Termini e Condizioni\n';
  String get andAlso => 'e la';
  String get privacyPolicy => 'Privacy Policy';
  String get createAccount => 'Crea account';
  String get privacyPolicy1 => 'Ho letto la vostra informativa sulla privacy ai sensi dell’art. 13 del GDPR. Ho compreso le finalità di cui al punto 2.A e le basi giuridiche per cui è necessario il trattamento e legittimo, anche senza il consenso dei soli dati indicati come obbligatori. In riferimento al trattamento dei miei dati personali, per cui si richiede il consenso come esplicitato nelle modalità e finalità indicate';
  String get privacyPolicy2B0 => 'Acconsento al trattamento di altri dati particolari necessari per i servizi richiesti';
  String get privacyPolicy2B1 => 'Trattamento dei dati per migliorare i servizi';
  String get privacyPolicy2B2 => 'Marketing e/o commerciali';
  String get privacyPolicy2B3 => 'Profilazione semi-automatizzata - finalizzate all\'invio di consigli sulla nutrizione e/o offerte promozionali specifiche pertinenti agli obiettivi delle diete degli interessati registrati';
  String get checkEmail => 'Controlla la tua mail!';
  String get sentToEmail => 'Abbiamo inviato una mail con un link di conferma\na questa mail:';
  String get checkSpam => 'Se non la ricevi entro 5 minuti, perfavore controlla nello Spam.';
  String get notReceived => 'Non hai ricevuto l\'email?';
  String get sendAgain => 'Invia di nuovo';
  String get gdpr => 'Manifestazione del consenso trattamento dati – Privacy - (GDPR 679/2016)';
  String get acceptPrivacy => 'Per continuare accetta i nostri Termini e condizioni e la nostra Privacy Policy';
  String get privacyTitle => 'Privacy e dati personali';
}

// Path: loginPage
class _TranslationsLoginPageIt {
  _TranslationsLoginPageIt._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Login';
  String get access => 'Accedi';
  String get welcomeBack => 'Bentornato!';
  String get accessViaMail => 'Accedi via Email';
  String get accessWithGoogle => 'Accedi con Google';
  String get accessWithFacebook => 'Accedi con Facebook';
  String get clickingYouAccept => 'Cliccando accetti';
  String get termsAndConditions => 'Termini e Condizioni\n';
  String get andAlso => 'e la';
  String get privacyPolicy => 'Privacy Policy';
  String get loginPageDescription => 'Lorem ipsum dolor sic amet';
  String get forgotPassword => 'Hai dimenticato la password?';
  String get recoverPassword => 'Recupera password';
  String get insertEmailToRecoverPwd => 'Inserisci l\'email per cui vuoi recuperare la password.';
  String get recover => 'Recupera';
  String get newUser => 'Nuovo utente?';
  String get noUserFoundForThisEmail => 'Non è stato trovato nessun utente con questa email';
  String get wrongPasswordForThisUser => 'La password inserita non è corretta';
  String get notVerifiedEmail => 'Email non verificata per questo utente';
  String get tooManyAccessTempt => 'Attenzione hai fatto troppi tentativi di accesso. Per favore riprova più tardi.';
  String get errorInSendingNewPassword => 'C\'è stato un errore nell\'invio della nuova password';
  String get messageInSendingNewPassword => 'Abbiamo inviato un\'email per il recupero della password';
  String get noUserFoundForRecoverPassword => 'Nessun utente trovato per l\'email inserita';
  String get email => 'Email';
  String get password => 'Password';
  String get dontHaveAnAccount => 'Non hai un account?';
  String get signupHere => 'Registrati qui';
  String get orAccessWith => 'Oppure accedi con';
}

// Path: accessPage
class _TranslationsAccessPageIt {
  _TranslationsAccessPageIt._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get doYouAlreadyHaveAnAccount => 'Hai già un account?';
  String get access => 'Accedi';
  String get title => 'Lorem ipsum';
  String get description => 'Lorem ipsum';
  String get letsStart => 'Iniziamo!';
  String get signup => 'Registrati';
}

// Path: startPage
class _TranslationsStartPageIt {
  _TranslationsStartPageIt._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'CodeBaker';
  String get caption => 'Boilerplate!';
  String get start => 'Inizia';
}

// Path: homePage
class _TranslationsHomePageIt {
  _TranslationsHomePageIt._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get welcome => 'Benvenuto';
}

// Path: <root>
class _TranslationsEn extends Translations {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  _TranslationsEn.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
      : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
        $meta = TranslationMetadata(
          locale: AppLocale.en,
          overrides: overrides ?? {},
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        ),
        super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
    super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
    $meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <en>.
  @override final TranslationMetadata<AppLocale, Translations> $meta;

  /// Access flat map
  @override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

  @override late final _TranslationsEn _root = this; // ignore: unused_field

  // Translations
  @override late final _TranslationsGenericEn generic = _TranslationsGenericEn._(_root);
  @override late final _TranslationsTextFieldValidationsEn textFieldValidations = _TranslationsTextFieldValidationsEn._(_root);
  @override late final _TranslationsTextFormFieldHintsEn textFormFieldHints = _TranslationsTextFormFieldHintsEn._(_root);
  @override late final _TranslationsTutorialEn tutorial = _TranslationsTutorialEn._(_root);
  @override late final _TranslationsProfilePageEn profilePage = _TranslationsProfilePageEn._(_root);
  @override late final _TranslationsSignupPageEn signupPage = _TranslationsSignupPageEn._(_root);
  @override late final _TranslationsLoginPageEn loginPage = _TranslationsLoginPageEn._(_root);
  @override late final _TranslationsAccessPageEn accessPage = _TranslationsAccessPageEn._(_root);
  @override late final _TranslationsStartPageEn startPage = _TranslationsStartPageEn._(_root);
  @override late final _TranslationsHomePageEn homePage = _TranslationsHomePageEn._(_root);
}

// Path: generic
class _TranslationsGenericEn extends _TranslationsGenericIt {
  _TranslationsGenericEn._(_TranslationsEn root) : this._root = root, super._(root);

  @override final _TranslationsEn _root; // ignore: unused_field

  // Translations
  @override String get next => 'Avanti';
  @override String get access => 'Accedi';
  @override String get notificationDefaultChannel => 'Notifiche in arrivo';
  @override String get notificationDescriptionDefaultChannel => 'Aggiornamenti sull\' app @@';
  @override String get genericError => 'Errore imprevisto';
  @override String get logout => 'Logout';
  @override String get continueTxt => 'Continua';
  @override String get skip => 'Salta';
  @override String get login => 'Accedi';
  @override String get signup => 'Registrati';
  @override String get cancel => 'Annulla';
  @override String get welcome => 'Benvenuto';
  @override String get username => 'Username';
  @override String get email => 'Email';
  @override String get password => 'Password';
  @override String get confirmEmail => 'Conferma email';
  @override String get confirmPassword => 'Conferma password';
  @override String get name => 'Nome';
  @override String get surname => 'Cognome';
  @override String get backToLogin => 'Torna alla login';
  @override String get save => 'Salva';
  @override String get areYourSure => 'Sei sicuro?';
  @override String get profile => 'Profilo';
  @override String get home => 'Home';
  @override String get updates => 'Aggiornamenti';
}

// Path: textFieldValidations
class _TranslationsTextFieldValidationsEn extends _TranslationsTextFieldValidationsIt {
  _TranslationsTextFieldValidationsEn._(_TranslationsEn root) : this._root = root, super._(root);

  @override final _TranslationsEn _root; // ignore: unused_field

  // Translations
  @override String get textFormFieldEmpty => 'Questo campo non può essere vuoto';
  @override String get maxLenght => 'La lunghezza massima è di @@ caratteri';
  @override String get wrongCharacters => 'Caratteri non validi.';
  @override String get weakPassword => 'Password troppo debole';
  @override String get emailAlreadyInUse => 'Questa mail è già in uso';
  @override String get invalidEmail => 'Email non valida';
  @override String get emptySpace => 'Hai inserito uno spazio vuoto nella mail';
  @override String get passwordsDontMatch => 'Le password non corrispondono';
  @override String get emailsDontMatch => 'Le email non corrispondono';
}

// Path: textFormFieldHints
class _TranslationsTextFormFieldHintsEn extends _TranslationsTextFormFieldHintsIt {
  _TranslationsTextFormFieldHintsEn._(_TranslationsEn root) : this._root = root, super._(root);

  @override final _TranslationsEn _root; // ignore: unused_field

  // Translations
  @override String get confirmNewPassword => 'Conferma la password';
  @override String get password => '\*******';
  @override String get insertNewPassword => 'Nuova password';
  @override String get insertOldPassword => 'Vecchia password';
  @override String get email => 'Es. nome.cognome@email.com';
  @override String get name => 'Nome';
  @override String get surname => 'Cognome';
  @override String get editPassword => 'Cambia password';
}

// Path: tutorial
class _TranslationsTutorialEn extends _TranslationsTutorialIt {
  _TranslationsTutorialEn._(_TranslationsEn root) : this._root = root, super._(root);

  @override final _TranslationsEn _root; // ignore: unused_field

  // Translations
  @override String get tutorialFirstMessageTitle => 'Lorem ipsum 1';
  @override String get tutorialFirstMessageDescription => 'Lorem ipsum 1';
  @override String get tutorialSecondMessageTitle => 'Lorem ipsum 2';
  @override String get tutorialSecondMessageDescription => 'Lorem ipsum 2';
  @override String get tutorialThirdMessageTitle => 'Lorem ipsum 3';
  @override String get tutorialThirdMessageDescription => 'Lorem ipsum 3';
}

// Path: profilePage
class _TranslationsProfilePageEn extends _TranslationsProfilePageIt {
  _TranslationsProfilePageEn._(_TranslationsEn root) : this._root = root, super._(root);

  @override final _TranslationsEn _root; // ignore: unused_field

  // Translations
  @override String get editPersonalData => 'Modifica dati personali';
  @override String get settings => 'Impostazioni';
  @override String get support => 'Supporto';
  @override String get privacyPolicy => 'Privacy Policy';
  @override String get changeProfileImage => 'Cambia immagine del profilo';
  @override String get username => 'Username';
  @override String get editPassword => 'Modifica password';
  @override String get name => 'Nome';
  @override String get surname => 'Cognome';
  @override String get email => 'Email';
  @override String get city => 'Città';
  @override String get genre => 'Genere';
  @override String get darkTheme => 'Tema alternativo';
  @override String get darkThemeDescription => 'Prova ora l\'app con un colore diverso!';
  @override String get accessibility => 'Accessibilità';
  @override String get accessibilityDescription => 'Lorem ipsum dolor sic amet';
  @override String get aboutMe => 'About me';
  @override String get phoneNumber => 'Numero di telefono';
  @override String get nameAndSurname => 'Nome e cognome';
  @override String get resetPassword => 'Reset password';
  @override String get changePersonalInfos => 'Modifica informazioni personali';
  @override String get atTheMomentYouCantChangeEmail => 'Al momento non è possibile modificare l\'email!';
  @override String get myDatas => 'I miei dati';
  @override String get logout => 'Logout';
}

// Path: signupPage
class _TranslationsSignupPageEn extends _TranslationsSignupPageIt {
  _TranslationsSignupPageEn._(_TranslationsEn root) : this._root = root, super._(root);

  @override final _TranslationsEn _root; // ignore: unused_field

  // Translations
  @override String get signupCompleted => 'Registrazione completata!';
  @override String get signup => 'Registrazione';
  @override String get title => 'Crea il tuo account:';
  @override String get signupViaMail => 'Registrati via Email';
  @override String get signupWithGoogle => 'Registrati con Google';
  @override String get signupWithFacebook => 'Registrati con Facebook';
  @override String get clickingYouAccept => 'Cliccando accetti';
  @override String get termsAndConditions => 'Termini e Condizioni\n';
  @override String get andAlso => 'e la';
  @override String get privacyPolicy => 'Privacy Policy';
  @override String get createAccount => 'Crea account';
  @override String get privacyPolicy1 => 'Ho letto la vostra informativa sulla privacy ai sensi dell’art. 13 del GDPR. Ho compreso le finalità di cui al punto 2.A e le basi giuridiche per cui è necessario il trattamento e legittimo, anche senza il consenso dei soli dati indicati come obbligatori. In riferimento al trattamento dei miei dati personali, per cui si richiede il consenso come esplicitato nelle modalità e finalità indicate';
  @override String get privacyPolicy2B0 => 'Acconsento al trattamento di altri dati particolari necessari per i servizi richiesti';
  @override String get privacyPolicy2B1 => 'Trattamento dei dati per migliorare i servizi';
  @override String get privacyPolicy2B2 => 'Marketing e/o commerciali';
  @override String get privacyPolicy2B3 => 'Profilazione semi-automatizzata - finalizzate all\'invio di consigli sulla nutrizione e/o offerte promozionali specifiche pertinenti agli obiettivi delle diete degli interessati registrati';
  @override String get checkEmail => 'Controlla la tua mail!';
  @override String get sentToEmail => 'Abbiamo inviato una mail con un link di conferma\na questa mail:';
  @override String get checkSpam => 'Se non la ricevi entro 5 minuti, perfavore controlla nello Spam.';
  @override String get notReceived => 'Non hai ricevuto l\'email?';
  @override String get sendAgain => 'Invia di nuovo';
  @override String get gdpr => 'Manifestazione del consenso trattamento dati – Privacy - (GDPR 679/2016)';
  @override String get acceptPrivacy => 'Per continuare accetta i nostri Termini e condizioni e la nostra Privacy Policy';
  @override String get privacyTitle => 'Privacy e dati personali';
}

// Path: loginPage
class _TranslationsLoginPageEn extends _TranslationsLoginPageIt {
  _TranslationsLoginPageEn._(_TranslationsEn root) : this._root = root, super._(root);

  @override final _TranslationsEn _root; // ignore: unused_field

  // Translations
  @override String get title => 'Login';
  @override String get access => 'Accedi';
  @override String get welcomeBack => 'Bentornato!';
  @override String get accessViaMail => 'Accedi via Email';
  @override String get accessWithGoogle => 'Accedi con Google';
  @override String get accessWithFacebook => 'Accedi con Facebook';
  @override String get clickingYouAccept => 'Cliccando accetti';
  @override String get termsAndConditions => 'Termini e Condizioni\n';
  @override String get andAlso => 'e la';
  @override String get privacyPolicy => 'Privacy Policy';
  @override String get loginPageDescription => 'Lorem ipsum dolor sic amet';
  @override String get forgotPassword => 'Hai dimenticato la password?';
  @override String get recoverPassword => 'Recupera password';
  @override String get insertEmailToRecoverPwd => 'Inserisci l\'email per cui vuoi recuperare la password.';
  @override String get recover => 'Recupera';
  @override String get newUser => 'Nuovo utente?';
  @override String get noUserFoundForThisEmail => 'Non è stato trovato nessun utente con questa email';
  @override String get wrongPasswordForThisUser => 'La password inserita non è corretta';
  @override String get notVerifiedEmail => 'Email non verificata per questo utente';
  @override String get tooManyAccessTempt => 'Attenzione hai fatto troppi tentativi di accesso. Per favore riprova più tardi.';
  @override String get errorInSendingNewPassword => 'C\'è stato un errore nell\'invio della nuova password';
  @override String get messageInSendingNewPassword => 'Abbiamo inviato un\'email per il recupero della password';
  @override String get noUserFoundForRecoverPassword => 'Nessun utente trovato per l\'email inserita';
  @override String get email => 'Email';
  @override String get password => 'Password';
  @override String get dontHaveAnAccount => 'Non hai un account?';
  @override String get signupHere => 'Registrati qui';
  @override String get orAccessWith => 'Oppure accedi con';
}

// Path: accessPage
class _TranslationsAccessPageEn extends _TranslationsAccessPageIt {
  _TranslationsAccessPageEn._(_TranslationsEn root) : this._root = root, super._(root);

  @override final _TranslationsEn _root; // ignore: unused_field

  // Translations
  @override String get doYouAlreadyHaveAnAccount => 'Hai già un account?';
  @override String get access => 'Accedi';
  @override String get title => 'Lorem ipsum';
  @override String get description => 'Lorem ipsum';
  @override String get letsStart => 'Iniziamo!';
  @override String get signup => 'Registrati';
}

// Path: startPage
class _TranslationsStartPageEn extends _TranslationsStartPageIt {
  _TranslationsStartPageEn._(_TranslationsEn root) : this._root = root, super._(root);

  @override final _TranslationsEn _root; // ignore: unused_field

  // Translations
  @override String get title => 'CodeBaker';
  @override String get caption => 'Boilerplate!';
  @override String get start => 'Inizia';
}

// Path: homePage
class _TranslationsHomePageEn extends _TranslationsHomePageIt {
  _TranslationsHomePageEn._(_TranslationsEn root) : this._root = root, super._(root);

  @override final _TranslationsEn _root; // ignore: unused_field

  // Translations
  @override String get welcome => 'Benvenuto';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
  dynamic _flatMapFunction(String path) {
    switch (path) {
      case 'generic.next': return 'Avanti';
      case 'generic.access': return 'Accedi';
      case 'generic.notificationDefaultChannel': return 'Notifiche in arrivo';
      case 'generic.notificationDescriptionDefaultChannel': return 'Aggiornamenti sull\' app @@';
      case 'generic.genericError': return 'Errore imprevisto';
      case 'generic.logout': return 'Logout';
      case 'generic.continueTxt': return 'Continua';
      case 'generic.skip': return 'Salta';
      case 'generic.login': return 'Accedi';
      case 'generic.signup': return 'Registrati';
      case 'generic.cancel': return 'Annulla';
      case 'generic.welcome': return 'Benvenuto';
      case 'generic.username': return 'Username';
      case 'generic.email': return 'Email';
      case 'generic.password': return 'Password';
      case 'generic.confirmEmail': return 'Conferma email';
      case 'generic.confirmPassword': return 'Conferma password';
      case 'generic.name': return 'Nome';
      case 'generic.surname': return 'Cognome';
      case 'generic.backToLogin': return 'Torna alla login';
      case 'generic.save': return 'Salva';
      case 'generic.areYourSure': return 'Sei sicuro?';
      case 'generic.profile': return 'Profilo';
      case 'generic.home': return 'Home';
      case 'generic.updates': return 'Aggiornamenti';
      case 'textFieldValidations.textFormFieldEmpty': return 'Questo campo non può essere vuoto';
      case 'textFieldValidations.maxLenght': return 'La lunghezza massima è di @@ caratteri';
      case 'textFieldValidations.wrongCharacters': return 'Caratteri non validi.';
      case 'textFieldValidations.weakPassword': return 'Password troppo debole';
      case 'textFieldValidations.emailAlreadyInUse': return 'Questa mail è già in uso';
      case 'textFieldValidations.invalidEmail': return 'Email non valida';
      case 'textFieldValidations.emptySpace': return 'Hai inserito uno spazio vuoto nella mail';
      case 'textFieldValidations.passwordsDontMatch': return 'Le password non corrispondono';
      case 'textFieldValidations.emailsDontMatch': return 'Le email non corrispondono';
      case 'textFormFieldHints.confirmNewPassword': return 'Conferma la password';
      case 'textFormFieldHints.password': return '\*******';
      case 'textFormFieldHints.insertNewPassword': return 'Nuova password';
      case 'textFormFieldHints.insertOldPassword': return 'Vecchia password';
      case 'textFormFieldHints.email': return 'Es. nome.cognome@email.com';
      case 'textFormFieldHints.name': return 'Nome';
      case 'textFormFieldHints.surname': return 'Cognome';
      case 'textFormFieldHints.editPassword': return 'Cambia password';
      case 'tutorial.tutorialFirstMessageTitle': return 'Lorem ipsum 1';
      case 'tutorial.tutorialFirstMessageDescription': return 'Lorem ipsum 1';
      case 'tutorial.tutorialSecondMessageTitle': return 'Lorem ipsum 2';
      case 'tutorial.tutorialSecondMessageDescription': return 'Lorem ipsum 2';
      case 'tutorial.tutorialThirdMessageTitle': return 'Lorem ipsum 3';
      case 'tutorial.tutorialThirdMessageDescription': return 'Lorem ipsum 3';
      case 'profilePage.editPersonalData': return 'Modifica dati personali';
      case 'profilePage.settings': return 'Impostazioni';
      case 'profilePage.support': return 'Supporto';
      case 'profilePage.privacyPolicy': return 'Privacy Policy';
      case 'profilePage.changeProfileImage': return 'Cambia immagine del profilo';
      case 'profilePage.username': return 'Username';
      case 'profilePage.editPassword': return 'Modifica password';
      case 'profilePage.name': return 'Nome';
      case 'profilePage.surname': return 'Cognome';
      case 'profilePage.email': return 'Email';
      case 'profilePage.city': return 'Città';
      case 'profilePage.genre': return 'Genere';
      case 'profilePage.darkTheme': return 'Tema alternativo';
      case 'profilePage.darkThemeDescription': return 'Prova ora l\'app con un colore diverso!';
      case 'profilePage.accessibility': return 'Accessibilità';
      case 'profilePage.accessibilityDescription': return 'Lorem ipsum dolor sic amet';
      case 'profilePage.aboutMe': return 'About me';
      case 'profilePage.phoneNumber': return 'Numero di telefono';
      case 'profilePage.nameAndSurname': return 'Nome e cognome';
      case 'profilePage.resetPassword': return 'Reset password';
      case 'profilePage.changePersonalInfos': return 'Modifica informazioni personali';
      case 'profilePage.atTheMomentYouCantChangeEmail': return 'Al momento non è possibile modificare l\'email!';
      case 'profilePage.myDatas': return 'I miei dati';
      case 'profilePage.logout': return 'Logout';
      case 'signupPage.signupCompleted': return 'Registrazione completata!';
      case 'signupPage.signup': return 'Registrazione';
      case 'signupPage.title': return 'Crea il tuo account:';
      case 'signupPage.signupViaMail': return 'Registrati via Email';
      case 'signupPage.signupWithGoogle': return 'Registrati con Google';
      case 'signupPage.signupWithFacebook': return 'Registrati con Facebook';
      case 'signupPage.clickingYouAccept': return 'Cliccando accetti';
      case 'signupPage.termsAndConditions': return 'Termini e Condizioni\n';
      case 'signupPage.andAlso': return 'e la';
      case 'signupPage.privacyPolicy': return 'Privacy Policy';
      case 'signupPage.createAccount': return 'Crea account';
      case 'signupPage.privacyPolicy1': return 'Ho letto la vostra informativa sulla privacy ai sensi dell’art. 13 del GDPR. Ho compreso le finalità di cui al punto 2.A e le basi giuridiche per cui è necessario il trattamento e legittimo, anche senza il consenso dei soli dati indicati come obbligatori. In riferimento al trattamento dei miei dati personali, per cui si richiede il consenso come esplicitato nelle modalità e finalità indicate';
      case 'signupPage.privacyPolicy2B0': return 'Acconsento al trattamento di altri dati particolari necessari per i servizi richiesti';
      case 'signupPage.privacyPolicy2B1': return 'Trattamento dei dati per migliorare i servizi';
      case 'signupPage.privacyPolicy2B2': return 'Marketing e/o commerciali';
      case 'signupPage.privacyPolicy2B3': return 'Profilazione semi-automatizzata - finalizzate all\'invio di consigli sulla nutrizione e/o offerte promozionali specifiche pertinenti agli obiettivi delle diete degli interessati registrati';
      case 'signupPage.checkEmail': return 'Controlla la tua mail!';
      case 'signupPage.sentToEmail': return 'Abbiamo inviato una mail con un link di conferma\na questa mail:';
      case 'signupPage.checkSpam': return 'Se non la ricevi entro 5 minuti, perfavore controlla nello Spam.';
      case 'signupPage.notReceived': return 'Non hai ricevuto l\'email?';
      case 'signupPage.sendAgain': return 'Invia di nuovo';
      case 'signupPage.gdpr': return 'Manifestazione del consenso trattamento dati – Privacy - (GDPR 679/2016)';
      case 'signupPage.acceptPrivacy': return 'Per continuare accetta i nostri Termini e condizioni e la nostra Privacy Policy';
      case 'signupPage.privacyTitle': return 'Privacy e dati personali';
      case 'loginPage.title': return 'Login';
      case 'loginPage.access': return 'Accedi';
      case 'loginPage.welcomeBack': return 'Bentornato!';
      case 'loginPage.accessViaMail': return 'Accedi via Email';
      case 'loginPage.accessWithGoogle': return 'Accedi con Google';
      case 'loginPage.accessWithFacebook': return 'Accedi con Facebook';
      case 'loginPage.clickingYouAccept': return 'Cliccando accetti';
      case 'loginPage.termsAndConditions': return 'Termini e Condizioni\n';
      case 'loginPage.andAlso': return 'e la';
      case 'loginPage.privacyPolicy': return 'Privacy Policy';
      case 'loginPage.loginPageDescription': return 'Lorem ipsum dolor sic amet';
      case 'loginPage.forgotPassword': return 'Hai dimenticato la password?';
      case 'loginPage.recoverPassword': return 'Recupera password';
      case 'loginPage.insertEmailToRecoverPwd': return 'Inserisci l\'email per cui vuoi recuperare la password.';
      case 'loginPage.recover': return 'Recupera';
      case 'loginPage.newUser': return 'Nuovo utente?';
      case 'loginPage.noUserFoundForThisEmail': return 'Non è stato trovato nessun utente con questa email';
      case 'loginPage.wrongPasswordForThisUser': return 'La password inserita non è corretta';
      case 'loginPage.notVerifiedEmail': return 'Email non verificata per questo utente';
      case 'loginPage.tooManyAccessTempt': return 'Attenzione hai fatto troppi tentativi di accesso. Per favore riprova più tardi.';
      case 'loginPage.errorInSendingNewPassword': return 'C\'è stato un errore nell\'invio della nuova password';
      case 'loginPage.messageInSendingNewPassword': return 'Abbiamo inviato un\'email per il recupero della password';
      case 'loginPage.noUserFoundForRecoverPassword': return 'Nessun utente trovato per l\'email inserita';
      case 'loginPage.email': return 'Email';
      case 'loginPage.password': return 'Password';
      case 'loginPage.dontHaveAnAccount': return 'Non hai un account?';
      case 'loginPage.signupHere': return 'Registrati qui';
      case 'loginPage.orAccessWith': return 'Oppure accedi con';
      case 'accessPage.doYouAlreadyHaveAnAccount': return 'Hai già un account?';
      case 'accessPage.access': return 'Accedi';
      case 'accessPage.title': return 'Lorem ipsum';
      case 'accessPage.description': return 'Lorem ipsum';
      case 'accessPage.letsStart': return 'Iniziamo!';
      case 'accessPage.signup': return 'Registrati';
      case 'startPage.title': return 'CodeBaker';
      case 'startPage.caption': return 'Boilerplate!';
      case 'startPage.start': return 'Inizia';
      case 'homePage.welcome': return 'Benvenuto';
      default: return null;
    }
  }
}

extension on _TranslationsEn {
  dynamic _flatMapFunction(String path) {
    switch (path) {
      case 'generic.next': return 'Avanti';
      case 'generic.access': return 'Accedi';
      case 'generic.notificationDefaultChannel': return 'Notifiche in arrivo';
      case 'generic.notificationDescriptionDefaultChannel': return 'Aggiornamenti sull\' app @@';
      case 'generic.genericError': return 'Errore imprevisto';
      case 'generic.logout': return 'Logout';
      case 'generic.continueTxt': return 'Continua';
      case 'generic.skip': return 'Salta';
      case 'generic.login': return 'Accedi';
      case 'generic.signup': return 'Registrati';
      case 'generic.cancel': return 'Annulla';
      case 'generic.welcome': return 'Benvenuto';
      case 'generic.username': return 'Username';
      case 'generic.email': return 'Email';
      case 'generic.password': return 'Password';
      case 'generic.confirmEmail': return 'Conferma email';
      case 'generic.confirmPassword': return 'Conferma password';
      case 'generic.name': return 'Nome';
      case 'generic.surname': return 'Cognome';
      case 'generic.backToLogin': return 'Torna alla login';
      case 'generic.save': return 'Salva';
      case 'generic.areYourSure': return 'Sei sicuro?';
      case 'generic.profile': return 'Profilo';
      case 'generic.home': return 'Home';
      case 'generic.updates': return 'Aggiornamenti';
      case 'textFieldValidations.textFormFieldEmpty': return 'Questo campo non può essere vuoto';
      case 'textFieldValidations.maxLenght': return 'La lunghezza massima è di @@ caratteri';
      case 'textFieldValidations.wrongCharacters': return 'Caratteri non validi.';
      case 'textFieldValidations.weakPassword': return 'Password troppo debole';
      case 'textFieldValidations.emailAlreadyInUse': return 'Questa mail è già in uso';
      case 'textFieldValidations.invalidEmail': return 'Email non valida';
      case 'textFieldValidations.emptySpace': return 'Hai inserito uno spazio vuoto nella mail';
      case 'textFieldValidations.passwordsDontMatch': return 'Le password non corrispondono';
      case 'textFieldValidations.emailsDontMatch': return 'Le email non corrispondono';
      case 'textFormFieldHints.confirmNewPassword': return 'Conferma la password';
      case 'textFormFieldHints.password': return '\*******';
      case 'textFormFieldHints.insertNewPassword': return 'Nuova password';
      case 'textFormFieldHints.insertOldPassword': return 'Vecchia password';
      case 'textFormFieldHints.email': return 'Es. nome.cognome@email.com';
      case 'textFormFieldHints.name': return 'Nome';
      case 'textFormFieldHints.surname': return 'Cognome';
      case 'textFormFieldHints.editPassword': return 'Cambia password';
      case 'tutorial.tutorialFirstMessageTitle': return 'Lorem ipsum 1';
      case 'tutorial.tutorialFirstMessageDescription': return 'Lorem ipsum 1';
      case 'tutorial.tutorialSecondMessageTitle': return 'Lorem ipsum 2';
      case 'tutorial.tutorialSecondMessageDescription': return 'Lorem ipsum 2';
      case 'tutorial.tutorialThirdMessageTitle': return 'Lorem ipsum 3';
      case 'tutorial.tutorialThirdMessageDescription': return 'Lorem ipsum 3';
      case 'profilePage.editPersonalData': return 'Modifica dati personali';
      case 'profilePage.settings': return 'Impostazioni';
      case 'profilePage.support': return 'Supporto';
      case 'profilePage.privacyPolicy': return 'Privacy Policy';
      case 'profilePage.changeProfileImage': return 'Cambia immagine del profilo';
      case 'profilePage.username': return 'Username';
      case 'profilePage.editPassword': return 'Modifica password';
      case 'profilePage.name': return 'Nome';
      case 'profilePage.surname': return 'Cognome';
      case 'profilePage.email': return 'Email';
      case 'profilePage.city': return 'Città';
      case 'profilePage.genre': return 'Genere';
      case 'profilePage.darkTheme': return 'Tema alternativo';
      case 'profilePage.darkThemeDescription': return 'Prova ora l\'app con un colore diverso!';
      case 'profilePage.accessibility': return 'Accessibilità';
      case 'profilePage.accessibilityDescription': return 'Lorem ipsum dolor sic amet';
      case 'profilePage.aboutMe': return 'About me';
      case 'profilePage.phoneNumber': return 'Numero di telefono';
      case 'profilePage.nameAndSurname': return 'Nome e cognome';
      case 'profilePage.resetPassword': return 'Reset password';
      case 'profilePage.changePersonalInfos': return 'Modifica informazioni personali';
      case 'profilePage.atTheMomentYouCantChangeEmail': return 'Al momento non è possibile modificare l\'email!';
      case 'profilePage.myDatas': return 'I miei dati';
      case 'profilePage.logout': return 'Logout';
      case 'signupPage.signupCompleted': return 'Registrazione completata!';
      case 'signupPage.signup': return 'Registrazione';
      case 'signupPage.title': return 'Crea il tuo account:';
      case 'signupPage.signupViaMail': return 'Registrati via Email';
      case 'signupPage.signupWithGoogle': return 'Registrati con Google';
      case 'signupPage.signupWithFacebook': return 'Registrati con Facebook';
      case 'signupPage.clickingYouAccept': return 'Cliccando accetti';
      case 'signupPage.termsAndConditions': return 'Termini e Condizioni\n';
      case 'signupPage.andAlso': return 'e la';
      case 'signupPage.privacyPolicy': return 'Privacy Policy';
      case 'signupPage.createAccount': return 'Crea account';
      case 'signupPage.privacyPolicy1': return 'Ho letto la vostra informativa sulla privacy ai sensi dell’art. 13 del GDPR. Ho compreso le finalità di cui al punto 2.A e le basi giuridiche per cui è necessario il trattamento e legittimo, anche senza il consenso dei soli dati indicati come obbligatori. In riferimento al trattamento dei miei dati personali, per cui si richiede il consenso come esplicitato nelle modalità e finalità indicate';
      case 'signupPage.privacyPolicy2B0': return 'Acconsento al trattamento di altri dati particolari necessari per i servizi richiesti';
      case 'signupPage.privacyPolicy2B1': return 'Trattamento dei dati per migliorare i servizi';
      case 'signupPage.privacyPolicy2B2': return 'Marketing e/o commerciali';
      case 'signupPage.privacyPolicy2B3': return 'Profilazione semi-automatizzata - finalizzate all\'invio di consigli sulla nutrizione e/o offerte promozionali specifiche pertinenti agli obiettivi delle diete degli interessati registrati';
      case 'signupPage.checkEmail': return 'Controlla la tua mail!';
      case 'signupPage.sentToEmail': return 'Abbiamo inviato una mail con un link di conferma\na questa mail:';
      case 'signupPage.checkSpam': return 'Se non la ricevi entro 5 minuti, perfavore controlla nello Spam.';
      case 'signupPage.notReceived': return 'Non hai ricevuto l\'email?';
      case 'signupPage.sendAgain': return 'Invia di nuovo';
      case 'signupPage.gdpr': return 'Manifestazione del consenso trattamento dati – Privacy - (GDPR 679/2016)';
      case 'signupPage.acceptPrivacy': return 'Per continuare accetta i nostri Termini e condizioni e la nostra Privacy Policy';
      case 'signupPage.privacyTitle': return 'Privacy e dati personali';
      case 'loginPage.title': return 'Login';
      case 'loginPage.access': return 'Accedi';
      case 'loginPage.welcomeBack': return 'Bentornato!';
      case 'loginPage.accessViaMail': return 'Accedi via Email';
      case 'loginPage.accessWithGoogle': return 'Accedi con Google';
      case 'loginPage.accessWithFacebook': return 'Accedi con Facebook';
      case 'loginPage.clickingYouAccept': return 'Cliccando accetti';
      case 'loginPage.termsAndConditions': return 'Termini e Condizioni\n';
      case 'loginPage.andAlso': return 'e la';
      case 'loginPage.privacyPolicy': return 'Privacy Policy';
      case 'loginPage.loginPageDescription': return 'Lorem ipsum dolor sic amet';
      case 'loginPage.forgotPassword': return 'Hai dimenticato la password?';
      case 'loginPage.recoverPassword': return 'Recupera password';
      case 'loginPage.insertEmailToRecoverPwd': return 'Inserisci l\'email per cui vuoi recuperare la password.';
      case 'loginPage.recover': return 'Recupera';
      case 'loginPage.newUser': return 'Nuovo utente?';
      case 'loginPage.noUserFoundForThisEmail': return 'Non è stato trovato nessun utente con questa email';
      case 'loginPage.wrongPasswordForThisUser': return 'La password inserita non è corretta';
      case 'loginPage.notVerifiedEmail': return 'Email non verificata per questo utente';
      case 'loginPage.tooManyAccessTempt': return 'Attenzione hai fatto troppi tentativi di accesso. Per favore riprova più tardi.';
      case 'loginPage.errorInSendingNewPassword': return 'C\'è stato un errore nell\'invio della nuova password';
      case 'loginPage.messageInSendingNewPassword': return 'Abbiamo inviato un\'email per il recupero della password';
      case 'loginPage.noUserFoundForRecoverPassword': return 'Nessun utente trovato per l\'email inserita';
      case 'loginPage.email': return 'Email';
      case 'loginPage.password': return 'Password';
      case 'loginPage.dontHaveAnAccount': return 'Non hai un account?';
      case 'loginPage.signupHere': return 'Registrati qui';
      case 'loginPage.orAccessWith': return 'Oppure accedi con';
      case 'accessPage.doYouAlreadyHaveAnAccount': return 'Hai già un account?';
      case 'accessPage.access': return 'Accedi';
      case 'accessPage.title': return 'Lorem ipsum';
      case 'accessPage.description': return 'Lorem ipsum';
      case 'accessPage.letsStart': return 'Iniziamo!';
      case 'accessPage.signup': return 'Registrati';
      case 'startPage.title': return 'CodeBaker';
      case 'startPage.caption': return 'Boilerplate!';
      case 'startPage.start': return 'Inizia';
      case 'homePage.welcome': return 'Benvenuto';
      default: return null;
    }
  }
}
