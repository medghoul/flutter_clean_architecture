class PiusiRegex {
  /// Regex per la validazione degli indirizzi email.
  /// Questa espressione regolare verifica che l'indirizzo email:
  /// - Non inizi con un punto, un trattino o un underscore.
  /// - Non contenga più di un punto, un trattino o un underscore consecutivi.
  /// - Contenga una parte locale (prima della '@') composta da lettere, numeri, punti, trattini e underscore.
  /// - Contenga un dominio (dopo la '@') composto da lettere, numeri, punti e trattini.
  /// - Il dominio deve avere almeno due caratteri dopo l'ultimo punto.
  static final RegExp emailRegex = RegExp(
    r'^(?![._-])(?!.*[._-]{2})[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    caseSensitive: false,
    multiLine: false,
  );

  // Regex per la validazione del codice PIN. Questa espressione regolare verifica che la stringa contenga solo numeri (0-9) e può essere vuota.
  static final RegExp pinCodeRegex = RegExp(
    r'^[0-9]*$',
  );

  /// Regex per la validazione del codice del sito. Questa espressione regolare verifica che la stringa contenga almeno un carattere alfabetico e un numero.
  static final RegExp siteCodeRegex = RegExp(
    r'^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9]+$',
  );

  /// Regex per la validazione dei valori di preset. Accetta numeri interi e decimali con un massimo di due cifre dopo la virgola o il punto.
  static final RegExp presetRegex = RegExp(r'^[0-9]+([\.,]\d{0,2})?$');

  /// Regex per la validazione dei valori odometro per chilometri e miglia.
  /// Questa espressione regolare verifica che la stringa contenga solo numeri (0-9).
  /// Inoltre, consente un massimo di 11 caratteri, il che significa che può gestire valori odometrici fino a 99999999999.
  static final RegExp odometerKmMigliaRegex = RegExp(r'^[0-9]{0,11}$');

  /// Regex per la validazione dei valori odometro per ore.
  /// Questa espressione regolare verifica che la stringa contenga solo numeri (0-9)
  /// e può includere un'opzione per un valore decimale.
  /// La stringa può avere fino a 10 cifre intere e, se presente,
  /// può avere al massimo una cifra decimale dopo un punto o una virgola.
  static final RegExp odometerOreRegex =
      RegExp(r'^[0-9]{0,10}([\.,]\d{0,1}){0,1}$');
}
