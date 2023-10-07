// see: https://en.wikipedia.org/wiki/List_of_country_calling_codes
// for list of country/calling codes

const List<Country> countries = [
  Country(
        name: "Uganda",
        nameTranslations: {
          "sk": "Uganda",
          "se": "Uganda",
          "pl": "Uganda",
          "no": "Uganda",
          "ja": "ウガンダ",
          "it": "Uganda",
          "zh": "乌干达",
          "nl": "Oeganda",
          "de": "Uganda",
          "fr": "Ouganda",
          "es": "Uganda",
          "en": "Uganda",
          "pt_BR": "Uganda",
          "sr-Cyrl": "Уганда",
          "sr-Latn": "Uganda",
          "zh_TW": "烏干達",
          "tr": "Uganda",
          "ro": "Uganda",
          "ar": "أوغندا",
          "fa": "اوگاندا",
          "yue": "烏干達"
        },
        flag: "🇺🇬",
        code: "UG",
        dialCode: "256",
        minLength: 9,
        maxLength: 9,
      ),
      Country(
      name: "Kenya",
      nameTranslations: {
      "sk": "Keňa",
      "se": "Kenia",
      "pl": "Kenia",
      "no": "Kenya",
      "ja": "ケニア",
      "it": "Kenya",
      "zh": "肯尼亚",
      "nl": "Kenia",
      "de": "Kenia",
      "fr": "Kenya",
      "es": "Kenia",
      "en": "Kenya",
      "pt_BR": "Quênia",
      "sr-Cyrl": "Кенија",
      "sr-Latn": "Kenija",
      "zh_TW": "肯亞",
      "tr": "Kenya",
      "ro": "Kenya",
      "ar": "كينيا",
      "fa": "كنيا",
      "yue": "肯雅"
      },
      flag: "🇰🇪",
      code: "KE",
      dialCode: "254",
      minLength: 10,
      maxLength: 10,
  ),
  Country(
    name: "Tanzania, United Republic of Tanzania",
    nameTranslations: {
      "sk": "Tanzánia",
      "se": "Tanzánia",
      "pl": "Tanzania",
      "no": "Tanzania",
      "ja": "タンザニア",
      "it": "Tanzania",
      "zh": "坦桑尼亚",
      "nl": "Tanzania",
      "de": "Tansania",
      "fr": "Tanzanie",
      "es": "Tanzania",
      "en": "Tanzania",
      "pt_BR": "Tanzânia",
      "sr-Cyrl": "Танзанија",
      "sr-Latn": "Tanzanija",
      "zh_TW": "坦尚尼亞",
      "tr": "Tanzanya",
      "ro": "Tanzania",
      "ar": "تنزانيا",
      "fa": "تانزانیا",
      "yue": "坦桑尼亞，聯合共和國"
    },
    flag: "🇹🇿",
    code: "TZ",
    dialCode: "255",
    minLength: 9,
    maxLength: 9,
  ),
  Country(
    name: "Rwanda",
    nameTranslations: {
      "sk": "Rwanda",
      "se": "Rwanda",
      "pl": "Rwanda",
      "no": "Rwanda",
      "ja": "ルワンダ",
      "it": "Ruanda",
      "zh": "卢旺达",
      "nl": "Rwanda",
      "de": "Ruanda",
      "fr": "Rwanda",
      "es": "Ruanda",
      "en": "Rwanda",
      "pt_BR": "Ruanda",
      "sr-Cyrl": "Руанда",
      "sr-Latn": "Ruanda",
      "zh_TW": "盧安達",
      "tr": "Ruanda",
      "ro": "Rwanda",
      "ar": "رواندا",
      "fa": "رواندا",
      "yue": "盧旺達"
    },
    flag: "🇷🇼",
    code: "RW",
    dialCode: "250",
    minLength: 9,
    maxLength: 9,
  ),

];

class Country {
  final String name;
  final Map<String, String> nameTranslations;
  final String flag;
  final String code;
  final String dialCode;
  final String regionCode;
  final int minLength;
  final int maxLength;

  const Country({
    required this.name,
    required this.flag,
    required this.code,
    required this.dialCode,
    required this.nameTranslations,
    required this.minLength,
    required this.maxLength,
    this.regionCode = "",
  });

  String get fullCountryCode {
    return dialCode + regionCode;
  }

  String get displayCC {
    if (regionCode != "") {
      return "$dialCode $regionCode";
    }
    return dialCode;
  }

  String localizedName(String languageCode) {
    return nameTranslations[languageCode] ?? name;
  }
}
