import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'es', 'fr'];

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
    String? enText = '',
    String? esText = '',
    String? frText = '',
  }) =>
      [enText, esText, frText][languageIndex] ?? '';

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

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

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

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Onboarding
  {
    'f9al2jiq': {
      'en': 'The experience of buying food quickly',
      'es': 'La experiencia de comprar comida rápidamente',
      'fr': 'L’expérience d’acheter de la nourriture rapidement',
    },
    'q7mzy88d': {
      'en':
          'Urna amet, suspendisse ullamcorper ac elit diam facilisis cursus vestibulum.',
      'es':
          'Urna amet, suspendisse ullamcorper ac elit diam facilisis cursus vestibulum.',
      'fr':
          'Urna amet, suspendisse ullamcorper ac elit diam facilisis cursus vestibulum.',
    },
    '2egoby3b': {
      'en': 'Find and Get Your Best Food',
      'es': 'Encuentre y obtenga su mejor comida',
      'fr': 'Trouvez et obtenez votre meilleure nourriture',
    },
    'neuxxcug': {
      'en':
          'Urna amet, suspendisse ullamcorper ac elit diam facilisis cursus vestibulum.',
      'es':
          'Urna amet, suspendisse ullamcorper ac elit diam facilisis cursus vestibulum.',
      'fr':
          'Urna amet, suspendisse ullamcorper ac elit diam facilisis cursus vestibulum.',
    },
    'rijctza1': {
      'en': 'Foodie’s courier send with love',
      'es': 'El mensajero de Foodie envía con amor.',
      'fr': 'Courrier gourmand envoyé avec amour',
    },
    '5cdcpcqz': {
      'en':
          'Urna amet, suspendisse ullamcorper ac elit diam facilisis cursus vestibulum.',
      'es':
          'Urna amet, suspendisse ullamcorper ac elit diam facilisis cursus vestibulum.',
      'fr':
          'Urna amet, suspendisse ullamcorper ac elit diam facilisis cursus vestibulum.',
    },
    '2044raxp': {
      'en': 'Create Account',
      'es': 'Crear una cuenta',
      'fr': 'Créer un compte',
    },
    'kvk96b9a': {
      'en': 'Already Have an Account',
      'es': 'Ya tienes una cuenta',
      'fr': 'Vous avez déjà un compte',
    },
    'e9n9xv7z': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // CreateAccount
  {
    'fqhfxosd': {
      'en': 'Create Account',
      'es': 'Crear una cuenta',
      'fr': 'Créer un compte',
    },
    '8r2ftoyt': {
      'en': 'Start learning with create your account',
      'es': 'Comience a aprender con crear su cuenta',
      'fr': 'Commencez à apprendre en créant votre compte',
    },
    'w8fbq6qd': {
      'en': 'Username',
      'es': 'Nombre de usuario',
      'fr': 'Nom d\'utilisateur',
    },
    'qyz8jn8k': {
      'en': 'Create your username',
      'es': 'Crea tu nombre de usuario',
      'fr': 'Créez votre nom d\'utilisateur',
    },
    '5ejt2igx': {
      'en': 'Email or Phone Number',
      'es': 'Correo electrónico o número de teléfono',
      'fr': 'E-mail ou numéro de téléphone',
    },
    '1k2s07d4': {
      'en': 'Enter your email or phone number',
      'es': 'Introduce tu correo electrónico o número de teléfono',
      'fr': 'Entrez votre email ou votre numéro de téléphone',
    },
    '8hrnyurr': {
      'en': 'Password',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
    },
    '5ta75wx9': {
      'en': 'Create your password',
      'es': 'Crea tu contraseña',
      'fr': 'Créez votre mot de passe',
    },
    '7318gst0': {
      'en': 'Create Account',
      'es': 'Crear una cuenta',
      'fr': 'Créer un compte',
    },
    'eqdiv2sl': {
      'en': 'Or using other method',
      'es': 'O usando otro método',
      'fr': 'Ou en utilisant une autre méthode',
    },
    'nt2a4i5y': {
      'en': 'Sign Up with Google',
      'es': 'Regístrate con Google',
      'fr': 'Inscrivez-vous avec Google',
    },
    '18pahsw4': {
      'en': 'Sign Up with Facebook',
      'es': 'Registrate con Facebook',
      'fr': 'Inscrivez-vous avec Facebook',
    },
    'tj5ofugi': {
      'en': 'Have an acccount',
      'es': 'tener una cuenta',
      'fr': 'Avoir un compte',
    },
    '96k4zm5b': {
      'en': 'Login',
      'es': 'Acceso',
      'fr': 'Se connecter',
    },
    'i6bq0pen': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Verification
  {
    'lnxzjexp': {
      'en': 'Verification',
      'es': 'Verificación',
      'fr': 'Vérification',
    },
    'm8vt32wl': {
      'en': 'Verification Code',
      'es': 'Código de verificación',
      'fr': 'Le code de vérification',
    },
    'j0wt8bqq': {
      'en':
          'We have to sent the code verification 1234, Please enter the code to move forward',
      'es':
          'Tenemos que enviar el código de verificación 1234. Ingrese el código para seguir adelante.',
      'fr':
          'Nous devons envoyer le code de vérification 1234, veuillez entrer le code pour avancer',
    },
    'ou77jxtd': {
      'en': 'demo@email.com',
      'es': 'demostración@correo electrónico.com',
      'fr': 'démo@email.com',
    },
    'vfbmvgvb': {
      'en': 'Verify',
      'es': 'Verificar',
      'fr': 'Vérifier',
    },
    '5iqum420': {
      'en': 'Didn\'t recceive the code? ',
      'es': '¿No recibiste el código?',
      'fr': 'Vous n\'avez pas reçu le code ?',
    },
    '7axmi8vz': {
      'en': 'Resend',
      'es': 'Reenviar',
      'fr': 'Renvoyer',
    },
    'hvh480nv': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // LoginAccount
  {
    'absgjmyr': {
      'en': 'Login Account',
      'es': 'Iniciar sesión cuenta',
      'fr': 'Compte de connexion',
    },
    '7yyc6yio': {
      'en': 'Please login with registered account',
      'es': 'Por favor inicie sesión con una cuenta registrada',
      'fr': 'Veuillez vous connecter avec un compte enregistré',
    },
    '0y1a56v9': {
      'en': 'Email or Phone Number',
      'es': 'Correo electrónico o número de teléfono',
      'fr': 'E-mail ou numéro de téléphone',
    },
    'xq55heau': {
      'en': 'Enter your email or phone number',
      'es': 'Introduce tu correo electrónico o número de teléfono',
      'fr': 'Entrez votre email ou votre numéro de téléphone',
    },
    'zdv6ragq': {
      'en': 'arsalan.devapps@gmail.com',
      'es': '',
      'fr': '',
    },
    'iyk0cszg': {
      'en': 'Password',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
    },
    'tec1pifi': {
      'en': 'Create your password',
      'es': 'Crea tu contraseña',
      'fr': 'Créez votre mot de passe',
    },
    'bv35trm5': {
      'en': '11223344',
      'es': '',
      'fr': '',
    },
    '0c1sk3ec': {
      'en': 'Forgot Password?',
      'es': '¿Has olvidado tu contraseña?',
      'fr': 'Mot de passe oublié?',
    },
    '58ybobvm': {
      'en': 'Signin',
      'es': 'Iniciar sesión',
      'fr': 'Se connecter',
    },
    'cy7y6bn2': {
      'en': 'Or using other method',
      'es': 'O usando otro método',
      'fr': 'Ou en utilisant une autre méthode',
    },
    'qwppiiww': {
      'en': 'Sign Up with Google',
      'es': 'Regístrate con Google',
      'fr': 'Inscrivez-vous avec Google',
    },
    'fr9vo6vw': {
      'en': 'Sign Up with Facebook',
      'es': 'Registrate con Facebook',
      'fr': 'Inscrivez-vous avec Facebook',
    },
    '9ftxk5xj': {
      'en': 'Don\'t have an acccount',
      'es': 'No tengo una cuenta',
      'fr': 'Je n\'ai pas de compte',
    },
    'jlqha2r3': {
      'en': 'Signup',
      'es': 'Inscribirse',
      'fr': 'S\'inscrire',
    },
    '84xsjzjp': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Home
  {
    'nrjkv2kp': {
      'en': '- Roast Beaf -',
      'es': '- Carne Asada -',
      'fr': '- Rôti de Bœuf -',
    },
    'qbi76ffw': {
      'en': 'Buy 2 and ',
      'es': 'Compra 2 y',
      'fr': 'Achetez-en 2 et',
    },
    '365znznm': {
      'en': 'Get 2',
      'es': 'Consigue 2',
      'fr': 'Obtenez-en 2',
    },
    'qc5r40eh': {
      'en': 'The taste of the cake is worldwide',
      'es': 'El sabor del pastel es mundial.',
      'fr': 'Le goût du gâteau est mondial',
    },
    'blkkfz04': {
      'en': '- Asian Baf Bread -',
      'es': '- Pan Baf asiático -',
      'fr': '- Pain Baf Asiatique -',
    },
    '1t0nwzcg': {
      'en': 'Buy 3 ',
      'es': 'Comprar 3',
      'fr': 'Achetez-en 3',
    },
    'jbmkdkf2': {
      'en': 'Get 1',
      'es': 'Consigue 1',
      'fr': 'Obtenez-en 1',
    },
    'd0x9cwun': {
      'en': 'The taste of the cake is worldwide',
      'es': 'El sabor del pastel es mundial.',
      'fr': 'Le goût du gâteau est mondial',
    },
    'h6jszv9t': {
      'en': '- Fried CHicken -',
      'es': '- Pollo frito -',
      'fr': '- Poulet frit -',
    },
    'br0vn0os': {
      'en': 'Buy 3 ',
      'es': 'Comprar 3',
      'fr': 'Achetez-en 3',
    },
    '6fp4t17z': {
      'en': 'Get 1',
      'es': 'Consigue 1',
      'fr': 'Obtenez-en 1',
    },
    '5q82whxw': {
      'en': 'The taste of the cake is worldwide',
      'es': 'El sabor del pastel es mundial.',
      'fr': 'Le goût du gâteau est mondial',
    },
    'w8d6d7ou': {
      'en': '5',
      'es': '5',
      'fr': '5',
    },
    'f9v2sphq': {
      'en': 'Location',
      'es': 'Ubicación',
      'fr': 'Emplacement',
    },
    'tcerl0vq': {
      'en': 'San Diego, CA',
      'es': 'San Diego, California, EE.UU.',
      'fr': 'San Diego, Californie',
    },
    '3uolrspq': {
      'en': '3',
      'es': '3',
      'fr': '3',
    },
    'gdd44mmx': {
      'en': 'Let\'s find the food you like',
      'es': 'Busquemos la comida que te gusta.',
      'fr': 'Trouvons la nourriture que vous aimez',
    },
    'xka1s61r': {
      'en': 'Meals',
      'es': 'Comidas',
      'fr': 'Repas',
    },
    'm6sm9u15': {
      'en': 'Dinners',
      'es': 'Cenas',
      'fr': 'Dîners',
    },
    '1g1zdnvb': {
      'en': 'Drinks',
      'es': 'Bebidas',
      'fr': 'Boissons',
    },
    'nodo0dhn': {
      'en': 'Fast Foods',
      'es': 'Comidas rápidas',
      'fr': 'Restauration rapide',
    },
    'fbwlmopa': {
      'en': 'Meat',
      'es': 'Carne',
      'fr': 'Viande',
    },
    'vc9mj8g7': {
      'en': 'Meals',
      'es': 'Comidas',
      'fr': 'Repas',
    },
    'bswt15yg': {
      'en': 'Hot Deals 🔥',
      'es': 'Ofertas especiales 🔥',
      'fr': 'Offres spéciales 🔥',
    },
    'cksqasks': {
      'en': 'See All',
      'es': 'Ver todo',
      'fr': 'Voir tout',
    },
    'x2qjxh38': {
      'en': '4.5',
      'es': '4.5',
      'fr': '4.5',
    },
    'qfj7n8oq': {
      'en': 'Viral stacking cake with honey',
      'es': 'Pastel de apilamiento viral con miel.',
      'fr': 'Gâteau empilable viral au miel',
    },
    '6wldf8t5': {
      'en': '\$ ',
      'es': 'ps',
      'fr': '\$',
    },
    'u8kx24j8': {
      'en': '9.67',
      'es': '9.67',
      'fr': '9.67',
    },
    'i38mmg9r': {
      'en': '4.5',
      'es': '4.5',
      'fr': '4.5',
    },
    'kowjo7c8': {
      'en': 'Roast beef with black pepper',
      'es': 'Carne asada con pimienta negra',
      'fr': 'Rôti de boeuf au poivre noir',
    },
    '2pvz4cev': {
      'en': '\$ ',
      'es': 'ps',
      'fr': '\$',
    },
    '2aru4znh': {
      'en': '9.67',
      'es': '9.67',
      'fr': '9.67',
    },
    'le0sj93s': {
      'en': 'Most bought 🔥',
      'es': 'Los más comprados 🔥',
      'fr': 'Les plus achetés 🔥',
    },
    'a4ybqjxs': {
      'en': 'See All',
      'es': 'Ver todo',
      'fr': 'Voir tout',
    },
    'pmjdygbc': {
      'en': '4.5',
      'es': '4.5',
      'fr': '4.5',
    },
    'tflw4s1f': {
      'en': 'Viral stacking cake with honey',
      'es': 'Pastel de apilamiento viral con miel.',
      'fr': 'Gâteau empilable viral au miel',
    },
    '81x8o1sk': {
      'en': '\$ ',
      'es': 'ps',
      'fr': '\$',
    },
    'nbie7pmp': {
      'en': '9.67',
      'es': '9.67',
      'fr': '9.67',
    },
    '31drqw4j': {
      'en': '4.5',
      'es': '4.5',
      'fr': '4.5',
    },
    '5r1ecy1s': {
      'en': 'Roast beef with black pepper',
      'es': 'Carne asada con pimienta negra',
      'fr': 'Rôti de boeuf au poivre noir',
    },
    '7hglunmb': {
      'en': '\$ ',
      'es': 'ps',
      'fr': '\$',
    },
    'wpzk0gvf': {
      'en': '9.67',
      'es': '9.67',
      'fr': '9.67',
    },
    '1bn3tbn9': {
      'en': 'FoodCort  Menu',
      'es': 'Menú de FoodCort',
      'fr': 'Menu FoodCort',
    },
    'oz87q4rw': {
      'en': 'Voucher',
      'es': 'Vale',
      'fr': 'Bon',
    },
    'ftofxth9': {
      'en': '2',
      'es': '2',
      'fr': '2',
    },
    'j4sf6qol': {
      'en': 'Chat',
      'es': 'Charlar',
      'fr': 'Chat',
    },
    'i6gh3ykw': {
      'en': '23',
      'es': '23',
      'fr': '23',
    },
    'o7mngs8h': {
      'en': 'History',
      'es': 'Historia',
      'fr': 'Histoire',
    },
    'ehogrhj6': {
      'en': '14',
      'es': '14',
      'fr': '14',
    },
    'c7qzdrmt': {
      'en': 'Setting',
      'es': 'Configuración',
      'fr': 'Paramètre',
    },
    'f5pkf5oo': {
      'en': '1',
      'es': '1',
      'fr': '1',
    },
    'yivwb9sd': {
      'en': 'Magdalena Succrose',
      'es': 'Magdalena Sacarosa',
      'fr': 'Saccharose Magdalena',
    },
    'q5uurl4d': {
      'en': 'Good Morning',
      'es': 'Buen día',
      'fr': 'Bonjour',
    },
    'nudnmbzx': {
      'en': 'Help',
      'es': 'Ayuda',
      'fr': 'Aide',
    },
    'p3mpfwg4': {
      'en': 'Logout',
      'es': 'Cerrar sesión',
      'fr': 'Se déconnecter',
    },
    'yuxvfcy0': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // MyOrder
  {
    'i78vidqg': {
      'en': 'My Orders',
      'es': 'Mis ordenes',
      'fr': 'Mes commandes',
    },
    '5dnqugbt': {
      'en': 'My Order',
      'es': 'Mi pedido',
      'fr': 'Ma commande',
    },
    'q1zvqh2a': {
      'en': 'Delinas Resto',
      'es': 'Delinas Resto',
      'fr': 'Délinas Resto',
    },
    'lbkv9pwc': {
      'en': 'On Progress',
      'es': 'En progreso',
      'fr': 'En progrès',
    },
    '1dh22zz4': {
      'en': 'Date',
      'es': 'Fecha',
      'fr': 'Date',
    },
    'ijtq1jlo': {
      'en': '29 Desc 2022',
      'es': '29 dic 2022',
      'fr': '29 décembre 2022',
    },
    'wsvk3s1k': {
      'en': 'Price',
      'es': 'Precio',
      'fr': 'Prix',
    },
    'dczeejli': {
      'en': '\$35.05',
      'es': '\$35.05',
      'fr': '35,05 \$',
    },
    'lg9gdklp': {
      'en': 'Detail',
      'es': 'Reclame el descuento',
      'fr': 'Réclamez la réduction',
    },
    'rxja02vl': {
      'en': 'Tracking',
      'es': 'Seguimiento',
      'fr': 'Suivi',
    },
    '42hehwip': {
      'en': 'History',
      'es': 'Historia',
      'fr': 'Histoire',
    },
    'hmdvxxgk': {
      'en': 'Delinas Resto',
      'es': 'Delinas Resto',
      'fr': 'Délinas Resto',
    },
    '1jmcs4wg': {
      'en': 'Completed',
      'es': 'Terminado',
      'fr': 'Complété',
    },
    'sbe46auv': {
      'en': 'Date',
      'es': 'Fecha',
      'fr': 'Date',
    },
    'zlzgeed2': {
      'en': '29 Desc 2022',
      'es': '29 dic 2022',
      'fr': '29 décembre 2022',
    },
    'patrq0wt': {
      'en': 'Price',
      'es': 'Precio',
      'fr': 'Prix',
    },
    '2ncjg2kj': {
      'en': '\$35.05',
      'es': '\$35.05',
      'fr': '35,05 \$',
    },
    'opi3blqy': {
      'en': 'Detail',
      'es': 'Reclame el descuento',
      'fr': 'Réclamez la réduction',
    },
    '10momek7': {
      'en': 'Tracking',
      'es': 'Seguimiento',
      'fr': 'Suivi',
    },
    'ic8o8fcw': {
      'en': 'Delinas Resto',
      'es': 'Delinas Resto',
      'fr': 'Délinas Resto',
    },
    'y4bahdkd': {
      'en': 'Date',
      'es': 'Fecha',
      'fr': 'Date',
    },
    'c9v2aqiz': {
      'en': '29 Desc 2022',
      'es': '29 dic 2022',
      'fr': '29 décembre 2022',
    },
    '0db8up0l': {
      'en': 'Price',
      'es': 'Precio',
      'fr': 'Prix',
    },
    'amfnvvnw': {
      'en': '\$35.05',
      'es': '\$35.05',
      'fr': '35,05 \$',
    },
    'tzzeq8h9': {
      'en': 'Detail',
      'es': 'Reclame el descuento',
      'fr': 'Réclamez la réduction',
    },
    'dbnlkhfj': {
      'en': 'Tracking',
      'es': 'Seguimiento',
      'fr': 'Suivi',
    },
    '460io703': {
      'en': 'My Orders',
      'es': 'Mis ordenes',
      'fr': 'Mes commandes',
    },
  },
  // Favorite
  {
    '49ybivr1': {
      'en': 'My Favorite',
      'es': 'Mi favorito',
      'fr': 'Mon préféré',
    },
    '62bdi6xm': {
      'en': 'Let\'s find the food you like',
      'es': 'Busquemos la comida que te gusta.',
      'fr': 'Trouvons la nourriture que vous aimez',
    },
    'kqemfkac': {
      'en': 'Hamburgers',
      'es': '',
      'fr': '',
    },
    'r63ieljx': {
      'en': 'Pizza',
      'es': 'Pizza',
      'fr': 'Pizza',
    },
    'mwcyaiq0': {
      'en': 'Cookies',
      'es': 'Galletas',
      'fr': 'Biscuits',
    },
    'wsvud8bm': {
      'en': 'Cookies',
      'es': 'Galletas',
      'fr': 'Biscuits',
    },
    'st0s5x2f': {
      'en': 'Veggie Soup',
      'es': 'Sopa de vegetales',
      'fr': 'Soupe de légumes',
    },
    'wd86kz7v': {
      'en': '4.4',
      'es': '4.4',
      'fr': '4.4',
    },
    'jr6tfjbn': {
      'en': '12 Minute',
      'es': '12 minutos',
      'fr': '12 minutes',
    },
    'fzq8j4pk': {
      'en': '\$ ',
      'es': 'ps',
      'fr': '\$',
    },
    '0y5ljcns': {
      'en': '8.20',
      'es': '8.20',
      'fr': '8h20',
    },
    'qtzs7hpk': {
      'en': 'Favorite',
      'es': 'Favorito',
      'fr': 'Préféré',
    },
  },
  // HomeScreen
  {
    'x43sk6py': {
      'en': '5',
      'es': '5',
      'fr': '5',
    },
    'abhagdlq': {
      'en': 'Location',
      'es': 'Ubicación',
      'fr': 'Emplacement',
    },
    'ccihlvzh': {
      'en': 'San Diego, CA',
      'es': 'San Diego, California, EE.UU.',
      'fr': 'San Diego, Californie',
    },
    'h7gji9e6': {
      'en': '3',
      'es': '3',
      'fr': '3',
    },
    'c0zrx0bz': {
      'en': 'Hei, FoodCorner!',
      'es': '¡Hola, FoodCorner!',
      'fr': 'Salut, FoodCorner !',
    },
    'kz1nnsei': {
      'en':
          'today we are having a crazy discount, by only buying 2 different products you will get a 40% discount',
      'es':
          'hoy tenemos un descuento loco, por solo comprar 2 productos diferentes obtendrás un 40% de descuento',
      'fr':
          'aujourd\'hui nous faisons une remise folle, en n\'achetant que 2 produits différents vous obtiendrez une remise de 40%',
    },
    't6fas3x0': {
      'en': '40 %',
      'es': '40 %',
      'fr': '40 %',
    },
    'wt59evq6': {
      'en': 'Top of the week',
      'es': 'Lo mejor de la semana',
      'fr': 'Haut de la semaine',
    },
    '4dkegicg': {
      'en': 'See All',
      'es': 'Ver todo',
      'fr': 'Voir tout',
    },
    'kvzxi4r0': {
      'en': 'Premium vegetable salad',
      'es': 'Ensalada de verduras premium',
      'fr': 'Salade de légumes haut de gamme',
    },
    '8chla7k2': {
      'en': '4.4',
      'es': '4.4',
      'fr': '4.4',
    },
    'mqy70mtv': {
      'en': '12 Minute',
      'es': '12 minutos',
      'fr': '12 minutes',
    },
    '435nvjoi': {
      'en': '\$ ',
      'es': 'ps',
      'fr': '\$',
    },
    '7qucyo47': {
      'en': '6.17',
      'es': '6.17',
      'fr': '6.17',
    },
    'wjb9g6x9': {
      'en': 'Grilled meat with kepunari sauce',
      'es': 'Carne a la parrilla con salsa kepunari',
      'fr': 'Viande grillée à la sauce kepunari',
    },
    'ynuefjfh': {
      'en': '4.4',
      'es': '4.4',
      'fr': '4.4',
    },
    'gu59z9cg': {
      'en': '12 Minute',
      'es': '12 minutos',
      'fr': '12 minutes',
    },
    '7ybi7eis': {
      'en': '\$ ',
      'es': 'ps',
      'fr': '\$',
    },
    '3cvwhp7h': {
      'en': '12.05',
      'es': '12.05',
      'fr': '12.05',
    },
    'ustgasmp': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // LocationDetect
  {
    'k4jsump9': {
      'en': 'Location Detect',
      'es': 'Detección de ubicación',
      'fr': 'Détection d\'emplacement',
    },
    'yvc7yjmd': {
      'en': 'Find restaurants around you',
      'es': 'Encuentra restaurantes a tu alrededor',
      'fr': 'Trouvez des restaurants autour de vous',
    },
    '8jzk2pr6': {
      'en':
          'click auto-find or enter your current location to find restaurants around you',
      'es':
          'haga clic en buscar automáticamente o ingrese su ubicación actual para encontrar restaurantes a su alrededor',
      'fr':
          'cliquez sur la recherche automatique ou entrez votre position actuelle pour trouver des restaurants autour de vous',
    },
    'a3ezcihm': {
      'en': 'Nearest Location Detection',
      'es': 'Cancelar',
      'fr': 'Annuler',
    },
    'w4rop2ub': {
      'en': 'San Diego, CA',
      'es': 'San Diego, California, EE.UU.',
      'fr': 'San Diego, Californie',
    },
    '5lsa42hm': {
      'en': 'Delaska RIsaka',
      'es': 'Delaska RIsaka',
      'fr': 'Delaska RIsaka',
    },
    'j00829xj': {
      'en': '4.8',
      'es': '4.8',
      'fr': '4.8',
    },
    'iysr7r4n': {
      'en': 'Close 10.45 PM',
      'es': 'Cierre 22:45',
      'fr': 'Fermeture à 22h45',
    },
    'sr0mruju': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Detail
  {
    'mnx04jee': {
      'en': 'Menu Detail',
      'es': 'Detalle del menú',
      'fr': 'Détail du menu',
    },
    'djb2f3n5': {
      'en': 'Noodles',
      'es': 'Fideos',
      'fr': 'Nouilles',
    },
    'mtpbo3c3': {
      'en': 'Fried grill noodles with egg special',
      'es': 'Fideos fritos a la parrilla con huevo especial',
      'fr': 'Nouilles grillées frites avec œuf spécial',
    },
    'vn8tgitw': {
      'en': 'Rating',
      'es': 'Clasificación',
      'fr': 'Notation',
    },
    '9qydxdue': {
      'en': '4,8',
      'es': '4,8',
      'fr': '4,8',
    },
    't0v4dcf1': {
      'en': 'Calories',
      'es': 'calorías',
      'fr': 'Calories',
    },
    'neg3msns': {
      'en': '124 Kcal',
      'es': '124 kilocalorías',
      'fr': '124 Kcal',
    },
    '3arxnrib': {
      'en': 'Time',
      'es': 'Tiempo',
      'fr': 'Temps',
    },
    'disilbb6': {
      'en': '15 min',
      'es': '15 minutos',
      'fr': '15 min',
    },
    'r8xqexim': {
      'en': 'Description',
      'es': 'Descripción',
      'fr': 'Description',
    },
    'tz8hydwz': {
      'en':
          'Vegetable noodles is a healthy Chinese inspired dish where cooked noodles are stir fried with lots of vegetables. Further the dish is seasoned with a splash of sauces, vinegar and black ',
      'es':
          'Los fideos con verduras son un plato saludable de inspiración china en el que los fideos cocidos se saltean con muchas verduras. Además se condimenta el plato con un chorrito de salsas, vinagre y negro.',
      'fr':
          'Les nouilles aux légumes sont un plat sain d\'inspiration chinoise où les nouilles cuites sont sautées avec beaucoup de légumes. De plus, le plat est assaisonné d\'un peu de sauces, de vinaigre et de noir.',
    },
    'ofiu1ud3': {
      'en': 'Read More',
      'es': 'Leer más',
      'fr': 'En savoir plus',
    },
    '8u283qs4': {
      'en': 'Location',
      'es': 'Ubicación',
      'fr': 'Emplacement',
    },
    'cjnow4du': {
      'en': 'Open Location',
      'es': 'Cancelar',
      'fr': 'Annuler',
    },
    'xm7euxs5': {
      'en': '\$ ',
      'es': 'ps',
      'fr': '\$',
    },
    'kjyn3b76': {
      'en': '35.25',
      'es': '35.25',
      'fr': '35h25',
    },
    'xv6cwiei': {
      'en': 'Add to Cart',
      'es': 'añadir a la cesta',
      'fr': 'Ajouter au panier',
    },
    'bzzsk2tt': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // DetailTwo
  {
    'nbdnof56': {
      'en': 'Menu Detail',
      'es': 'Detalle del menú',
      'fr': 'Détail du menu',
    },
    'j3p2m3nr': {
      'en': 'Fried grill noodles with egg special',
      'es': 'Fideos fritos a la parrilla con huevo especial',
      'fr': 'Nouilles grillées frites avec œuf spécial',
    },
    'lk71w8zc': {
      'en': '4,8',
      'es': '4,8',
      'fr': '4,8',
    },
    'sh4xuv53': {
      'en': '124 Kcal',
      'es': '124 kilocalorías',
      'fr': '124 Kcal',
    },
    'ni88nv7q': {
      'en': '15 min',
      'es': '15 minutos',
      'fr': '15 min',
    },
    'qp2vwesi': {
      'en': 'Description',
      'es': 'Descripción',
      'fr': 'Description',
    },
    'pmpuc2wi': {
      'en':
          'Vegetable noodles is a healthy Chinese inspired dish where cooked noodles are stir fried with lots of vegetables. Further the dish is seasoned with a splash of sauces, vinegar and black ',
      'es':
          'Los fideos con verduras son un plato saludable de inspiración china en el que los fideos cocidos se saltean con muchas verduras. Además se condimenta el plato con un chorrito de salsas, vinagre y negro.',
      'fr':
          'Les nouilles aux légumes sont un plat sain d\'inspiration chinoise où les nouilles cuites sont sautées avec beaucoup de légumes. De plus, le plat est assaisonné d\'un peu de sauces, de vinaigre et de noir.',
    },
    'un5igpay': {
      'en': 'Read More',
      'es': 'Leer más',
      'fr': 'En savoir plus',
    },
    'dq83u7hh': {
      'en': 'Location',
      'es': 'Ubicación',
      'fr': 'Emplacement',
    },
    'dceucnoh': {
      'en': 'Open Location',
      'es': 'Cancelar',
      'fr': 'Annuler',
    },
    '0n2lpldx': {
      'en': 'Reviews',
      'es': 'Reseñas',
      'fr': 'Commentaires',
    },
    'vgc5a2nk': {
      'en': 'See All',
      'es': 'Ver todo',
      'fr': 'Voir tout',
    },
    'b6kmz9rt': {
      'en':
          'Vegetable noodles is a healthy Chinese inspired dish where cooked noodles are stir fried with lots of vegetables. Further the dish is seasoned with a splash of sauces, vinegar and black ',
      'es':
          'Los fideos con verduras son un plato saludable de inspiración china en el que los fideos cocidos se saltean con muchas verduras. Además se condimenta el plato con un chorrito de salsas, vinagre y negro.',
      'fr':
          'Les nouilles aux légumes sont un plat sain d\'inspiration chinoise où les nouilles cuites sont sautées avec beaucoup de légumes. De plus, le plat est assaisonné d\'un peu de sauces, de vinaigre et de noir.',
    },
    'ckxkhh81': {
      'en': 'Read More',
      'es': 'Leer más',
      'fr': 'En savoir plus',
    },
    '07lvoimy': {
      'en': '\$ ',
      'es': 'ps',
      'fr': '\$',
    },
    'p7z4pmcv': {
      'en': '35.25',
      'es': '35.25',
      'fr': '35h25',
    },
    '8k65ncpp': {
      'en': 'Add to Cart',
      'es': 'añadir a la cesta',
      'fr': 'Ajouter au panier',
    },
    'i1oj2yib': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Cart
  {
    '207mlkda': {
      'en': 'My Cart',
      'es': 'Mi carrito',
      'fr': 'Mon panier',
    },
    '66vsdezz': {
      'en': 'FoodCort Discount',
      'es': 'Descuento en FoodCort',
      'fr': 'Remise FoodCort',
    },
    '75x4p2z2': {
      'en': '40% discount for purchases over ',
      'es': '40% de descuento por compras superiores',
      'fr': '40 % de réduction pour les achats supérieurs à',
    },
    '22a6bktg': {
      'en': '\$30 ',
      'es': '\$30',
      'fr': '30 \$',
    },
    'htyankjb': {
      'en': ', valid for today only',
      'es': ', válido solo por hoy',
      'fr': ', valable aujourd\'hui seulement',
    },
    'rd1249ma': {
      'en': 'Get Discount',
      'es': 'Reclame el descuento',
      'fr': 'Réclamez la réduction',
    },
    'zy9wy916': {
      'en': 'Top of the week',
      'es': 'Lo mejor de la semana',
      'fr': 'Haut de la semaine',
    },
    'y54nx8qv': {
      'en': 'See All',
      'es': 'Ver todo',
      'fr': 'Voir tout',
    },
    'epb53p4l': {
      'en': 'Premium vegetable salad',
      'es': 'Ensalada de verduras premium',
      'fr': 'Salade de légumes haut de gamme',
    },
    'ntq4kj53': {
      'en': '\$ ',
      'es': 'ps',
      'fr': '\$',
    },
    'f8ym6ksg': {
      'en': '6.17',
      'es': '6.17',
      'fr': '6.17',
    },
    'wjruofus': {
      'en': 'Grilled meat with kepunari sauce',
      'es': 'Carne a la parrilla con salsa kepunari',
      'fr': 'Viande grillée à la sauce kepunari',
    },
    'ylq55zkc': {
      'en': '\$ ',
      'es': 'ps',
      'fr': '\$',
    },
    'jp6zen4a': {
      'en': '6.17',
      'es': '6.17',
      'fr': '6.17',
    },
    '3wtzgjwj': {
      'en': 'Order Total',
      'es': 'Total del pedido',
      'fr': 'Total de la commande',
    },
    'iy8yjyaj': {
      'en': '\$ ',
      'es': 'ps',
      'fr': '\$',
    },
    '1j0h80j2': {
      'en': '6.17',
      'es': '6.17',
      'fr': '6.17',
    },
    'zianva9b': {
      'en': 'Checkout',
      'es': 'Verificar',
      'fr': 'Vérifier',
    },
    '4c4j2qiq': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Checkout
  {
    'obpxi59l': {
      'en': 'Checkout',
      'es': 'Verificar',
      'fr': 'Vérifier',
    },
    'itb5cibu': {
      'en': 'Address',
      'es': 'DIRECCIÓN',
      'fr': 'Adresse',
    },
    'ufb3z8kz': {
      'en': 'Edit',
      'es': 'Editar',
      'fr': 'Modifier',
    },
    '536bmziz': {
      'en': 'House',
      'es': 'Casa',
      'fr': 'Maison',
    },
    'n47csmvi': {
      'en': '5482 Adobe Falls Rd #15San Diego, California(CA), 92120',
      'es': '5482 Adobe Falls Rd #15San Diego, California (CA), 92120',
      'fr': '5482 Adobe Falls Rd #15San Diego, Californie(CA), 92120',
    },
    'hwp6mses': {
      'en': 'Payment Method',
      'es': 'Método de pago',
      'fr': 'Mode de paiement',
    },
    'ahpgbw52': {
      'en': 'Master Card',
      'es': 'Tarjeta maestra',
      'fr': 'Carte maîtresse',
    },
    'ntrn2nxd': {
      'en': '**** **** 1234',
      'es': '**** **** 1234',
      'fr': '**** **** 1234',
    },
    '5bayq5h5': {
      'en': 'Voucher Code',
      'es': 'Código de cupón',
      'fr': 'Code de réduction',
    },
    'ly0savik': {
      'en': 'Enter voucher code',
      'es': 'Ingrese código de descuento',
      'fr': 'Entrer le code du bon',
    },
    'l8pyfy3g': {
      'en': 'Shipping cost',
      'es': 'Costo de envío',
      'fr': 'Frais de port',
    },
    'vjf48y0r': {
      'en': '\$ ',
      'es': 'ps',
      'fr': '\$',
    },
    'rc8svr5j': {
      'en': '5.31',
      'es': '5.31',
      'fr': '5.31',
    },
    'jx806v5n': {
      'en': 'Sub total',
      'es': 'Subtotal',
      'fr': 'Sous total',
    },
    'im6mqt0c': {
      'en': '\$ ',
      'es': 'ps',
      'fr': '\$',
    },
    'wlznp75v': {
      'en': '16.00',
      'es': '16.00',
      'fr': '16h00',
    },
    'gzdait6f': {
      'en': 'Total',
      'es': 'Total',
      'fr': 'Total',
    },
    'qosqpewi': {
      'en': '\$ ',
      'es': 'ps',
      'fr': '\$',
    },
    '5w256x3j': {
      'en': '21.31',
      'es': '21.31',
      'fr': '21h31',
    },
    'udrbhlhk': {
      'en': 'Checkout Now',
      'es': 'Chequear ahora',
      'fr': 'Passer à la caisse',
    },
    's9adsn9i': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Address
  {
    'urmw7no6': {
      'en': 'Address',
      'es': 'DIRECCIÓN',
      'fr': 'Adresse',
    },
    'nteubdc4': {
      'en': 'Choose your location',
      'es': 'Elija su ubicación',
      'fr': 'Choisissez votre emplacement',
    },
    '4mrn5ye1': {
      'en':
          'Let’s find your unforgettable event. Choose a location below to get started.',
      'es':
          'Busquemos tu evento inolvidable. Elija una ubicación a continuación para comenzar.',
      'fr':
          'Trouvons votre événement inoubliable. Choisissez un emplacement ci-dessous pour commencer.',
    },
    'siafv1qg': {
      'en': 'San Diego, CA',
      'es': 'San Diego, California, EE.UU.',
      'fr': 'San Diego, Californie',
    },
    'j66jqcah': {
      'en': 'Payment Method',
      'es': 'Método de pago',
      'fr': 'Mode de paiement',
    },
    '13ahy3hd': {
      'en': 'Master Card',
      'es': 'Tarjeta maestra',
      'fr': 'Carte maîtresse',
    },
    'yxdyjb7k': {
      'en': '**** **** 1234',
      'es': '**** **** 1234',
      'fr': '**** **** 1234',
    },
    'wi0sirhi': {
      'en': 'Select location',
      'es': 'Seleccionar ubicación',
      'fr': 'Sélectionnez l\'emplacement',
    },
    'z6t3f3ld': {
      'en': 'Los Angeles',
      'es': 'los Angeles',
      'fr': 'Los Angeles',
    },
    '04p1rafk': {
      'en': 'Los Angeles, United States',
      'es': 'Los Ángeles, Estados Unidos',
      'fr': 'Los Angeles, États-Unis',
    },
    '30qmpqtl': {
      'en': 'Confirm',
      'es': 'Confirmar',
      'fr': 'Confirmer',
    },
    'uta3xo88': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // AddNewCard
  {
    '1fls4zbe': {
      'en': 'Add New Card',
      'es': 'Agregar nueva tarjeta',
      'fr': 'Ajouter une nouvelle carte',
    },
    '8tqeg719': {
      'en': 'Card Number',
      'es': 'Número de tarjeta',
      'fr': 'Numéro de carte',
    },
    'whwwsqyj': {
      'en': 'Enter Card Number',
      'es': 'Ingrese el número de tarjeta',
      'fr': 'Entrez le numéro de carte',
    },
    'e1jkqztn': {
      'en': 'Card Holder Name',
      'es': 'Nombre del titular de la tarjeta',
      'fr': 'Nom du titulaire',
    },
    'qmfbitqj': {
      'en': 'Enter Holder Name',
      'es': 'Ingrese el nombre del titular',
      'fr': 'Entrez le nom du titulaire',
    },
    'z7a2vdhr': {
      'en': 'Expired',
      'es': 'Venció',
      'fr': 'Expiré',
    },
    'itfkuv3g': {
      'en': 'MM/YY',
      'es': 'MM/AA',
      'fr': 'MM/AA',
    },
    '70eg1hir': {
      'en': 'CVV Code',
      'es': 'codigo CVV',
      'fr': 'Code CVV',
    },
    '8bvf8fns': {
      'en': 'CCV',
      'es': 'CCV',
      'fr': 'CVC',
    },
    'v3wjfpim': {
      'en': 'Add Card',
      'es': 'Agregar tarjeta',
      'fr': 'Ajouter une carte',
    },
    '2nfguei3': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Voucher
  {
    '7ulyi17a': {
      'en': 'Voucher',
      'es': 'Vale',
      'fr': 'Bon',
    },
    'h1dgk5vl': {
      'en': 'Enter voucher code',
      'es': 'Ingrese código de descuento',
      'fr': 'Entrer le code du bon',
    },
    'eafg2347': {
      'en': 'FoodCort Discount',
      'es': 'Descuento en FoodCort',
      'fr': 'Remise FoodCort',
    },
    'a2eqxfqk': {
      'en': '40% discount for purchases over ',
      'es': '40% de descuento por compras superiores',
      'fr': '40 % de réduction pour les achats supérieurs à',
    },
    'yu1hp85w': {
      'en': '\$30 ',
      'es': '\$30',
      'fr': '30 \$',
    },
    'rfwc3vsv': {
      'en': ', valid for today only',
      'es': ', válido solo por hoy',
      'fr': ', valable aujourd\'hui seulement',
    },
    '8c0nd894': {
      'en': 'Get Discount',
      'es': 'Obtener descuento',
      'fr': 'Obtenez une remise',
    },
    'q2579seh': {
      'en': 'Super Discount!',
      'es': '¡Súper descuento!',
      'fr': 'Super remise !',
    },
    '8zd8b1bs': {
      'en': '40% discount for purchases over ',
      'es': '40% de descuento por compras superiores',
      'fr': '40 % de réduction pour les achats supérieurs à',
    },
    '0j979bgp': {
      'en': '\$30 ',
      'es': '\$30',
      'fr': '30 \$',
    },
    'fltnzjq8': {
      'en': ', valid for today only',
      'es': ', válido solo por hoy',
      'fr': ', valable aujourd\'hui seulement',
    },
    '2fb4jlh6': {
      'en': 'Claim The Discount',
      'es': 'Reclame el descuento',
      'fr': 'Réclamez la réduction',
    },
    'ju1nzq2e': {
      'en': '2',
      'es': '2',
      'fr': '2',
    },
    '7t4z6asl': {
      'en': 'FoodCort Discount',
      'es': 'Descuento en FoodCort',
      'fr': 'Remise FoodCort',
    },
    'vgpdy1v9': {
      'en': '40% discount for purchases over ',
      'es': '40% de descuento por compras superiores',
      'fr': '40 % de réduction pour les achats supérieurs à',
    },
    '5182k6di': {
      'en': '\$30 ',
      'es': '\$30',
      'fr': '30 \$',
    },
    'qjrxisu7': {
      'en': ', valid for today only',
      'es': ', válido solo por hoy',
      'fr': ', valable aujourd\'hui seulement',
    },
    's526oof5': {
      'en': 'Get Discount',
      'es': 'Obtener descuento',
      'fr': 'Obtenez une remise',
    },
    '4xgsj85p': {
      'en': 'Favorite',
      'es': 'Favorito',
      'fr': 'Préféré',
    },
  },
  // Notifications
  {
    '7xeyt3wn': {
      'en': 'Notification',
      'es': 'Notificación',
      'fr': 'Notification',
    },
    'v9zj1lqj': {
      'en': 'Today',
      'es': 'Hoy',
      'fr': 'Aujourd\'hui',
    },
    'oqbwrpnh': {
      'en': 'Discount voucher!',
      'es': '¡Vale de descuento!',
      'fr': 'Bon de réduction !',
    },
    'h1prwlxt': {
      'en': '5min ago',
      'es': 'Hace 5 minutos',
      'fr': 'il y a 5 minutes',
    },
    'etwd1z7n': {
      'en': 'New update! Ver 1.87',
      'es': '¡Nueva actualización! Versión 1.87',
      'fr': 'Nouvelle mise à jour! Version 1.87',
    },
    'v0ypysbt': {
      'en': '20min ago',
      'es': 'Hace 20 minutos',
      'fr': 'il y a 20 minutes',
    },
    'geyy08x6': {
      'en': 'New message from Chris',
      'es': 'Nuevo mensaje de Chris',
      'fr': 'Nouveau message de Chris',
    },
    'sg7ky4vq': {
      'en': '35min ago',
      'es': 'Hace 35 minutos',
      'fr': 'il y a 35 minutes',
    },
    'lehiwmn2': {
      'en': 'Discount voucher! 50%',
      'es': '¡Vale de descuento! 50%',
      'fr': 'Bon de réduction ! 50%',
    },
    '8ccbuyp1': {
      'en': '2hour 60min ago',
      'es': 'Hace 2 horas 60 minutos',
      'fr': 'il y a 2 heures 60 minutes',
    },
    'wh324nbh': {
      'en': 'Yesterday',
      'es': 'Ayer',
      'fr': 'Hier',
    },
    'k3pnpz7c': {
      'en': 'Discount voucher!',
      'es': '¡Vale de descuento!',
      'fr': 'Bon de réduction !',
    },
    '544pu051': {
      'en': '5min ago',
      'es': 'Hace 5 minutos',
      'fr': 'il y a 5 minutes',
    },
    'a7l0sc65': {
      'en': 'New update! Ver 1.87',
      'es': '¡Nueva actualización! Versión 1.87',
      'fr': 'Nouvelle mise à jour! Version 1.87',
    },
    'g3f0az5d': {
      'en': '20min ago',
      'es': 'Hace 20 minutos',
      'fr': 'il y a 20 minutes',
    },
    '2to6yrso': {
      'en': 'New message from Chris',
      'es': 'Nuevo mensaje de Chris',
      'fr': 'Nouveau message de Chris',
    },
    'o2xb50hb': {
      'en': '35min ago',
      'es': 'Hace 35 minutos',
      'fr': 'il y a 35 minutes',
    },
    '514iimtt': {
      'en': 'Discount voucher! 50%',
      'es': '¡Vale de descuento! 50%',
      'fr': 'Bon de réduction ! 50%',
    },
    'hspwuxdq': {
      'en': '2hour 60min ago',
      'es': 'Hace 2 horas 60 minutos',
      'fr': 'il y a 2 heures 60 minutes',
    },
    'j6d49hyr': {
      'en': 'Discount voucher! 50%',
      'es': '¡Vale de descuento! 50%',
      'fr': 'Bon de réduction ! 50%',
    },
    'fggqlhln': {
      'en': '2hour 60min ago',
      'es': 'Hace 2 horas 60 minutos',
      'fr': 'il y a 2 heures 60 minutes',
    },
    'p9pn3mm5': {
      'en': 'Favorite',
      'es': 'Favorito',
      'fr': 'Préféré',
    },
  },
  // Setting
  {
    '82jnfyxo': {
      'en': 'Setting',
      'es': 'Configuración',
      'fr': 'Paramètre',
    },
    'k9p4o7mq': {
      'en': 'General',
      'es': 'General',
      'fr': 'Général',
    },
    'huf27lxh': {
      'en': 'Edit Profile',
      'es': 'Editar perfil',
      'fr': 'Editer le profil',
    },
    'ds506agm': {
      'en': 'Change Password',
      'es': 'Cambiar la contraseña',
      'fr': 'Changer le mot de passe',
    },
    '9b6hsp48': {
      'en': 'Notifications',
      'es': 'Notificaciones',
      'fr': 'Notifications',
    },
    'rnd1sxmy': {
      'en': 'Notification Setting',
      'es': 'Notificación de configuración',
      'fr': 'Paramètre de notification',
    },
    '5981i303': {
      'en': 'Security',
      'es': 'Seguridad',
      'fr': 'Sécurité',
    },
    '3vea7j2p': {
      'en': 'Language',
      'es': 'Idioma',
      'fr': 'Langue',
    },
    'cow5ksut': {
      'en': 'Preferencess',
      'es': 'Preferencias',
      'fr': 'Préférences',
    },
    'ivdshgsr': {
      'en': 'Legal and Policies',
      'es': 'Legales y Políticas',
      'fr': 'Mentions légales et politiques',
    },
    '33gpjjpl': {
      'en': 'Help & Support',
      'es': 'Servicio de asistencia',
      'fr': 'Support d\'aide',
    },
    '4k922abp': {
      'en': 'Logout',
      'es': 'Cerrar sesión',
      'fr': 'Se déconnecter',
    },
    'ihvwbj05': {
      'en': 'Foodcort Version 1.0.12 Build 24',
      'es': 'Foodcort Versión 1.0.12 Compilación 24',
      'fr': 'Foodcort version 1.0.12 version 24',
    },
    'tpcxi4d9': {
      'en': 'Setting',
      'es': 'Configuración',
      'fr': 'Paramètre',
    },
  },
  // EditProfile
  {
    'czlgmhds': {
      'en': 'Edit Profile',
      'es': 'Editar perfil',
      'fr': 'Editer le profil',
    },
    '36zgxj4d': {
      'en': 'Username',
      'es': 'Nombre de usuario',
      'fr': 'Nom d\'utilisateur',
    },
    '3ia1b2s1': {
      'en': 'Create your username',
      'es': 'Crea tu nombre de usuario',
      'fr': 'Créez votre nom d\'utilisateur',
    },
    '0971o55p': {
      'en': 'Arsalan Qureshi',
      'es': '',
      'fr': '',
    },
    'y62t4x4v': {
      'en': 'Email or Phone Number',
      'es': 'Correo electrónico o número de teléfono',
      'fr': 'E-mail ou numéro de téléphone',
    },
    'qoq8rd90': {
      'en': 'Enter your email or phone number',
      'es': 'Introduce tu correo electrónico o número de teléfono',
      'fr': 'Entrez votre email ou votre numéro de téléphone',
    },
    'qxqof0m6': {
      'en': 'arsalan.devapps@gmail.com',
      'es': '',
      'fr': '',
    },
    '8c7103h3': {
      'en': 'Account Liked With',
      'es': 'Cuenta que le ha gustado',
      'fr': 'Compte aimé avec',
    },
    'w6ao9nf7': {
      'en': 'Google connected.',
      'es': 'Google conectado.',
      'fr': 'Google connecté.',
    },
    '2es027e3': {
      'en': 'Connect device',
      'es': 'Conectar dispositivo',
      'fr': 'Connecter l\'appareil',
    },
    'vrtr6uvq': {
      'en': 'Save Changes',
      'es': 'Guardar cambios',
      'fr': 'Sauvegarder les modifications',
    },
    'ubo5xh9z': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // ChangePassword
  {
    'qta47nw1': {
      'en': 'Change Password',
      'es': 'Cambiar la contraseña',
      'fr': 'Changer le mot de passe',
    },
    'm44q6y3o': {
      'en': 'New Password',
      'es': 'Nueva contraseña',
      'fr': 'nouveau mot de passe',
    },
    'ytk5ba6l': {
      'en': 'Enter new password',
      'es': 'Ingrese nueva clave',
      'fr': 'Entrez un nouveau mot de passe',
    },
    '8dzaf869': {
      'en': 'Confirm Password',
      'es': 'confirmar Contraseña',
      'fr': 'Confirmez le mot de passe',
    },
    '8q91wovk': {
      'en': 'Confirm your new password',
      'es': 'Confirma tu nueva contraseña',
      'fr': 'Confirmez votre nouveau mot de passe',
    },
    'hi2yymxk': {
      'en': 'Chnage Now',
      'es': 'Cambiar ahora',
      'fr': 'Changement maintenant',
    },
    '92rkz0wl': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Language
  {
    'pw9fhsfe': {
      'en': 'Language',
      'es': 'Idioma',
      'fr': 'Langue',
    },
    '54vikyjk': {
      'en': 'Search language',
      'es': 'Idioma de búsqueda',
      'fr': 'Langue de recherche',
    },
    '6x0nymve': {
      'en': 'English',
      'es': 'Inglés',
      'fr': 'Anglais',
    },
    'lwrdsvca': {
      'en': 'Spanish',
      'es': 'Español',
      'fr': 'Espagnol',
    },
    'h8koak8c': {
      'en': 'French',
      'es': 'Francés',
      'fr': 'Français',
    },
    '3sa48wmg': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // NotificationSetting
  {
    'pv5ygd8b': {
      'en': 'Notifications',
      'es': 'Notificaciones',
      'fr': 'Notifications',
    },
    'inr065ip': {
      'en': 'Payment',
      'es': 'Pago',
      'fr': 'Paiement',
    },
    'ltse1dpj': {
      'en': 'Tracking',
      'es': 'Seguimiento',
      'fr': 'Suivi',
    },
    'ma7hjc40': {
      'en': 'Complete Order',
      'es': 'Orden completa',
      'fr': 'Complétez la commande',
    },
    'ohk8lp29': {
      'en': 'Notification',
      'es': 'Notificación',
      'fr': 'Notification',
    },
    'vmced3si': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Security
  {
    'xsh3ud2y': {
      'en': 'Security',
      'es': 'Seguridad',
      'fr': 'Sécurité',
    },
    '0cxkq1k7': {
      'en': 'Face ID',
      'es': 'identificación facial',
      'fr': 'Identification du visage',
    },
    'vf4xbxza': {
      'en': 'Remember Password',
      'es': 'Recordar contraseña',
      'fr': 'Se souvenir du mot de passe',
    },
    'rhp8x8nn': {
      'en': 'Touch ID',
      'es': 'identifición de toque',
      'fr': 'Toucher l\'identification',
    },
    '9e2s3fhc': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // HelpandSupport
  {
    'pwzylnu2': {
      'en': 'Help and Support',
      'es': 'Ayuda y apoyo',
      'fr': 'Aide et soutien',
    },
    '0hxomwjo': {
      'en': 'Search',
      'es': 'Buscar',
      'fr': 'Recherche',
    },
    'u7zay0at': {
      'en': 'Support title',
      'es': 'Título de soporte',
      'fr': 'Titre de l\'assistance',
    },
    'iq6peolc': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\n\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'es':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\n\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'fr':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\n\nquis nostrud exercice ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    },
    'iku16ozk': {
      'en': 'Support title',
      'es': 'Título de soporte',
      'fr': 'Titre de l\'assistance',
    },
    '70iqrdwa': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\n\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'es':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\n\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'fr':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\n\nquis nostrud exercice ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    },
    '5j0pbo9z': {
      'en': 'Support title',
      'es': 'Título de soporte',
      'fr': 'Titre de l\'assistance',
    },
    'm803mq12': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\n\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'es':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\n\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'fr':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\n\nquis nostrud exercice ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    },
    'dhwvt3h7': {
      'en': 'Support title',
      'es': 'Título de soporte',
      'fr': 'Titre de l\'assistance',
    },
    'bkjcz8kj': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\n\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'es':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\n\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'fr':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\n\nquis nostrud exercice ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    },
    'clq57ljv': {
      'en': 'Support title',
      'es': 'Título de soporte',
      'fr': 'Titre de l\'assistance',
    },
    'vvpixpr1': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\n\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'es':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\n\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'fr':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\n\nquis nostrud exercice ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    },
    'leiu5g56': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // LegalAndPolicies
  {
    'vkgb4h04': {
      'en': 'Legal and Policies',
      'es': 'Legales y Políticas',
      'fr': 'Mentions légales et politiques',
    },
    'icfwkxvp': {
      'en': 'Terms',
      'es': 'Términos',
      'fr': 'Termes',
    },
    'd216tz8f': {
      'en':
          'By using this application, you agree to comply with and be bound by the following terms and conditions. Please review them carefully. If you do not agree to these terms, you should not use this application. The term \"us\" or \"we\" refers to [Your Company Name], the owner of this application. The term \"you\" refers to the user or viewer of our application.\n\nTerms, you should not use this application. The term \"us\" or \"we\" refers to [Your Company Name], the owner of this application. The term \"you\" refers to the user or viewer of our application.',
      'es':
          'Al utilizar esta aplicación, usted acepta cumplir y estar sujeto a los siguientes términos y condiciones. Por favor revíselos detenidamente. Si no está de acuerdo con estos términos, no debe utilizar esta aplicación. El término \"nosotros\" o \"nosotros\" se refiere a [Nombre de su empresa], el propietario de esta aplicación. El término \"usted\" se refiere al usuario o espectador de nuestra aplicación.\n\nTérminos, no debes utilizar esta aplicación. El término \"nosotros\" o \"nosotros\" se refiere a [Nombre de su empresa], el propietario de esta aplicación. El término \"usted\" se refiere al usuario o espectador de nuestra aplicación.',
      'fr':
          'En utilisant cette application, vous acceptez de respecter et d\'être lié par les termes et conditions suivants. Veuillez les examiner attentivement. Si vous n\'acceptez pas ces conditions, vous ne devez pas utiliser cette application. Le terme « nous » ou « nous » fait référence à [Nom de votre entreprise], propriétaire de cette application. Le terme « vous » fait référence à l\'utilisateur ou au spectateur de notre application.\n\nConditions, vous ne devez pas utiliser cette application. Le terme « nous » ou « nous » fait référence à [Nom de votre entreprise], propriétaire de cette application. Le terme « vous » fait référence à l\'utilisateur ou au spectateur de notre application.',
    },
    'mf4seg4j': {
      'en': 'Changes to the Service and/or Terms:',
      'es': 'Cambios al Servicio y/o Términos:',
      'fr': 'Modifications du Service et/ou des Conditions :',
    },
    '4aolvysc': {
      'en':
          'This application is provided to you \"as is,\" and we make no express or implied warranties whatsoever with respect to its functionality, operability, or use, including, without limitation.\n\nAny implied warranties of merchantability, fitness for a particular purpose, or infringement. We expressly disclaim any liability whatsoever for any direct, indirect, consequential, incidental or special damages, including, without limitation, lost revenues, lost profits, losses resulting from business interruption or loss of \n\ndata, regardless of the form of action or legal theory under which the liability may be asserted, even if advised of the possibility or likelihood of such damages.\n\n\nBy using this application, you agree to comply with and be bound by the following terms and conditions. Please review them carefully. If you do not agree to these terms, you should not use this application. The term \"us\" or \"we\" refers to [Your Company Name], the owner of this application. The term \"you\" refers to the user or viewer of our application.',
      'es':
          'Esta aplicación se le proporciona \"tal cual\" y no ofrecemos garantía expresa o implícita de ningún tipo con respecto a su funcionalidad, operatividad o uso, incluidos, entre otros.\n\nCualquier garantía implícita de comerciabilidad, idoneidad para un propósito particular o infracción. Renunciamos expresamente a cualquier responsabilidad por daños directos, indirectos, consecuentes, incidentales o especiales, incluidos, entre otros, pérdida de ingresos, pérdida de ganancias, pérdidas resultantes de la interrupción del negocio o la pérdida de\n\ndatos, independientemente de la forma de acción o teoría jurídica bajo la cual se pueda hacer valer la responsabilidad, incluso si se le advierte de la posibilidad o probabilidad de tales daños.\n\n\nAl utilizar esta aplicación, usted acepta cumplir y estar sujeto a los siguientes términos y condiciones. Por favor revíselos detenidamente. Si no está de acuerdo con estos términos, no debe utilizar esta aplicación. El término \"nosotros\" o \"nosotros\" se refiere a [Nombre de su empresa], el propietario de esta aplicación. El término \"usted\" se refiere al usuario o espectador de nuestra aplicación.',
      'fr':
          'Cette application vous est fournie « telle quelle » et nous n\'offrons aucune garantie expresse ou implicite de quelque nature que ce soit en ce qui concerne sa fonctionnalité, son opérabilité ou son utilisation, y compris, sans limitation.\n\nToute garantie implicite de qualité marchande, d’adéquation à un usage particulier ou de contrefaçon. Nous déclinons expressément toute responsabilité, quelle qu\'elle soit, pour tout dommage direct, indirect, consécutif, accidentel ou spécial, y compris, sans limitation, la perte de revenus, la perte de profits, les pertes résultant d\'une interruption des activités ou d\'une perte de\n\ndonnées, quelle que soit la forme d\'action ou la théorie juridique en vertu de laquelle la responsabilité peut être invoquée, même si elle est informée de la possibilité ou de la probabilité de tels dommages.\n\n\nEn utilisant cette application, vous acceptez de respecter et d\'être lié par les termes et conditions suivants. Veuillez les examiner attentivement. Si vous n\'acceptez pas ces conditions, vous ne devez pas utiliser cette application. Le terme « nous » ou « nous » fait référence à [Nom de votre entreprise], propriétaire de cette application. Le terme « vous » fait référence à l\'utilisateur ou au spectateur de notre application.',
    },
    'x014ew2n': {
      'en': 'Terms',
      'es': 'Términos',
      'fr': 'Termes',
    },
    'o3qpa1ln': {
      'en':
          'By using this application, you agree to comply with and be bound by the following terms and conditions. Please review them carefully. If you do not agree to these terms, you should not use this application. The term \"us\" or \"we\" refers to [Your Company Name], the owner of this application. The term \"you\" refers to the user or viewer of our application.\n\nTerms, you should not use this application. The term \"us\" or \"we\" refers to [Your Company Name], the owner of this application. The term \"you\" refers to the user or viewer of our application.',
      'es':
          'Al utilizar esta aplicación, usted acepta cumplir y estar sujeto a los siguientes términos y condiciones. Por favor revíselos detenidamente. Si no está de acuerdo con estos términos, no debe utilizar esta aplicación. El término \"nosotros\" o \"nosotros\" se refiere a [Nombre de su empresa], el propietario de esta aplicación. El término \"usted\" se refiere al usuario o espectador de nuestra aplicación.\n\nTérminos, no debes utilizar esta aplicación. El término \"nosotros\" o \"nosotros\" se refiere a [Nombre de su empresa], el propietario de esta aplicación. El término \"usted\" se refiere al usuario o espectador de nuestra aplicación.',
      'fr':
          'En utilisant cette application, vous acceptez de respecter et d\'être lié par les termes et conditions suivants. Veuillez les examiner attentivement. Si vous n\'acceptez pas ces conditions, vous ne devez pas utiliser cette application. Le terme « nous » ou « nous » fait référence à [Nom de votre entreprise], propriétaire de cette application. Le terme « vous » fait référence à l\'utilisateur ou au spectateur de notre application.\n\nConditions, vous ne devez pas utiliser cette application. Le terme « nous » ou « nous » fait référence à [Nom de votre entreprise], propriétaire de cette application. Le terme « vous » fait référence à l\'utilisateur ou au spectateur de notre application.',
    },
    '8uluwyex': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // registerSuccess_modal
  {
    'vkxriblo': {
      'en': 'Register Success',
      'es': 'Registro exitoso',
      'fr': 'Inscription réussie',
    },
    'h2xdozlk': {
      'en':
          'Congratulation! your account already created.\nPlease login to get amazing experience.',
      'es':
          '¡Felicitaciones! su cuenta ya creada.\nInicie sesión para obtener una experiencia increíble.',
      'fr':
          'Félicitation ! votre compte déjà créé.\nVeuillez vous connecter pour vivre une expérience incroyable.',
    },
    't4tt10im': {
      'en': 'Go to Home',
      'es': 'Ir a casa',
      'fr': 'Aller à la maison',
    },
  },
  // ForgotPasswordPopup
  {
    '68da8o48': {
      'en': 'Forgot Password',
      'es': 'Has olvidado tu contraseña',
      'fr': 'Mot de passe oublié',
    },
    't0wp5kyz': {
      'en': 'Enter youe mail or phone number',
      'es': 'Ingrese su correo o número de teléfono',
      'fr': 'Entrez votre mail ou votre numéro de téléphone',
    },
    'laq1e1na': {
      'en': 'Email or Phone Number',
      'es': 'Correo electrónico o número de teléfono',
      'fr': 'E-mail ou numéro de téléphone',
    },
    '4wi8kjyp': {
      'en': 'Enter your email or phone number',
      'es': 'Introduce tu correo electrónico o número de teléfono',
      'fr': 'Entrez votre email ou votre numéro de téléphone',
    },
    '4ligppz0': {
      'en': 'Send Code',
      'es': 'Enviar código',
      'fr': 'Envoyer le code',
    },
  },
  // newPassword_modal
  {
    'rkilnmjw': {
      'en': 'Create New Password',
      'es': 'Crear nueva contraseña',
      'fr': 'Créer un nouveau mot de passe',
    },
    'ud34pzj3': {
      'en': 'Enter youe mail or phone number',
      'es': 'Ingrese su correo o número de teléfono',
      'fr': 'Entrez votre mail ou votre numéro de téléphone',
    },
    '96yt5u83': {
      'en': 'Password',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
    },
    '6xsz8kht': {
      'en': 'Create your password',
      'es': 'Crea tu contraseña',
      'fr': 'Créez votre mot de passe',
    },
    'w8i0tlah': {
      'en': 'Password',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
    },
    '667e4ujp': {
      'en': 'Create your password',
      'es': 'Crea tu contraseña',
      'fr': 'Créez votre mot de passe',
    },
    'ucakz1il': {
      'en': 'Change Password',
      'es': 'Cancelar',
      'fr': 'Annuler',
    },
  },
  // HotDealsCardItem
  {
    '5fyms2xp': {
      'en': '4.5',
      'es': '4.5',
      'fr': '4.5',
    },
    'dxto6avb': {
      'en': 'Roast beef with black pepper',
      'es': 'Carne asada con pimienta negra',
      'fr': 'Rôti de boeuf au poivre noir',
    },
    '0i4n5ela': {
      'en': '\$ ',
      'es': 'ps',
      'fr': '\$',
    },
    'wsxtfrt1': {
      'en': '9.67',
      'es': '9.67',
      'fr': '9.67',
    },
  },
  // TopOfWeekItem
  {
    'k7parin2': {
      'en': 'Grilled meat with kepunari sauce',
      'es': 'Carne a la parrilla con salsa kepunari',
      'fr': 'Viande grillée à la sauce kepunari',
    },
    'ueizz2wr': {
      'en': '4.4',
      'es': '4.4',
      'fr': '4.4',
    },
    'uwy2rjgg': {
      'en': '12 Minute',
      'es': '12 minutos',
      'fr': '12 minutes',
    },
    'a1nj6sno': {
      'en': '\$ ',
      'es': 'ps',
      'fr': '\$',
    },
    'dswoy0wv': {
      'en': '12.05',
      'es': '12.05',
      'fr': '12.05',
    },
  },
  // FilterPopup
  {
    '8jo71kve': {
      'en': 'San Diego, CA',
      'es': 'San Diego, California, EE.UU.',
      'fr': 'San Diego, Californie',
    },
    '8eo5q4gq': {
      'en': 'Sort by',
      'es': 'Ordenar por',
      'fr': 'Trier par',
    },
    'qm6mzjkr': {
      'en': 'Recommended',
      'es': 'Recomendado',
      'fr': 'Recommandé',
    },
    '2s5gpezj': {
      'en': 'Nearest',
      'es': 'Más cercano',
      'fr': 'La plus proche',
    },
    'iclmvv58': {
      'en': 'Fastest',
      'es': 'Lo más rápido',
      'fr': 'Le plus rapide',
    },
    'ra08b12o': {
      'en': 'Categories',
      'es': 'Categorías',
      'fr': 'Catégories',
    },
    '9f5qk755': {
      'en': 'Hamburgers',
      'es': 'hamburguesas',
      'fr': 'Hamburgers',
    },
    'eicbxmen': {
      'en': 'Pizza',
      'es': 'Pizza',
      'fr': 'Pizza',
    },
    '1wc8f4us': {
      'en': 'Cookies',
      'es': 'Galletas',
      'fr': 'Biscuits',
    },
    'q4amxetw': {
      'en': 'Price Ranges',
      'es': 'Rangos de precios',
      'fr': 'Gammes de prix',
    },
    'hnv04kes': {
      'en': 'Apply Filter',
      'es': 'Aplicar filtro',
      'fr': 'Appliquer le filtre',
    },
  },
  // NearestLocationItem
  {
    'msl8hzk9': {
      'en': 'Delaska RIsaka',
      'es': 'Delaska RIsaka',
      'fr': 'Delaska RIsaka',
    },
    '5kn33zd0': {
      'en': '4.8',
      'es': '4.8',
      'fr': '4.8',
    },
    '0lvbcm6x': {
      'en': 'Close 10.45 PM',
      'es': 'Cierre 22:45',
      'fr': 'Fermeture à 22h45',
    },
  },
  // confirm_modal
  {
    'wss38bpn': {
      'en': 'Are you sure you want to activate your location?',
      'es': '¿Estás seguro de que quieres activar tu ubicación?',
      'fr': 'Etes-vous sûr de vouloir activer votre localisation ?',
    },
    '29xlhpns': {
      'en': 'Cancel',
      'es': 'Cancelar',
      'fr': 'Annuler',
    },
    'zuga39cj': {
      'en': 'Yes, Enable',
      'es': 'Sí, habilitar',
      'fr': 'Oui, activer',
    },
  },
  // addToCard_modal
  {
    'lqsllr27': {
      'en': 'Noodles',
      'es': 'Fideos',
      'fr': 'Nouilles',
    },
    'a2p37cxh': {
      'en': 'Fried grill noodles with egg special',
      'es': 'Fideos fritos a la parrilla con huevo especial',
      'fr': 'Nouilles grillées frites avec œuf spécial',
    },
    'fa7ttb41': {
      'en': '\$ ',
      'es': 'ps',
      'fr': '\$',
    },
    '2h9d34og': {
      'en': '6,17',
      'es': '6,17',
      'fr': '6,17',
    },
    '4qzgey7i': {
      'en': 'Add Extra Ingredients',
      'es': 'Agregue ingredientes adicionales',
      'fr': 'Ajouter des ingrédients supplémentaires',
    },
    'akeff4oi': {
      'en': 'Mustard',
      'es': 'Mostaza',
      'fr': 'Moutarde',
    },
    '03fv0zz3': {
      'en': '1 Grm',
      'es': '1 gr',
      'fr': '1 gramme',
    },
    'k9ldv5en': {
      'en': 'Onion',
      'es': 'Cebolla',
      'fr': 'Oignon',
    },
    'jv08oelk': {
      'en': '1 Clove',
      'es': '1 diente',
      'fr': '1 clou de girofle',
    },
    'fas1uqhn': {
      'en': 'Note',
      'es': 'Nota',
      'fr': 'Note',
    },
    'cchz1fp1': {
      'en': 'Write your note here',
      'es': 'Escribe tu nota aquí',
      'fr': 'Écrivez votre note ici',
    },
    '2afi00zd': {
      'en': 'Add to cart',
      'es': 'Añadir a la cesta',
      'fr': 'Ajouter au panier',
    },
  },
  // AddToCartItem
  {
    'u3pgx5vv': {
      'en': 'Noodles',
      'es': 'Fideos',
      'fr': 'Nouilles',
    },
    'uxac6ovs': {
      'en': 'Fried grill noodles with egg special',
      'es': 'Fideos fritos a la parrilla con huevo especial',
      'fr': 'Nouilles grillées frites avec œuf spécial',
    },
    '6ov4bl4b': {
      'en': '\$ ',
      'es': 'ps',
      'fr': '\$',
    },
    'bw669zmp': {
      'en': '6,17',
      'es': '6,17',
      'fr': '6,17',
    },
  },
  // AddExtraItem
  {
    '4wms16ni': {
      'en': 'Beef',
      'es': 'Carne de res',
      'fr': 'Bœuf',
    },
    'ejo6z1g1': {
      'en': '1 Slice',
      'es': '1 rebanada',
      'fr': '1 tranche',
    },
  },
  // MyCartItem
  {
    'acxq8c0g': {
      'en': 'Fresh prawns fried with extra onions',
      'es': 'Gambas frescas fritas con extra de cebolla',
      'fr': 'Crevettes fraîches frites avec des oignons supplémentaires',
    },
    'z0atyn19': {
      'en': '\$ ',
      'es': 'ps',
      'fr': '\$',
    },
    'bkk2t9yp': {
      'en': '6.17',
      'es': '6.17',
      'fr': '6.17',
    },
  },
  // SelectLocationItem
  {
    '3u9ubti5': {
      'en': 'Los Angeles',
      'es': 'los Angeles',
      'fr': 'Los Angeles',
    },
    'wu7s1swt': {
      'en': 'Los Angeles, United States',
      'es': 'Los Ángeles, Estados Unidos',
      'fr': 'Los Angeles, États-Unis',
    },
  },
  // SelectLocationItemCopy
  {
    'dcr5y2g6': {
      'en': 'Los Angeles',
      'es': 'los Angeles',
      'fr': 'Los Angeles',
    },
    'd3k2dpgt': {
      'en': 'Los Angeles, United States',
      'es': 'Los Ángeles, Estados Unidos',
      'fr': 'Los Angeles, États-Unis',
    },
  },
  // changePaymentMethod_modal
  {
    'vdt5chjy': {
      'en': 'Payment Method',
      'es': 'Método de pago',
      'fr': 'Mode de paiement',
    },
    'zt4sy9vi': {
      'en': 'Paypall',
      'es': 'pago',
      'fr': 'Paypal',
    },
    'omu8rwmb': {
      'en': 'sask****@mail.com',
      'es': 'sask****@mail.com',
      'fr': 'sask****@mail.com',
    },
    '4ujur370': {
      'en': 'Add Payment Method',
      'es': 'Añadir método de pago',
      'fr': 'Ajouter un mode de paiement',
    },
    'yx6c24gu': {
      'en': 'Upply the payment method',
      'es': 'Subir el método de pago',
      'fr': 'Ajouter le mode de paiement',
    },
  },
  // PaymentMethodItem
  {
    'clpxilmk': {
      'en': 'Mastercard',
      'es': 'Tarjeta MasterCard',
      'fr': 'MasterCard',
    },
    '7547er0v': {
      'en': '4827 8472 7424 ****',
      'es': '4827 8472 7424 ****',
      'fr': '4827 8472 7424 ****',
    },
  },
  // orderSuccess_modal
  {
    'ai8qoftl': {
      'en': 'Order Successfully',
      'es': 'Ordene con éxito',
      'fr': 'Commandez avec succès',
    },
    '8w3ex41n': {
      'en':
          'Happy! Your food will be made immediately and we will send it after it\'s finished by the courier, please wait a moment.',
      'es':
          '¡Feliz! Su comida se preparará inmediatamente y la enviaremos una vez que el mensajero la haya terminado, espere un momento.',
      'fr':
          'Heureux! Votre nourriture sera préparée immédiatement et nous l\'enverrons une fois terminée par le coursier, veuillez patienter un instant.',
    },
    'znwujg1g': {
      'en': 'Order Tracking',
      'es': 'Cancelar',
      'fr': 'Annuler',
    },
  },
  // MyOrderItem
  {
    '0kkxg04l': {
      'en': 'Delinas Resto',
      'es': 'Delinas Resto',
      'fr': 'Délinas Resto',
    },
    'ul6qwuuh': {
      'en': 'Date',
      'es': 'Fecha',
      'fr': 'Date',
    },
    '7sa1sgoe': {
      'en': '29 Desc 2022',
      'es': '29 dic 2022',
      'fr': '29 décembre 2022',
    },
    'v2q7ytxk': {
      'en': 'Price',
      'es': 'Precio',
      'fr': 'Prix',
    },
    '7ps520k7': {
      'en': '\$35.05',
      'es': '\$35.05',
      'fr': '35,05 \$',
    },
    'p1ci0hje': {
      'en': 'Detail',
      'es': 'Reclame el descuento',
      'fr': 'Réclamez la réduction',
    },
    'qj8muj7x': {
      'en': 'Tracking',
      'es': 'Seguimiento',
      'fr': 'Suivi',
    },
  },
  // ButtonOrderStatus
  {
    'eh2zj9q4': {
      'en': 'On Progress',
      'es': 'En progreso',
      'fr': 'En progrès',
    },
  },
  // FavoriteItem
  {
    '10hcqqzp': {
      'en': 'Premium vegetable salad',
      'es': 'Ensalada de verduras premium',
      'fr': 'Salade de légumes haut de gamme',
    },
    '3ipz56iu': {
      'en': '4.4',
      'es': '4.4',
      'fr': '4.4',
    },
    'h937j6qa': {
      'en': '12 Minute',
      'es': '12 minutos',
      'fr': '12 minutes',
    },
    't8839z31': {
      'en': '\$ ',
      'es': 'ps',
      'fr': '\$',
    },
    'vr8mv808': {
      'en': '6.17',
      'es': '6.17',
      'fr': '6.17',
    },
  },
  // VoucherItem
  {
    'swpl0p0m': {
      'en': 'FoodCort Discount',
      'es': 'Descuento en FoodCort',
      'fr': 'Remise FoodCort',
    },
    '3qc1a3vq': {
      'en': '40% discount for purchases over ',
      'es': '40% de descuento por compras superiores',
      'fr': '40 % de réduction pour les achats supérieurs à',
    },
    'x19lsosk': {
      'en': '\$30 ',
      'es': '\$30',
      'fr': '30 \$',
    },
    'ug615tq2': {
      'en': ', valid for today only',
      'es': ', válido solo por hoy',
      'fr': ', valable aujourd\'hui seulement',
    },
    'himear42': {
      'en': 'Get Discount',
      'es': 'Reclame el descuento',
      'fr': 'Réclamez la réduction',
    },
    'u1f04mcl': {
      'en': '3',
      'es': '3',
      'fr': '3',
    },
  },
  // logOut_modal
  {
    '38q11wq9': {
      'en': 'Are you sure you want to logout?',
      'es': '¿Está seguro de que desea cerrar sesión?',
      'fr': 'Êtes-vous sûr de vouloir vous déconnecter?',
    },
    'mpj8eknt': {
      'en': 'Cancel',
      'es': 'Cancelar',
      'fr': 'Annuler',
    },
    'p19zdwc8': {
      'en': 'Log Out',
      'es': 'Cerrar sesión',
      'fr': 'Se déconnecter',
    },
  },
  // navigator
  {
    'w4ui9cw8': {
      'en': 'Pages',
      'es': 'paginas',
      'fr': 'Pages',
    },
    'r9x56x9c': {
      'en': 'Add New payment method',
      'es': 'Agregar nuevo método de pago',
      'fr': 'Ajouter un nouveau mode de paiement',
    },
    '74gdmugu': {
      'en': 'Address',
      'es': 'DIRECCIÓN',
      'fr': 'Adresse',
    },
    '3kzxsnf1': {
      'en': 'Shopping Cart',
      'es': 'Carro de la compra',
      'fr': 'Panier',
    },
    'i3gyatzv': {
      'en': 'Change Password',
      'es': 'Cambiar la contraseña',
      'fr': 'Changer le mot de passe',
    },
    'sjrrg2g9': {
      'en': 'Checkout',
      'es': 'Verificar',
      'fr': 'Vérifier',
    },
    'rtio6ax8': {
      'en': 'Create Account',
      'es': 'Crear una cuenta',
      'fr': 'Créer un compte',
    },
    '1imgxewf': {
      'en': 'Details',
      'es': 'Detalles',
      'fr': 'Détails',
    },
    's2m6hsyu': {
      'en': 'Detail Two',
      'es': 'Detalle dos',
      'fr': 'Détail deux',
    },
    '5df5wb6d': {
      'en': 'Edit Profile',
      'es': 'Editar perfil',
      'fr': 'Editer le profil',
    },
    'sfo0wzam': {
      'en': 'Favorite',
      'es': 'Favorito',
      'fr': 'Préféré',
    },
    'cau894re': {
      'en': 'Help and Support',
      'es': 'Ayuda y apoyo',
      'fr': 'Aide et soutien',
    },
    'hu2inqjs': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
    'z0q5il1b': {
      'en': 'Home Two',
      'es': 'Hogar dos',
      'fr': 'Maison Deux',
    },
    'cryv162n': {
      'en': 'Change Language',
      'es': 'Cambiar idioma',
      'fr': 'Changer de langue',
    },
    'ubk0apu5': {
      'en': 'Policies',
      'es': 'Políticas',
      'fr': 'Stratégies',
    },
    'we3ke45m': {
      'en': 'Location',
      'es': 'Ubicación',
      'fr': 'Emplacement',
    },
    'hhdryzkt': {
      'en': 'Login',
      'es': 'Acceso',
      'fr': 'Se connecter',
    },
    'm70he3lc': {
      'en': 'My Order',
      'es': 'Mi pedido',
      'fr': 'Ma commande',
    },
    '2lq6kli6': {
      'en': 'Notifications',
      'es': 'Notificaciones',
      'fr': 'Notifications',
    },
    'gnn9z841': {
      'en': 'Notification Setting',
      'es': 'Notificación de configuración',
      'fr': 'Paramètre de notification',
    },
    'tl1qab9r': {
      'en': 'Onboarding',
      'es': 'Inducción',
      'fr': 'Intégration',
    },
    'w4d6l0xg': {
      'en': 'Security',
      'es': 'Seguridad',
      'fr': 'Sécurité',
    },
    '6vbi0byh': {
      'en': 'Setting',
      'es': 'Configuración',
      'fr': 'Paramètre',
    },
    '3wz6lqp1': {
      'en': 'Verification',
      'es': 'Verificación',
      'fr': 'Vérification',
    },
    'cu78oruw': {
      'en': 'Voucher',
      'es': 'Vale',
      'fr': 'Bon',
    },
    'oj3cf9cd': {
      'en': 'Modals',
      'es': 'modales',
      'fr': 'Modaux',
    },
    'uv5rjs14': {
      'en': 'Add to cart',
      'es': 'Añadir a la cesta',
      'fr': 'Ajouter au panier',
    },
    '6vf2cznr': {
      'en': 'Change payment method',
      'es': 'Cambiar método de pago',
      'fr': 'Changer la méthode de paiement',
    },
    '5o9cd5e2': {
      'en': 'Confirm',
      'es': 'Confirmar',
      'fr': 'Confirmer',
    },
    'c2evnsw5': {
      'en': 'Logout',
      'es': 'Cerrar sesión',
      'fr': 'Se déconnecter',
    },
    '8l5zbjdz': {
      'en': 'New Password',
      'es': 'Nueva contraseña',
      'fr': 'nouveau mot de passe',
    },
    'askd0uki': {
      'en': 'Order Success',
      'es': 'Orden exitosa',
      'fr': 'Succès de la commande',
    },
    'kwl7igml': {
      'en': 'Register Success',
      'es': 'Registro exitoso',
      'fr': 'Inscription réussie',
    },
    '1z4hfai6': {
      'en': 'About Template',
      'es': 'Acerca de la plantilla',
      'fr': 'À propos du modèle',
    },
    '86o94vt0': {
      'en': 'Builderking',
      'es': 'constructor',
      'fr': 'Construction',
    },
  },
  // Miscellaneous
  {
    'b3u7as3r': {
      'en': 'Create Account',
      'es': 'Cancelar',
      'fr': 'Annuler',
    },
    'ctqamqlc': {
      'en': 'Create your username',
      'es': 'Crea tu nombre de usuario',
      'fr': 'Créez votre nom d\'utilisateur',
    },
    'umpm3yh5': {
      'en': 'Sign Up with Google',
      'es': 'Verificar',
      'fr': 'Vérifier',
    },
    'u17s3o3i': {
      'en': 'Let\'s find the food you like',
      'es': 'Busquemos la comida que te gusta.',
      'fr': 'Trouvons la nourriture que vous aimez',
    },
    'm470nw6c': {
      'en': 'San Diego, CA',
      'es': 'San Diego, California, EE.UU.',
      'fr': 'San Diego, Californie',
    },
    'tkq1nhez': {
      'en': 'Recommended',
      'es': 'Recomendado',
      'fr': 'Recommandé',
    },
    'amak33fx': {
      'en': 'Cancel',
      'es': 'Cancelar',
      'fr': 'Annuler',
    },
    '5hctr45y': {
      'en': 'Add to Cart',
      'es': 'añadir a la cesta',
      'fr': 'Ajouter au panier',
    },
    'fazi37bo': {
      'en': 'Get Discount',
      'es': 'Reclame el descuento',
      'fr': 'Réclamez la réduction',
    },
    '6on3f8zv': {
      'en': 'Enter voucher code',
      'es': 'Ingrese código de descuento',
      'fr': 'Entrer le code du bon',
    },
    'vc3k7k6z': {
      'en': 'Hamburgers',
      'es': 'hamburguesas',
      'fr': 'Hamburgers',
    },
    'cvmlykt8': {
      'en': 'On Progress',
      'es': 'En progreso',
      'fr': 'En progrès',
    },
    'ogz0ss6o': {
      'en': 'Edit Profile',
      'es': 'Editar perfil',
      'fr': 'Editer le profil',
    },
    'cpbcsw9m': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'zi2yt9e7': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'vnau18bv': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'lktg3dy4': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'fjabeg9r': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '7yw004o2': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'xsjq375t': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'xiyzhulx': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'm3u1mw7e': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'dvzeat75': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '4bdekwbm': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'rvm9rdle': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '3uxb43tw': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'g8ay9flm': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '0raeaqd3': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'j3d762mc': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'jzepjy1z': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'dlctomaa': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'fdy7k4vs': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'o37sr5xj': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'v8s1znh7': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'jg3a7edz': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'pcwstkno': {
      'en': '',
      'es': '',
      'fr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
