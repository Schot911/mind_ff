import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['ru', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? ruText = '',
    String? enText = '',
  }) =>
      [ruText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'hskg6uea': {
      'ru': 'Открыть',
      'en': 'Open',
    },
    'w80yfy4s': {
      'ru': 'Список ведущих',
      'en': 'List of presenters',
    },
    'kq1adhan': {
      'ru': 'Админ панель',
      'en': 'Admin panel',
    },
    'n39cvxy0': {
      'ru': 'Список ведущих',
      'en': 'List of presenters',
    },
    'xdcussi2': {
      'ru': 'Список слушателей',
      'en': 'List of listeners',
    },
    'xzta8y2h': {
      'ru': 'Добавить пользователя',
      'en': 'Add user',
    },
    'ujld2w6g': {
      'ru': 'Ведущие',
      'en': 'Leading',
    },
  },
  // ListenerList
  {
    'pvmatoar': {
      'ru': 'Слушатели',
      'en': 'Listeners',
    },
    '5hmvox4p': {
      'ru': 'user@domainname.com',
      'en': 'user@domainname.com',
    },
    'w4r9iyxi': {
      'ru': 'View',
      'en': 'view',
    },
    '6ohkcxpn': {
      'ru': 'Username',
      'en': 'username',
    },
    'f21ny027': {
      'ru': 'user@domainname.com',
      'en': 'user@domainname.com',
    },
    'd3y0q3ov': {
      'ru': 'View',
      'en': 'view',
    },
    '3747gljy': {
      'ru': 'Username',
      'en': 'username',
    },
    '0kj2yo9r': {
      'ru': 'user@domainname.com',
      'en': 'user@domainname.com',
    },
    'sq9dseuq': {
      'ru': 'View',
      'en': 'view',
    },
    'yseoxwwm': {
      'ru': 'user@domainname.com',
      'en': 'user@domainname.com',
    },
    'esyddxo2': {
      'ru': 'View',
      'en': 'view',
    },
    'rxhpe0u2': {
      'ru': 'Слушатели',
      'en': 'Listeners',
    },
  },
  // AuthPage
  {
    'lfklrijh': {
      'ru': 'Авторизация',
      'en': 'Authorization',
    },
    'skyn3eh7': {
      'ru': 'Email',
      'en': 'Email',
    },
    'dwbcc2jm': {
      'ru': 'Пароль',
      'en': 'Password',
    },
    'xmna229v': {
      'ru': 'Войти',
      'en': 'To come in',
    },
    'iotresu4': {
      'ru': 'Home',
      'en': 'Home',
    },
  },
  // CreateLeader
  {
    '87ntoy5v': {
      'ru': 'Добавить пользователя',
      'en': 'Add user',
    },
    '0nfkdjv8': {
      'ru': 'Имя',
      'en': 'Name',
    },
    'b1162kyu': {
      'ru': 'Email',
      'en': 'Email',
    },
    'vzpjqehd': {
      'ru': 'Номер телефона',
      'en': 'Phone number',
    },
    'u07tfe5d': {
      'ru': 'Ведущий',
      'en': 'Leading',
    },
    '0gprpxe7': {
      'ru': 'Слушатель',
      'en': 'Listener',
    },
    'z6npg2gn': {
      'ru': 'Роль',
      'en': 'Role',
    },
    '7fs7zwfe': {
      'ru': 'Добавить ведущего',
      'en': 'Add presenter',
    },
    'snuqeuwy': {
      'ru': 'Добавить слушателя',
      'en': 'Add listener',
    },
    'oamb54dc': {
      'ru': 'Field is required',
      'en': 'Field is required',
    },
    '5rfei7h3': {
      'ru': 'Field is required',
      'en': 'Field is required',
    },
    '7ktcssxo': {
      'ru': 'Field is required',
      'en': 'Field is required',
    },
    'zcmequnm': {
      'ru': 'Field is required',
      'en': 'Field is required',
    },
    'o4g1ontv': {
      'ru': 'Добавить',
      'en': 'Add',
    },
  },
  // drawerMenu
  {
    'yce1j2ct': {
      'ru': 'Админ панель',
      'en': 'Admin panel',
    },
    'ywu67cjq': {
      'ru': 'Home',
      'en': 'Home',
    },
  },
  // DetailLeader
  {
    'homm36mi': {
      'ru': 'E-mail',
      'en': 'Email',
    },
    'uc46uf54': {
      'ru': 'Номер телефона',
      'en': 'Phone number',
    },
    '9ztplu9q': {
      'ru': 'Роль',
      'en': 'Role',
    },
    'ndo66m80': {
      'ru': 'Количество занятий',
      'en': 'Number of lessons',
    },
    'rqvsnmk0': {
      'ru': 'Дата',
      'en': 'date',
    },
    'ffpt8vqq': {
      'ru': 'Доступно',
      'en': 'Available',
    },
    'd67xtgtn': {
      'ru': 'Home',
      'en': 'Home',
    },
  },
  // AddDate
  {
    'ec9karrc': {
      'ru': 'Добавить дату',
      'en': 'Add date',
    },
    'buzvrg1t': {
      'ru': '09:00',
      'en': '09:00',
    },
    'szpb3k3y': {
      'ru': '10:00',
      'en': '10:00',
    },
    '6k5d006j': {
      'ru': '11:00',
      'en': '11:00',
    },
    'xg4xic2g': {
      'ru': '12:00',
      'en': '12:00',
    },
    '23uz7pld': {
      'ru': '13:00',
      'en': '13:00',
    },
    'qfyny3um': {
      'ru': '14:00',
      'en': '14:00',
    },
    'bg0h0fxw': {
      'ru': '15:00',
      'en': '15:00',
    },
    'rdq8l58q': {
      'ru': '16:00',
      'en': '16:00',
    },
    'w79wvz2i': {
      'ru': '17:00',
      'en': '17:00',
    },
    'dasyatqe': {
      'ru': '18:00',
      'en': '18:00',
    },
    'suv05vaa': {
      'ru': '19:00',
      'en': '19:00',
    },
    'w6e4ppeg': {
      'ru': '20:00',
      'en': '20:00',
    },
    'mmbgpt4a': {
      'ru': 'Время начала',
      'en': 'Start time',
    },
    'mauhb5s2': {
      'ru': '09:00',
      'en': '09:00',
    },
    '6m6i7ge1': {
      'ru': '10:00',
      'en': '10:00',
    },
    'bjrpl9gs': {
      'ru': '11:00',
      'en': '11:00',
    },
    '8hhjz8zi': {
      'ru': '12:00',
      'en': '12:00',
    },
    'xhel7jnb': {
      'ru': '13:00',
      'en': '13:00',
    },
    '4af4uofo': {
      'ru': '14:00',
      'en': '14:00',
    },
    'es5c1onk': {
      'ru': '15:00',
      'en': '15:00',
    },
    'e5b64031': {
      'ru': '16:00',
      'en': '16:00',
    },
    '2cwm2i09': {
      'ru': '17:00',
      'en': '17:00',
    },
    'ubxyzrmt': {
      'ru': '18:00',
      'en': '18:00',
    },
    'nmavyv6i': {
      'ru': '19:00',
      'en': '19:00',
    },
    'd4nag4k7': {
      'ru': '20:00',
      'en': '20:00',
    },
    'bzjilpfo': {
      'ru': 'Время окончания',
      'en': 'End time',
    },
    '3ujjhek2': {
      'ru': 'Добавить дату',
      'en': 'Add date',
    },
    'pgrkxnou': {
      'ru': 'Field is required',
      'en': 'Field is required',
    },
    're2c7xq8': {
      'ru': 'Field is required',
      'en': 'Field is required',
    },
    '5str2fx7': {
      'ru': 'Field is required',
      'en': 'Field is required',
    },
    'c9ynpqcs': {
      'ru': 'Field is required',
      'en': 'Field is required',
    },
    'ay7j8box': {
      'ru': 'Добавить дату',
      'en': 'Add date',
    },
  },
  // myDate
  {
    '3wctmhwa': {
      'ru': 'Дата',
      'en': 'date',
    },
    'ya50oheq': {
      'ru': 'Доступно',
      'en': 'Available',
    },
    'fwqy5247': {
      'ru': 'Мои даты',
      'en': 'My dates',
    },
    'tpjccvix': {
      'ru': 'Админ панель',
      'en': 'Admin panel',
    },
    '50oxid03': {
      'ru': 'Список ведущих',
      'en': 'List of presenters',
    },
    '7y2g4v3v': {
      'ru': 'Список слушателей',
      'en': 'List of listeners',
    },
    '52h8wbmr': {
      'ru': 'Добавить пользователя',
      'en': 'Add user',
    },
    'qacjou4n': {
      'ru': 'Мои даты',
      'en': 'My dates',
    },
  },
  // Profile
  {
    '98nzprgo': {
      'ru': 'Мой профиль',
      'en': 'Profile',
    },
    '7ggj28hd': {
      'ru': 'Настройки аккаунта',
      'en': '',
    },
    'ghpkq5fi': {
      'ru': 'Сменить пароль',
      'en': 'Change password',
    },
    'wqn75eqm': {
      'ru': 'Выйти',
      'en': 'Log Out',
    },
    'sox4v46i': {
      'ru': 'Мой профиль',
      'en': 'Profile',
    },
  },
  // EditUsers
  {
    '97t6k9cu': {
      'ru': 'Отмена',
      'en': 'Cancel',
    },
    '1rrpetg0': {
      'ru': 'Сохранить',
      'en': 'Save',
    },
  },
  // Miscellaneous
  {
    'rdrsz4sc': {
      'ru': '',
      'en': '',
    },
    'tnkau6t1': {
      'ru': '',
      'en': '',
    },
    'ym5n6e0v': {
      'ru': '',
      'en': '',
    },
    'vfehbov3': {
      'ru': '',
      'en': '',
    },
    'a1b76pdw': {
      'ru': '',
      'en': '',
    },
    'c5l0r6zp': {
      'ru': '',
      'en': '',
    },
    '3rbovn26': {
      'ru': '',
      'en': '',
    },
    'cwk01an3': {
      'ru': '',
      'en': '',
    },
    'rglf39jc': {
      'ru': '',
      'en': '',
    },
    '4xuqmzss': {
      'ru': '',
      'en': '',
    },
    'uh6wf6qn': {
      'ru': '',
      'en': '',
    },
    'qwhl9i2f': {
      'ru': '',
      'en': '',
    },
    'xg0978o8': {
      'ru': '',
      'en': '',
    },
    'o719lazl': {
      'ru': '',
      'en': '',
    },
    '4vzyxtqt': {
      'ru': '',
      'en': '',
    },
    'seo3u2bq': {
      'ru': '',
      'en': '',
    },
    'kgvdbf21': {
      'ru': '',
      'en': '',
    },
    'twlthzxd': {
      'ru': '',
      'en': '',
    },
    'ye59qqvs': {
      'ru': '',
      'en': '',
    },
    '1hc6qvrs': {
      'ru': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
