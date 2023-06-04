import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'zh_Hans'];

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
    String? zh_HansText = '',
  }) =>
      [enText, zh_HansText][languageIndex] ?? '';

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
  // login_01
  {
    'osv419x8': {
      'en': 'Sign In',
      'zh_Hans': '登入',
    },
    'tyhxjv6r': {
      'en': 'Email Address',
      'zh_Hans': '电子邮件地址',
    },
    'u95nu7bl': {
      'en': 'Enter your email...',
      'zh_Hans': '输入你的电子邮箱...',
    },
    'e3dh0f93': {
      'en': 'Password',
      'zh_Hans': '密码',
    },
    'hkemvixt': {
      'en': 'Enter your password...',
      'zh_Hans': '输入您的密码...',
    },
    'w0tn6g57': {
      'en': 'Sign In',
      'zh_Hans': '登入',
    },
    'u8q1p3sa': {
      'en': 'Forgot Password?',
      'zh_Hans': '忘记密码？',
    },
    '367yny1n': {
      'en': 'Sign Up',
      'zh_Hans': '报名',
    },
    'zfa6uj2n': {
      'en':
          'By providing your Personal Data to us, you consent to us processing your Personal Data in accordance with this Privacy Policy, and you confirm that all Personal Data provided by you is accurate and complete, and that none of it is misleading or out of date. You will promptly update us in the event of any change to your Personal Data.\n\nWe may reject access request if any exception or prohibition under the PDPA apply.\n',
      'zh_Hans':
          '通过向我们提供您的个人数据，您同意我们根据本隐私政策处理您的个人数据，并且您确认您提供的所有个人数据都是准确和完整的，并且没有误导性或过时的。如果您的个人数据发生任何变化，您将及时通知我们。\n\n如果 PDPA 下的任何例外或禁令适用，我们可能会拒绝访问请求。',
    },
    'po8ef41r': {
      'en': 'Create Account',
      'zh_Hans': '创建账户',
    },
    '5zzm04df': {
      'en': 'Home',
      'zh_Hans': '家',
    },
  },
  // create_accCopy
  {
    '671ltu0u': {
      'en': 'Get Started',
      'zh_Hans': '开始',
    },
    'r4mduzhk': {
      'en': 'Use the form below to get started.',
      'zh_Hans': '使用下面的表格开始。',
    },
    'f38a59d9': {
      'en': 'Email Address',
      'zh_Hans': '电子邮件地址',
    },
    'pc2co8ki': {
      'en': 'Enter your email here...',
      'zh_Hans': '在此处输入您的电子邮件...',
    },
    'oack2410': {
      'en': 'Your Name',
      'zh_Hans': '你的名字',
    },
    'z3o8suta': {
      'en': 'Enter your name here...',
      'zh_Hans': '在这里输入你的名字...',
    },
    'txm9fhsc': {
      'en': 'Handphone No. ',
      'zh_Hans': '联系惠普',
    },
    'l658nwka': {
      'en': 'For Singapore  65 8888 111',
      'zh_Hans': '在此处输入您的 HP 编号...',
    },
    'ykph8vgr': {
      'en': 'Company',
      'zh_Hans': '公司',
    },
    '6ynfhkwc': {
      'en': 'Enter your Company here...',
      'zh_Hans': '在这里输入您的公司...',
    },
    'mctpntp3': {
      'en': 'Password',
      'zh_Hans': '密码',
    },
    'qnwtsdrw': {
      'en': 'Enter your password here...',
      'zh_Hans': '在这里输入您的密码...',
    },
    'id717ji2': {
      'en': 'Confirm Password',
      'zh_Hans': '确认密码',
    },
    'dra4ng77': {
      'en': 'Please Confirm your password here...',
      'zh_Hans': '请在这里确认您的密码...',
    },
    '7rlc08tm': {
      'en':
          'By providing your Personal Data to us, you consent to us processing your Personal Data in accordance with this Privacy Policy, and you confirm that all Personal Data provided by you is accurate and complete, and that none of it is misleading or out of date. You will promptly update us in the event of any change to your Personal Data.\n\nWe may reject access request if any exception or prohibition under the PDPA apply.',
      'zh_Hans':
          '通过向我们提供您的个人数据，您同意我们根据本隐私政策处理您的个人数据，并且您确认您提供的所有个人数据都是准确和完整的，并且没有误导性或过时的。如果您的个人数据发生任何变化，您将及时通知我们。\n\n如果 PDPA 下的任何例外或禁令适用，我们可能会拒绝访问请求。',
    },
    'f72k24hv': {
      'en': 'Create Account',
      'zh_Hans': '创建账户',
    },
    'rdt4lhxq': {
      'en': 'Already have an account?',
      'zh_Hans': '已有帐户？',
    },
    '2aqd2zjs': {
      'en': 'Log In',
      'zh_Hans': '登录',
    },
    'ylgu2hx6': {
      'en': 'Home',
      'zh_Hans': '家',
    },
  },
  // splash
  {
    '68oxswp4': {
      'en': 'Welcome to WeDeck',
      'zh_Hans': '欢迎来到WeDeck',
    },
    'dy4bjjq8': {
      'en': 'You\'re  in Good Hands',
      'zh_Hans': '轻松购买',
    },
  },
  // forgot
  {
    'l8kooabq': {
      'en': 'Back',
      'zh_Hans': '后退',
    },
    'zx4m5551': {
      'en': 'Forgot Password',
      'zh_Hans': '忘记密码',
    },
    'boyzoxg9': {
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
      'zh_Hans': '我们将向您发送一封电子邮件，其中包含重置密码的链接，请在下方输入与您的帐户关联的电子邮件。',
    },
    't3rps6xq': {
      'en': 'Your email address...',
      'zh_Hans': '您的电子邮件地址...',
    },
    '89zq42w9': {
      'en': 'Enter your email...',
      'zh_Hans': '输入你的电子邮箱...',
    },
    'p0wrja5d': {
      'en': 'Send Link',
      'zh_Hans': '发送链接',
    },
    '1d8q8ket': {
      'en': 'Home',
      'zh_Hans': '家',
    },
  },
  // personal_details
  {
    'a5y9n07m': {
      'en': 'Account',
      'zh_Hans': '帐户',
    },
    '2dbtooiw': {
      'en': 'Payment Options',
      'zh_Hans': '付款方式',
    },
    'klo9z3yr': {
      'en': 'Coming Soon !!!',
      'zh_Hans': '即将推出 ！！！',
    },
    'i3un1w9u': {
      'en': 'Country',
      'zh_Hans': '国家',
    },
    'n5wogxiw': {
      'en': 'Coming Soon !!!',
      'zh_Hans': '即将推出 ！！！',
    },
    '0dp7ljiq': {
      'en': 'Notification Settings',
      'zh_Hans': '通知设置',
    },
    '560hfv6i': {
      'en': 'Coming Soon !!!',
      'zh_Hans': '即将推出 ！！！',
    },
    'b6m3aig0': {
      'en': 'Edit Profile',
      'zh_Hans': '编辑个人资料',
    },
    '3arzcm5l': {
      'en': 'General',
      'zh_Hans': '一般的',
    },
    'x5st7n4x': {
      'en': 'Support',
      'zh_Hans': '支持',
    },
    'j116grrw': {
      'en': 'Terms of Service & Privacy Policy',
      'zh_Hans': '服务条款和隐私政策',
    },
    '1uourabj': {
      'en': 'Invite Friends',
      'zh_Hans': '邀请朋友',
    },
    'z8whvepa': {
      'en': 'Coming Soon !!!',
      'zh_Hans': '即将推出 ！！！',
    },
    'woqsmv7i': {
      'en': 'Close Account',
      'zh_Hans': '关闭账户',
    },
    '03yi335z': {
      'en': 'Logout',
      'zh_Hans': '登出',
    },
    'q8n4isw3': {
      'en': 'Profile',
      'zh_Hans': '轮廓',
    },
    '99byw1m1': {
      'en': 'Profile',
      'zh_Hans': '轮廓',
    },
  },
  // product_list
  {
    'ws00od4i': {
      'en': 'Products Listing',
      'zh_Hans': '产品上市',
    },
    'w9z4jgpp': {
      'en': 'Products',
      'zh_Hans': '产品',
    },
  },
  // product_listing2
  {
    'cui496g1': {
      'en': 'Product List',
      'zh_Hans': '产品列表',
    },
    'gg9pgou7': {
      'en': 'Type to search here...',
      'zh_Hans': '在这里输入搜索...',
    },
    '6fmgkbe2': {
      'en': 'Add to Cart',
      'zh_Hans': '添加数量',
    },
    'f6osm867': {
      'en': 'New',
      'zh_Hans': '新的',
    },
  },
  // profile_edit
  {
    'jinfdqs8': {
      'en': 'Your Name',
      'zh_Hans': '你的名字',
    },
    'qgm2t6jj': {
      'en': 'Your Name',
      'zh_Hans': '你的名字',
    },
    'ebl865r9': {
      'en': 'Email Address',
      'zh_Hans': '电子邮件地址',
    },
    'elg9ivdp': {
      'en': 'Your Name',
      'zh_Hans': '你的名字',
    },
    'gal5n3qn': {
      'en': 'Handphone Number',
      'zh_Hans': '手机号码',
    },
    'o4h3f9vh': {
      'en': 'Enter your handphone with country code (Ex for SG 65 8888 1111)',
      'zh_Hans': '',
    },
    'n3s3z55l': {
      'en': 'Company',
      'zh_Hans': '公司',
    },
    'ao0q1j0h': {
      'en': 'Enter your Company name here',
      'zh_Hans': '',
    },
    'd47e4yca': {
      'en': 'Member ID',
      'zh_Hans': '会员ID',
    },
    'ult5p3hp': {
      'en': 'Save Changes',
      'zh_Hans': '保存更改',
    },
    'udli7ir7': {
      'en': 'Edit your Profile',
      'zh_Hans': '编辑您的个人资料',
    },
    'ml92p6uc': {
      'en': 'My ID',
      'zh_Hans': '我的身份',
    },
  },
  // my_qr
  {
    'swb6fixs': {
      'en': 'WeDeck ID : ',
      'zh_Hans': 'WeDeck ID :',
    },
    '1cytn1xq': {
      'en':
          'Please scan your WeDeck ID at our participating outlet to earn you loyalty reward point and enjoy exclusive disount',
      'zh_Hans': '请在我们的参与商店扫描您的 WeDeck ID 以获得忠诚奖励积分并享受独家折扣',
    },
    'hnves4zn': {
      'en': 'my QR',
      'zh_Hans': '我的二维码',
    },
  },
  // login
  {
    'gni5qokz': {
      'en': 'Back',
      'zh_Hans': '后退',
    },
    'mmbaa7fq': {
      'en': 'Login',
      'zh_Hans': '登录',
    },
    '9fe0nwxl': {
      'en': 'Access your account by logging in below.',
      'zh_Hans': '通过在下方登录访问您的帐户。',
    },
    'u7fz7arl': {
      'en': 'Your email address...',
      'zh_Hans': '您的电子邮件地址...',
    },
    'hndyh7mr': {
      'en': 'Enter your email...',
      'zh_Hans': '输入你的电子邮箱...',
    },
    'yx52rkyk': {
      'en': 'Password',
      'zh_Hans': '密码',
    },
    'ku78n5gi': {
      'en': 'Please enter your password...',
      'zh_Hans': '请输入您的密码...',
    },
    'halyxed0': {
      'en': 'Login',
      'zh_Hans': '登录',
    },
    'qf97bi0k': {
      'en': 'Forgot Password?',
      'zh_Hans': '忘记密码？',
    },
    'jc9nut60': {
      'en': 'Home',
      'zh_Hans': '家',
    },
  },
  // privacy
  {
    'gpqlm0jo': {
      'en': 'Privacy Policy',
      'zh_Hans': '隐私政策',
    },
    '7hznwo00': {
      'en':
          'Date of issuance of this Privacy Policy: \t​\t​\t​\t​28 February 2023\n\nWe,  Yiwei Supplies Pte. Ltd. (“Company”, “us”, “we”, “our” or “ours”), understand the importance of personal data (“Personal Data” refers to any information whether recorded in a material form or not, from which the identity of an individual is apparent or can be reasonably and directly ascertained by the entity holding the information, or when put together with other information would directly and certainly identify an individual) and sensitive personal data which includes but is not limited to, information pertaining to the physical or mental health or condition of an individual and religious beliefs, or any other sensitive personal data (“Sensitive Personal Data”) as defined under the applicable regulations, guidelines, orders made under the Personal Data Protection Act 2012 and any statutory amendments or re-enactments made of the Personal Data Protection Act 2012 from time to time (collectively referred to as the “PDPA”). We endeavor to protect Personal Data through our compliance with the PDPA, and this privacy policy for processing of personal data (“Privacy Policy”), and by appropriately processing the Personal Data of our customers, applicants for potential employment or recruitment activities by the Company, vendors and suppliers, and users of our website or application software.\n\nWe will collect Personal Data and Sensitive Personal Data during your course of dealings with us in any way or manner including pursuant to any transactions, any event and/or communications made from/with us in an appropriate manner not limiting to using for performance of contract, entering into contract, legal obligation, vital interests, and administration of justice;\nWe will inform you regarding the purpose of use for your Personal Data and Sensitive Personal Data, and use such information within the scope of such lawful, direct purpose and/or for secondary purposes;\nWe will take necessary and appropriate measures to safely manage Personal Data and Sensitive Personal Data;\nWe will collect/use/disclose personal data without the consent of individual in case of: necessary for purpose, life threatening situation, publicly available data, national interest, investigations, evaluation purpose, artistic purpose, news activity, provision of legal services, collected by credit bureau, employment purpose, disclosed by public agency, etc;\nExcept where otherwise specified, we will not share, disclose or sell Personal Data or Sensitive Personal Data to any third parties without the consent of the individual;\nWe will respond appropriately in the event that an individual contact the appropriate point of contact regarding display, correction, deletion, withdrawal (in full or in part) and/or termination of use of their respective Personal Data or Sensitive Personal Data;\nWe will maintain records of application, notice, requests, etc. related to Personal Data being processed by the Company;\nThe collection of your Personal Data by us may be mandatory or voluntary in nature depending on the Purposes for which your Personal Data is collected. Where it is obligatory for you to provide us with your Personal Data and you fail or choose not to provide us with such data, or do not consent to the purposes of collection or this Privacy Policy, we will not be able to provide products and/or services or otherwise deal with you.\nPurpose of use for Personal Data and Sensitive Personal Data\nWe use Personal Data provided to us by individuals for only the following purposes (“Purposes”):\n\n(1)Personal Data and Sensitive Personal Data of our customers (including users of our application software)\n\nto communicate with you;\nto maintain and improve customer relationship;\nto assess, process and provide products, services and/or facilities to you;\nto administer and process any payments related to products, services and/or facilities requested by you;\nto provide you with information and/or updates on our products, services, upcoming promotions offered by us and/or events organized by us and selected third parties which may be of interest to you from time to time;\nfor direct marketing purposes via SMS, phone call, email, mail, social media and/or any other appropriate communication channels to members of our loyalty program in accordance with their consent;\nto facilitate your participation in, and our administration of, any events including contests, promotions or campaigns;\nto award points in a loyalty or rewards program;\nto maintain and update internal record keeping;\nfor internal administrative purposes;\nto send you seasonal greetings messages from time to time;\nto send you invitation to join our events and promotions and product launch events;\nto monitor, review and improve our events and promotions, products and/or services;\nto process and analyse your Personal Data either individually or collectively with other individuals;\nto conduct market research or surveys, internal marketing analysis, customer profiling activities, analysis of customer patterns and choices, planning and statistical and trend analysis in relation to our products and/or services;\nto share any of your Personal Data with our business partners to jointly develop products and/or services or launch marketing campaigns;\nto share any of your Personal Data with insurance companies necessary for the purposes of insurance claims;\nfor audit, risk management and security purposes;\nfor detecting, investigating and preventing fraudulent, prohibited or illegal activities;\nfor enabling us to perform our obligations and enforce our rights under any agreements or documents that we are a party to;\nto transfer or assign our rights, interests and obligations under any agreements entered with us;\nto respond to your enquiries or complaints and resolve any issues and disputes which may arise in connection with any dealings with us;\nfor meeting any applicable legal or regulatory requirements and making disclosure under the requirements of any applicable law, regulation, direction, court order, by-law, guideline, circular or code applicable to us;\nto enforce or defend our rights and your rights under, and comply with, our obligations under the applicable laws, legislation and regulations; other purposes required to operate, maintain and better manage our business and your relationship with us, which we notify you of at the time of obtaining your consent.\n\n(2) Personal Data and Sensitive Personal Data of Employment Applicants\n\nContacting and/or providing information to employment applicants, and other uses necessary for employment and recruiting activities.\nIf your application is unsuccessful, we will keep your Personal Data for a reasonable period in accordance with our internal policies and procedures and for administration and statistical analysis purposes or for other job opportunities.\nIf your application is successful, we will process your Personal Data for purposes regarding employment with us in accordance with the applicable law and/or PDPA.\n(3) Personal Data and Sensitive Data of our Vendors and Suppliers\n\nto communicate with you;\nto maintain and improve business relationship;\nto establish your identity and background;\nto maintain and update internal record keeping;\nfor internal administrative purposes;\nto conduct credit reference checks and establish your creditworthiness, where necessary;\nto administer and give effect to your commercial transactions with us (such as a tender award, contract for service, tenancy agreement);\nto process any payments related to your commercial transactions with us;\nto process and analyse your Personal Data either individually or collectively with other individuals;\nto share any of your Personal Data with the auditor for our internal audit and reporting purposes;\nto share any of your Personal Data pursuant to any agreement or document which you have duly entered with us for purposes of seeking legal and/or financial advice and/or for purposes of commencing legal action;\nto share any of your Personal Data with our business partners to jointly develop products and/or services or launch marketing campaigns;\nto share any of your Personal Data with insurance companies necessary for the purpose of applying and obtaining insurance policy (ies), if necessary;\nto share any of your Personal Data with financial institutions necessary for the purpose of applying and obtaining credit facility (ies), if necessary;\nfor audit, risk management and security purposes;\nfor detecting, investigating and preventing fraudulent, prohibited or illegal activities;\nfor enabling us to perform our obligations and enforce our rights under any agreements or documents that we are a party to;\nto transfer or assign our rights, interests and obligations under any agreements entered with us;\nto respond to your enquiries or complaints and resolve any issues and disputes which may arise in connection with any dealings with us;\nfor meeting any applicable legal or regulatory requirements and making disclosure under the requirements of any applicable law, regulation, direction, court order, by-law, guidance, circular or code applicable to us;\nto enforce or defend our rights and your rights under and to comply with, our obligations under the applicable laws, legislation and regulations; or\nother purposes required to operate, maintain and better manage our business and your relationship with us, which we notify you of at the time of obtaining your consent;\n(4) Personal Data and Sensitive Personal Data of those persons who post/submit Personal Data and Sensitive Personal Data on our website or application software\n\nUse of works posted/submitted on our website or application software in advertisements for the Company or its affiliates.\n*All rights of publicity, copyrights and other industrial property rights in such posted/submitted works shall be attributed to the user who posted/submitted such works; provided, however, that upon posting/submitting such works, the user shall be deemed to have granted the Company a global, royalty-free and non-exclusive license (with right of sublicense to third parties) to use (including, without limitation, reproduce, publicize, send, distribute, assign, loan, translate and adapt) such works, and such user agrees that he or she shall not assert any moral rights in such works.\n\n\nYou agree and consent to us using and processing your Personal Data for the Purposes in the manner as identified in this Privacy Policy. If you do not consent to us processing your Personal Data for one or more of the Purposes, please notify us at the contact details below.\n\nInquiries regarding display, correction, deletion and/or termination of use of Personal Data\n\nUpon receipt of a request for display, correction, deletion, withdrawal (in full or in part) and/or termination of use of Personal Data, we will promptly respond to such requests upon confirming the identity of the person through prescribed procedures. For any inquiries regarding Personal Data, please contact our Data Protection Officer at the following contact details:\n\nData Protection Officer : Clarence Chua\nPostal Address: 23 Depot Lane Singapore\nEmail Address: dpo_sg@yws.com.sg\n\nBy providing your Personal Data to us, you consent to us processing your Personal Data in accordance with this Privacy Policy, and you confirm that all Personal Data provided by you is accurate and complete, and that none of it is misleading or out of date. You will promptly update us in the event of any change to your Personal Data.\nWe may reject access request if any exception or prohibition under the PDPA apply.\n\nTurnaround time\n\nWe will respond as soon as possible but in all cases within thirty calendar days from the date of your request on the Personal Data relating to you.\n\nWhere we store your personal data?\n\nInternet is used in a global environment, using it to collect and process personal data may involve the transmission of data on an international basis. The Personal Data that we collect from you may be transferred to, accessed in and stored at, a destination outside Singapore, these data will always be held securely and in line with the requirements of any applicable laws and regulations regarding data protection. Please be aware that communications over the Internet, such as emails/webmails are not secure unless they have been encrypted.\n\nWe may need to transfer your Personal Data outside of Singapore. You hereby expressly consent to us transferring your Personal Data outside of Singapore for such Purposes. Your Personal Data may be processed by third-parties operating within or outside Singapore, working for us or for one of our suppliers, where necessary, for the Purposes mentioned above, to any party who undertakes to keep your Personal Data confidential or to whom we are compelled or required under the data protection laws to disclose to. Such third parties may be engaged in, among other things, the fulfillment of your order, the processing of your payment details and the provision of support services. When we transfer Personal Data to third parties outside Singapore, we ask them to provide adequate guarantees to implement appropriate technical and organizational security measures in such a manner that processing will meet the requirements of Singapore data protection laws and regulations to ensure the protection of your rights as an individual.\n\nProtection of your Personal Data\n\n\nWe will take reasonable steps to protect Personal Data from loss, misuse, modification, Personal Data in our possession or under our control in order to prevent unauthorized or accidental access or disclosure, alteration or destruction.\nWe will ensure technical and organizational security measures governing the processing of Personal Data to be carried out and ensure compliance with the measures. \n\nRetention Period of your Personal Data\nWe will cease to retain the documents containing Personal Data or remove the means by which the Personal Data can be associated with the individuals when it can be assumed that: the Purpose for which the personal data was collected is no longer being served by retention of personal data, and the retention is not necessary for legal or business purposes. We reserve the right to retain and keep your Personal Data for a period necessary for business, tax, or legal purposes.\n\nPersonal Data from other Individuals and Minors\n\nTo the extent that you have provided (or will provide) Personal Data about your family members, spouse and/or other dependents, you confirm that you have explained to them that their Personal Data will be provided to, and processed by us, and you represent and warrant that you have obtained their consent to the processing (including disclosure and transfer) of their Personal Data in accordance with this Privacy Policy.\n\nOur website is intended only for persons who are at least eighteen (18) years old. If you are an individual under 18 years of age (“Minors”) or individuals not legally competent to give consent, you will require a parent or legal guardian to consent to the processing (including disclosure and transfer) of your Personal Data in accordance with this Privacy Policy. We neither offer products or services to, nor knowingly collect Personal Data of Minors without any legal basis. Should we learn that we were provided with Personal Data of Minors without any legal basis, we will delete the same from our database. If you are a Minor, please do not provide any Personal Data to us, such as your name, age, gender, email address, contact information and the like, and kindly consult your parent(s) or legal guardian(s) first before visiting any website.\n\n\nOthers\n\nThe Company reserves the right to change or revise this Privacy Policy from time to time without prior notice to incorporate any changes in its procedures for protecting Personal Data or any regulatory changes. The latest version of the Privacy Policy is always available on our websites. We will communicate any material changes to this Privacy Policy via announcements on our Company website or any other appropriate mean. Please review this Privacy Policy every time before you deal with us to be sure you agree with it.\n\nFurther, by continuing to use the services, purchasing products from the Company or by your continued engagement with the Company following the change or revision to this Privacy Policy, you will be treated as having agreed to and accept those amendments.\n\nIf you do not agree to this Privacy Policy or any amendments to this Privacy Policy, we may not be able to render all services to you or dealing with you, and you may be required to terminate your relevant agreement with us, stop accessing or using our website and/or dealing with us.',
      'zh_Hans':
          '本隐私政策发布日期：2023 年 2 月 28 日\n\n我们，Yiwei Supplies Pte. Ltd.（“公司”、“我们”、“我们”、“我们的”或“我们的”）理解个人数据的重要性（“个人数据”是指无论是否以物质形式记录的任何信息，从中个人的身份是显而易见的，或者可以由持有该信息的实体合理和直接地确定，或者当与其他信息放在一起时将直接和肯定地识别个人）和敏感的个人数据，包括但不限于有关的信息个人和宗教信仰的身体或精神健康或状况，或任何其他敏感个人数据（“敏感个人数据”），如适用法规、指南、根据 2012 年《个人数据保护法》和任何法定修正案作出的命令所定义或不时根据《2012 年个人数据保护法》重新制定（统称为“PDPA”）。我们努力通过遵守 PDPA 和本个人数据处理隐私政策（“隐私政策”）以及通过适当处理我们客户、公司潜在就业或招聘活动申请人的个人数据来保护个人数据、供应商和供应商，以及我们网站或应用软件的用户。\n\n我们将在您以任何方式或方式与我们打交道期间收集个人数据和敏感个人数据，包括根据任何交易、任何事件和/或以适当方式与我们进行的/与我们进行的通信，不限于用于履行合同, 订立合同、法律义务、切身利益和司法；\n我们将告知您您的个人数据和敏感个人数据的使用目的，并在此类合法、直接目的和/或次要目的范围内使用此类信息；\n我们将采取必要和适当的措施来安全地管理个人数据和敏感的个人数据；\n我们将在以下情况下未经个人同意收集/使用/披露个人数据：必要的目的、危及生命的情况、公开数据、国家利益、调查、评估目的、艺术目的、新闻活动、提供法律服务、收集按信用局、就业目的、由公共机构等披露；\n除另有规定外，未经个人同意，我们不会向任何第三方共享、披露或出售个人数据或敏感个人数据；\n如果个人就显示、更正、删除、撤回（全部或部分）和/或终止使用其各自的个人数据或敏感个人数据联系适当的联系点，我们将做出适当回应；\n我们将保存与公司正在处理的个人数据相关的申请、通知、请求等记录；\n我们收集您的个人数据可能是强制性的或自愿的，具体取决于收集您的个人数据的目的。如果您有义务向我们提供您的个人数据，而您未能或选择不向我们提供此类数据，或者不同意收集目的或本隐私政策，我们将无法提供产品和/或服务或以其他方式与您打交道。\n个人数据和敏感个人数据的使用目的\n我们仅将个人提供给我们的个人数据用于以下目的（“目的”）：\n\n(1)我们客户（包括我们应用软件的用户）的个人资料和敏感个人资料\n\n与您沟通；\n维护和改善客户关系；\n为您评估、处理和提供产品、服务和/或设施；\n管理和处理与您要求的产品、服务和/或设施相关的任何付款；\n向您提供您可能不时感兴趣的有关我们的产品、服务、我们提供的即将推出的促销活动和/或我们和选定的第三方组织的活动的信息和/或更新；\n出于直接营销目的，在我们的忠诚度计划会员同意的情况下，通过短信、电话、电子邮件、邮件、社交媒体和/或任何其他适当的沟通渠道；\n促进您参与和我们管理任何活动，包括竞赛、促销或活动；\n在忠诚度或奖励计划中奖励积分；\n维护和更新内部记录；\n用于内部管理目的；\n不时向您发送季节性问候信息；\n向您发送参加我们的活动和促销活动以及产品发布活动的邀请；\n监控、审查和改进我们的活动和促销、产品和/或服务；\n单独或与其他人一起处理和分析您的个人数据；\n进行与我们的产品和/或服务相关的市场研究或调查、内部营销分析、客户分析活动、客户模式和选择分析、规划和统计以及趋势分析；\n与我们的业务合作伙伴共享您的任何个人数据，以共同开发产品和/或服务或开展营销活动；\n出于保险索赔的目的与保险公司共享您的任何个人数据；\n用于审计、风险管理和安全目的；\n用于检测、调查和防止欺诈、禁止或非法活动；\n使我们能够根据我们作为一方的任何协议或文件履行我们的义务并行使我们的权利；\n根据与我们签订的任何协议转让或分配我们的权利、利益和义务；\n回应您的查询或投诉，并解决与我们进行任何交易时可能出现的任何问题和争议；\n满足任何适用的法律或监管要求，并根据适用于我们的任何适用法律、法规、指示、法院命令、章程、指南、通告或守则的要求进行披露；\n执行或捍卫我们的权利和您的权利，并遵守我们在适用法律、法规和法规下的义务；运营、维护和更好地管理我们的业务以及您与我们的关系所需的其他目的，我们会在获得您的同意时通知您。\n\n(2) 求职者的个人资料和敏感个人资料\n\n联系和/或向求职者提供信息，以及就业和招聘活动所需的其他用途。\n如果您的申请不成功，我们将根据我们的内部政策和程序将您的个人数据保留一段合理的时间，并用于管理和统计分析目的或用于其他工作机会。\n如果您的申请成功，我们将根据适用法律和/或 PDPA 处理您的个人数据，以用于与我们的雇佣相关的目的。\n(3) 我们的供应商和供应商的个人数据和敏感数据\n\n与您沟通；\n维护和改善业务关系；\n确定您的身份和背景；\n维护和更新内部记录；\n用于内部管理目的；\n在必要时进行信用参考检查并确定您的信用度；\n管理和实施您与我们的商业交易（例如中标、服务合同、租赁协议）；\n处理与您与我们的商业交易相关的任何付款；\n单独或与其他人一起处理和分析您的个人数据；\n出于我们的内部审计和报告目的与审计员共享您的任何个人数据；\n根据您与我们正式签订的任何协议或文件共享您的任何个人数据，以寻求法律和/或财务建议和/或开始法律行动；\n与我们的业务合作伙伴共享您的任何个人数据，以共同开发产品和/或服务或开展营销活动；\n如有必要，与保险公司共享您的任何个人数据，以申请和获得保险单；\n如有必要，与金融机构共享您的任何个人数据，以申请和获得信贷便利；\n用于审计、风险管理和安全目的；\n用于检测、调查和防止欺诈、禁止或非法活动；\n使我们能够根据我们作为一方的任何协议或文件履行我们的义务并行使我们的权利；\n根据与我们签订的任何协议转让或分配我们的权利、利益和义务；\n回应您的查询或投诉，并解决与我们进行任何交易时可能出现的任何问题和争议；\n满足任何适用的法律或监管要求，并根据适用于我们的任何适用法律、法规、指示、法院命令、章程、指南、通告或守则的要求进行披露；\n执行或捍卫我们的权利和您的权利，并遵守我们在适用法律、法规和法规下的义务；或者\n运营、维护和更好地管理我们的业务以及您与我们的关系所需的其他目的，我们会在获得您的同意时通知您；\n(4) 在我们的网站或应用软件上发布/提交个人数据和敏感个人数据的人员的个人数据和敏感个人数据\n\n在本公司或其关联公司的广告中使用在我们的网站或应用软件上发布/提交的作品。\n*此类发布/提交作品的所有公开权、版权和其他工业产权均归发布/提交此类作品的用户所有；但前提是，在发布/提交此类作品时，用户应被视为已授予公司全球、免版税和非排他性许可（有权向第三方再许可）使用（包括但不限于，复制、宣传、发送、分发、转让、出借、翻译和改编）此类作品，并且该用户同意他或她不得对此类作品主张任何精神权利。\n\n\n您同意并同意我们以本隐私政策中确定的方式为目的使用和处理您的个人数据。如果您不同意我们出于一项或多项目的处理您的个人数据，请通过以下联系方式通知我们。\n\n有关显示、更正、删除和/或终止使用个人数据的查询\n\n在收到显示、更正、删除、撤回（全部或部分）和/或终止使用个人数据的请求后，我们将在通过规定程序确认该人的身份后迅速响应此类请求。有关个人数据的任何查询，请通过以下联系方式联系我们的数据保护官：\n\n数据保护官：Clarence Chua\n邮寄地址：23 Depot Lane Singapore\n电邮地址：dpo_sg@yws.com.sg\n\n通过向我们提供您的个人数据，您同意我们根据本隐私政策处理您的个人数据，并且您确认您提供的所有个人数据都是准确和完整的，并且没有误导性或过时的。如果您的个人数据发生任何变化，您将及时通知我们。\n如果 PDPA 下的任何例外或禁令适用，我们可能会拒绝访问请求。\n\n周转时间\n\n我们将尽快做出回应，但在所有情况下，我们都会在您请求与您有关的个人数据之日起三十个日历日内做出回应。\n\n我们在哪里存储您的个人数据？\n\n互联网在全球环境中使用，使用它收集和处理个人数据可能涉及在国际范围内传输数据。我们从您那里收集的个人数据可能会被传输到新加坡境外的目的地、在其中访问和存储，这些数据将始终安全地保存，并符合任何适用的数据保护法律法规的要求。请注意，除非经过加密，否则通过 Internet 进行的通信（例如电子邮件/网络邮件）是不安全的。\n\n我们可能需要将您的个人数据转移到新加坡境外。您特此明确同意我们出于此类目的将您的个人数据传输到新加坡境外。您的个人数据可能会由在新加坡境内或境外运营、为我们或我们的供应商之一工作的第三方处理，必要时，出于上述目的，向承诺对您的个人数据保密或我们向其保密的任何一方处理您的个人数据根据数据保护法被强制或要求披露给。此类第三方可能参与履行您的订单、处理您的付款详情和提供支持服务等。当我们将个人数据传输给新加坡境外的第三方时，我们要求他们提供充分的保证，以实施适当的技术和组织安全措施，使处理符合新加坡数据保护法律法规的要求，以确保您的权利受到保护作为个人。\n\n保护您的个人资料\n\n\n我们将采取合理措施保护个人数据免遭丢失、滥用、修改、我们拥有或控制的个人数据，以防止未经授权或意外访问或披露、更改或破坏。\n我们将确保执行管理个人数据处理的技术和组织安全措施，并确保遵守这些措施。\n\n您的个人数据的保留期限\n我们将停止保留包含个人数据的文件或删除个人数据可以与个人相关联的方式，如果可以假设：收集个人数据的目的不再通过保留个人数据来实现数据，并且出于法律或商业目的不需要保留。我们保留在商业、税务或法律目的所需的期限内保留和保留您的个人数据的权利。\n\n来自其他个人和未成年人的个人数据\n\n如果您已经提供（或将提供）有关您的家庭成员、配偶和/或其他受抚养人的个人数据，您确认您已向他们解释他们的个人数据将提供给我们并由我们处理，并且您声明并保证您已获得他们的同意，可以根据本隐私政策处理（包括披露和传输）他们的个人数据。\n\n我们的网站仅供年满十八 (18) 岁的人士使用。如果您是未满 18 岁的个人（“未成年人”）或在法律上没有能力给予同意的个人，您将需要父母或法定监护人同意根据以下规定处理（包括披露和传输）您的个人数据本隐私政策。我们不会在没有任何法律依据的情况下向未成年人提供产品或服务，也不会在知情的情况下收集未成年人的个人数据。如果我们得知我们在没有任何法律依据的情况下获得了未成年人的个人数据，我们将从我们的数据库中删除这些数据。如果您是未成年人，请不要向我们提供任何个人数据，例如您的姓名、年龄、性别、电子邮件地址、联系方式等，并请先咨询您的父母或法定监护人访问任何网站。\n\n\n其他的\n\n公司保留不时更改或修订本隐私政策的权利，恕不另行通知，以纳入其保护个人数据的程序或任何监管变更的任何变更。最新版本的隐私政策始终在我们的网站上可用。我们将通过公司网站上的公告或任何其他适当的方式传达对本隐私政策的任何重大变更。每次与我们打交道之前，请仔细阅读本隐私政策，以确保您同意它。\n\n此外，通过继续使用服务、从公司购买产品或您在本隐私政策的变更或修订后继续与公司合作，您将被视为已同意并接受这些修订。\n\n如果您不同意本隐私政策或本隐私政策的任何修改，我们可能无法向您提供所有服务或无法与您交易，您可能需要终止与我们的相关协议，停止访问或使用我们的网站和/或与我们打交道。',
    },
  },
  // sms_code
  {
    'n47qbaq3': {
      'en': 'Confirm your Code',
      'zh_Hans': '确认您的代码',
    },
    'emq6wlod': {
      'en': 'This code helps keep your account safe and secure.',
      'zh_Hans': '此代码有助于确保您的帐户安全无虞。',
    },
    'x1sub25c': {
      'en': 'Confirm & Continue',
      'zh_Hans': '确认并继续',
    },
    '99ec4l58': {
      'en': 'Enter Pin Code Below',
      'zh_Hans': '在下方输入 PIN 码',
    },
    'tvxtwpjj': {
      'en': 'Home',
      'zh_Hans': '家',
    },
  },
  // phone_signin
  {
    'iho44u2t': {
      'en': 'Phone Sign In',
      'zh_Hans': '电话登录',
    },
    'y1wke4m6': {
      'en':
          'Enter your phone number registered with us, we will send a SMS OTP verfication code to this number',
      'zh_Hans': '在下方输入您的电话号码进行注册。',
    },
    '44vdjdd5': {
      'en': 'Your Phone Number',
      'zh_Hans': '你的电话号码',
    },
    'ryvktull': {
      'en': 'Please enter a valid phone number',
      'zh_Hans': '请输入有效号码...',
    },
    'kseppxum': {
      'en': 'Sign In with Phone',
      'zh_Hans': '使用电话登录',
    },
    '3uo6a2sx': {
      'en': 'Home',
      'zh_Hans': '家',
    },
  },
  // close_account
  {
    '5nbjgfy5': {
      'en': 'Are you sure you want to close your Account ?',
      'zh_Hans': '您确定要关闭您的帐户吗？',
    },
    'c2tcgygm': {
      'en':
          'By closing your Account, you will no longer have acess to your Reward Points and redeemed rewards. You will also not be able to earn any further points and ennjoy exclusive deals at our preferred Partners Brands. \n\nIf you wish to premanently delete your Account and remove all your presonal information, please contact our Customer Service at support@yws.com.sg',
      'zh_Hans':
          '关闭您的帐户后，您将无法再使用您的奖励积分和任何兑换的奖励。您也将无法赚取更多积分，也无法在我们的首选合作伙伴品牌享受独家优惠。\n\n如果您想永久删除您的帐户并删除所有个人信息，请通过 support@yws.com.sg 联系我们的客户服务',
    },
    '0yblpecn': {
      'en': 'Close Account',
      'zh_Hans': '关闭账户',
    },
    'ja1ww1k0': {
      'en': 'Close Account',
      'zh_Hans': '关闭账户',
    },
    'ekt8ezlb': {
      'en': 'Home',
      'zh_Hans': '家',
    },
  },
  // product_details
  {
    '073nuxai': {
      'en': 'Quantity Available : ',
      'zh_Hans': '',
    },
    'ns8etjzs': {
      'en': 'Add to Cart',
      'zh_Hans': '家',
    },
    'ggospqh3': {
      'en': 'Home',
      'zh_Hans': '家',
    },
  },
  // homeFinal
  {
    'yehgs8vr': {
      'en': 'Today\'s Deals',
      'zh_Hans': '今日特卖',
    },
    'hwuzxphq': {
      'en': 'Recommended for you',
      'zh_Hans': '为你推荐',
    },
    '1lmphxy4': {
      'en': 'View All',
      'zh_Hans': '查看全部',
    },
    'azhuqf5s': {
      'en': 'Home',
      'zh_Hans': '家',
    },
  },
  // cart01
  {
    '1yl5vfao': {
      'en': 'Your Cart',
      'zh_Hans': '',
    },
    'pdxqqwwa': {
      'en': 'Below is the list of items in your cart.',
      'zh_Hans': '',
    },
    'bmxx0fql': {
      'en': 'Air Max',
      'zh_Hans': '',
    },
    '0ff51noo': {
      'en': 'Size: ',
      'zh_Hans': '',
    },
    'ac5au4bc': {
      'en': '12',
      'zh_Hans': '',
    },
    '2txjck80': {
      'en': '\$124.00',
      'zh_Hans': '',
    },
    'z533omw6': {
      'en':
          'Men\'s Sleeveless Fitness T-Shirt\nTumbled Grey/Flat Silver/Heather/Black',
      'zh_Hans': '',
    },
    'nq3agwg6': {
      'en': 'Air Max',
      'zh_Hans': '',
    },
    'brpqhops': {
      'en': 'Size: ',
      'zh_Hans': '',
    },
    'b34hyqme': {
      'en': '12',
      'zh_Hans': '',
    },
    'ccwbnncl': {
      'en': '\$117.00',
      'zh_Hans': '',
    },
    'knj88ywg': {
      'en':
          'Men\'s Sleeveless Fitness T-Shirt\nTumbled Grey/Flat Silver/Heather/Black',
      'zh_Hans': '',
    },
    '3t5c7c06': {
      'en': 'Order Summary',
      'zh_Hans': '',
    },
    'rki4fv1d': {
      'en': 'Below is a list of your items.',
      'zh_Hans': '',
    },
    'zujv6058': {
      'en': 'Price Breakdown',
      'zh_Hans': '',
    },
    '555to0ha': {
      'en': 'Base Price',
      'zh_Hans': '',
    },
    '06v0uqfd': {
      'en': '\$156.00',
      'zh_Hans': '',
    },
    '9jovoe15': {
      'en': 'Taxes',
      'zh_Hans': '',
    },
    'q91uber2': {
      'en': '\$24.20',
      'zh_Hans': '',
    },
    'fwfd54zg': {
      'en': 'Cleaning Fee',
      'zh_Hans': '',
    },
    '1e98lacs': {
      'en': '\$40.00',
      'zh_Hans': '',
    },
    'qoyz6qsr': {
      'en': 'Total',
      'zh_Hans': '',
    },
    '8ychptad': {
      'en': '\$230.20',
      'zh_Hans': '',
    },
    '4rm3i428': {
      'en': 'Continue to Checkout',
      'zh_Hans': '',
    },
    'ehjz1iwm': {
      'en': 'Home',
      'zh_Hans': '',
    },
  },
  // cart
  {
    'x20w05w5': {
      'en': 'Back',
      'zh_Hans': '',
    },
    '4h5owg22': {
      'en': 'My Cart',
      'zh_Hans': '',
    },
    'xzu1c526': {
      'en': 'Price Summary',
      'zh_Hans': '',
    },
    'xst40wsg': {
      'en': 'Base Price',
      'zh_Hans': '',
    },
    'fcsda5tp': {
      'en': 'Taxes',
      'zh_Hans': '',
    },
    '340qirf6': {
      'en': 'Total',
      'zh_Hans': '',
    },
    'vvja2slt': {
      'en': 'Checkout ',
      'zh_Hans': '',
    },
    'fpg5vgfz': {
      'en': 'Home',
      'zh_Hans': '',
    },
  },
  // cart02
  {
    'ibh5bomf': {
      'en': 'Below are the items in your cart.',
      'zh_Hans': '',
    },
    'mr2j1rbl': {
      'en': 'Price Breakdown',
      'zh_Hans': '',
    },
    'mqfru2ut': {
      'en': 'Base Price',
      'zh_Hans': '',
    },
    '8k5xqx4d': {
      'en': 'GST 8%',
      'zh_Hans': '',
    },
    '3l3uzdw5': {
      'en': 'Total',
      'zh_Hans': '',
    },
    '70vd1lle': {
      'en': 'Proceed to Checkout',
      'zh_Hans': '',
    },
    'vubo115t': {
      'en': 'My Cart',
      'zh_Hans': '',
    },
    'ovc3wqak': {
      'en': 'My Cart',
      'zh_Hans': '',
    },
  },
  // OrderConfirm
  {
    'spn6grjj': {
      'en': 'Thank You for your Order !!',
      'zh_Hans': '',
    },
    '42xvcovn': {
      'en':
          'We are processing your order. We will contact you shortly regards to your delivery schedule.',
      'zh_Hans': '',
    },
    'zji1zmuq': {
      'en': 'Go Home',
      'zh_Hans': '',
    },
    'o2eh0uah': {
      'en': 'Home',
      'zh_Hans': '',
    },
  },
  // CheckOutPage
  {
    '6kz4k4oi': {
      'en': 'Payment Details',
      'zh_Hans': '',
    },
    'dcz6iscc': {
      'en': 'GST 8%',
      'zh_Hans': '',
    },
    'y7j044g9': {
      'en': 'Final Total ',
      'zh_Hans': '',
    },
    'q56gek6s': {
      'en': 'Confirm Order',
      'zh_Hans': '',
    },
    'oljoti21': {
      'en': 'PayNow',
      'zh_Hans': '',
    },
    'p5r7yjxl': {
      'en': 'Home',
      'zh_Hans': '',
    },
  },
  // emailSent
  {
    'jdj5cgf9': {
      'en': 'Reset Password ',
      'zh_Hans': '',
    },
    '2l202shb': {
      'en':
          'An email with reset password link already sent to your registered email address.   Please follow the link in the email to reset your WeDeck Account password.',
      'zh_Hans': '',
    },
    '42zs4mm7': {
      'en': 'OK',
      'zh_Hans': '',
    },
  },
  // CloseAccemailSent
  {
    'cqriv975': {
      'en': 'Account Closure',
      'zh_Hans': '',
    },
    'a8x3brfz': {
      'en':
          'We are sad to see you leaving.  Please note that any pending and outstanding transactions must be completely settled before account closure is completed. \n\nUpon our Customer Relationship Verfication, a confirmation email will send to your registered email address to indicate the account closing is complete and all your personal data in our system will be removed by then.',
      'zh_Hans': '',
    },
    '4yuvr8zz': {
      'en': 'Confirm',
      'zh_Hans': '',
    },
  },
  // Checkout2Payment
  {
    'e9wrckwy': {
      'en': 'PayNow',
      'zh_Hans': '',
    },
    'nrhq0mor': {
      'en': 'Payment Details ',
      'zh_Hans': '',
    },
    '24ni6l2o': {
      'en': 'Total Before GST',
      'zh_Hans': '',
    },
    'ebbdd5ho': {
      'en': 'GST 8%',
      'zh_Hans': '',
    },
    't2fkuaen': {
      'en': 'Final Total',
      'zh_Hans': '',
    },
    'ti8yzv6f': {
      'en': 'Confirm Order',
      'zh_Hans': '',
    },
  },
  // Miscellaneous
  {
    'slxakolr': {
      'en': 'Allow the Apps to send system specific notification ',
      'zh_Hans': '',
    },
    'fx3l62h0': {
      'en': '',
      'zh_Hans': '',
    },
    '8rcwrqfn': {
      'en': '',
      'zh_Hans': '',
    },
    'v9w7clrj': {
      'en': '',
      'zh_Hans': '',
    },
    '2yvkanht': {
      'en': '',
      'zh_Hans': '',
    },
    'ku4oxk55': {
      'en': '',
      'zh_Hans': '',
    },
    'mkf1tojq': {
      'en': '',
      'zh_Hans': '',
    },
    'vx8d4uk8': {
      'en': '',
      'zh_Hans': '',
    },
    '29peryk5': {
      'en': '',
      'zh_Hans': '',
    },
    '0bivc2li': {
      'en': '',
      'zh_Hans': '',
    },
    'ajuozh40': {
      'en': '',
      'zh_Hans': '',
    },
    '5a3pk9kh': {
      'en': '',
      'zh_Hans': '',
    },
    'eimbdvae': {
      'en': '',
      'zh_Hans': '',
    },
    'kwjx8eas': {
      'en': '',
      'zh_Hans': '',
    },
    'hepdc273': {
      'en': '',
      'zh_Hans': '',
    },
    'nndoe34p': {
      'en': '',
      'zh_Hans': '',
    },
    'tgbc2dzh': {
      'en': '',
      'zh_Hans': '',
    },
    'lzy2hu0m': {
      'en': '',
      'zh_Hans': '',
    },
    'ui0cpqdx': {
      'en': '',
      'zh_Hans': '',
    },
    'uyv43slv': {
      'en': '',
      'zh_Hans': '',
    },
    'vmtogkn1': {
      'en': '',
      'zh_Hans': '',
    },
    'o0mw9p07': {
      'en': '',
      'zh_Hans': '',
    },
  },
].reduce((a, b) => a..addAll(b));
