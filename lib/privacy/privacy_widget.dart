import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'privacy_model.dart';
export 'privacy_model.dart';

class PrivacyWidget extends StatefulWidget {
  const PrivacyWidget({Key? key}) : super(key: key);

  @override
  _PrivacyWidgetState createState() => _PrivacyWidgetState();
}

class _PrivacyWidgetState extends State<PrivacyWidget> {
  late PrivacyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrivacyModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    icon: Icon(
                      Icons.arrow_back,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 20.0,
                    ),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                    child: Text(
                      'Privacy Policy',
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 10.0, 5.0, 0.0),
                      child: Text(
                        'Date of issuance of this Privacy Policy: \t​\t​\t​\t​28 February 2023\n\nWe,  Yiwei Supplies Pte. Ltd. (“Company”, “us”, “we”, “our” or “ours”), understand the importance of personal data (“Personal Data” refers to any information whether recorded in a material form or not, from which the identity of an individual is apparent or can be reasonably and directly ascertained by the entity holding the information, or when put together with other information would directly and certainly identify an individual) and sensitive personal data which includes but is not limited to, information pertaining to the physical or mental health or condition of an individual and religious beliefs, or any other sensitive personal data (“Sensitive Personal Data”) as defined under the applicable regulations, guidelines, orders made under the Personal Data Protection Act 2012 and any statutory amendments or re-enactments made of the Personal Data Protection Act 2012 from time to time (collectively referred to as the “PDPA”). We endeavor to protect Personal Data through our compliance with the PDPA, and this privacy policy for processing of personal data (“Privacy Policy”), and by appropriately processing the Personal Data of our customers, applicants for potential employment or recruitment activities by the Company, vendors and suppliers, and users of our website or application software.\n\nWe will collect Personal Data and Sensitive Personal Data during your course of dealings with us in any way or manner including pursuant to any transactions, any event and/or communications made from/with us in an appropriate manner not limiting to using for performance of contract, entering into contract, legal obligation, vital interests, and administration of justice;\nWe will inform you regarding the purpose of use for your Personal Data and Sensitive Personal Data, and use such information within the scope of such lawful, direct purpose and/or for secondary purposes;\nWe will take necessary and appropriate measures to safely manage Personal Data and Sensitive Personal Data;\nWe will collect/use/disclose personal data without the consent of individual in case of: necessary for purpose, life threatening situation, publicly available data, national interest, investigations, evaluation purpose, artistic purpose, news activity, provision of legal services, collected by credit bureau, employment purpose, disclosed by public agency, etc;\nExcept where otherwise specified, we will not share, disclose or sell Personal Data or Sensitive Personal Data to any third parties without the consent of the individual;\nWe will respond appropriately in the event that an individual contact the appropriate point of contact regarding display, correction, deletion, withdrawal (in full or in part) and/or termination of use of their respective Personal Data or Sensitive Personal Data;\nWe will maintain records of application, notice, requests, etc. related to Personal Data being processed by the Company;\nThe collection of your Personal Data by us may be mandatory or voluntary in nature depending on the Purposes for which your Personal Data is collected. Where it is obligatory for you to provide us with your Personal Data and you fail or choose not to provide us with such data, or do not consent to the purposes of collection or this Privacy Policy, we will not be able to provide products and/or services or otherwise deal with you.\nPurpose of use for Personal Data and Sensitive Personal Data\nWe use Personal Data provided to us by individuals for only the following purposes (“Purposes”):\n\n(1)Personal Data and Sensitive Personal Data of our customers (including users of our application software)\n\nto communicate with you;\nto maintain and improve customer relationship;\nto assess, process and provide products, services and/or facilities to you;\nto administer and process any payments related to products, services and/or facilities requested by you;\nto provide you with information and/or updates on our products, services, upcoming promotions offered by us and/or events organized by us and selected third parties which may be of interest to you from time to time;\nfor direct marketing purposes via SMS, phone call, email, mail, social media and/or any other appropriate communication channels to members of our loyalty program in accordance with their consent;\nto facilitate your participation in, and our administration of, any events including contests, promotions or campaigns;\nto award points in a loyalty or rewards program;\nto maintain and update internal record keeping;\nfor internal administrative purposes;\nto send you seasonal greetings messages from time to time;\nto send you invitation to join our events and promotions and product launch events;\nto monitor, review and improve our events and promotions, products and/or services;\nto process and analyse your Personal Data either individually or collectively with other individuals;\nto conduct market research or surveys, internal marketing analysis, customer profiling activities, analysis of customer patterns and choices, planning and statistical and trend analysis in relation to our products and/or services;\nto share any of your Personal Data with our business partners to jointly develop products and/or services or launch marketing campaigns;\nto share any of your Personal Data with insurance companies necessary for the purposes of insurance claims;\nfor audit, risk management and security purposes;\nfor detecting, investigating and preventing fraudulent, prohibited or illegal activities;\nfor enabling us to perform our obligations and enforce our rights under any agreements or documents that we are a party to;\nto transfer or assign our rights, interests and obligations under any agreements entered with us;\nto respond to your enquiries or complaints and resolve any issues and disputes which may arise in connection with any dealings with us;\nfor meeting any applicable legal or regulatory requirements and making disclosure under the requirements of any applicable law, regulation, direction, court order, by-law, guideline, circular or code applicable to us;\nto enforce or defend our rights and your rights under, and comply with, our obligations under the applicable laws, legislation and regulations; other purposes required to operate, maintain and better manage our business and your relationship with us, which we notify you of at the time of obtaining your consent.\n\n(2) Personal Data and Sensitive Personal Data of Employment Applicants\n\nContacting and/or providing information to employment applicants, and other uses necessary for employment and recruiting activities.\nIf your application is unsuccessful, we will keep your Personal Data for a reasonable period in accordance with our internal policies and procedures and for administration and statistical analysis purposes or for other job opportunities.\nIf your application is successful, we will process your Personal Data for purposes regarding employment with us in accordance with the applicable law and/or PDPA.\n(3) Personal Data and Sensitive Data of our Vendors and Suppliers\n\nto communicate with you;\nto maintain and improve business relationship;\nto establish your identity and background;\nto maintain and update internal record keeping;\nfor internal administrative purposes;\nto conduct credit reference checks and establish your creditworthiness, where necessary;\nto administer and give effect to your commercial transactions with us (such as a tender award, contract for service, tenancy agreement);\nto process any payments related to your commercial transactions with us;\nto process and analyse your Personal Data either individually or collectively with other individuals;\nto share any of your Personal Data with the auditor for our internal audit and reporting purposes;\nto share any of your Personal Data pursuant to any agreement or document which you have duly entered with us for purposes of seeking legal and/or financial advice and/or for purposes of commencing legal action;\nto share any of your Personal Data with our business partners to jointly develop products and/or services or launch marketing campaigns;\nto share any of your Personal Data with insurance companies necessary for the purpose of applying and obtaining insurance policy (ies), if necessary;\nto share any of your Personal Data with financial institutions necessary for the purpose of applying and obtaining credit facility (ies), if necessary;\nfor audit, risk management and security purposes;\nfor detecting, investigating and preventing fraudulent, prohibited or illegal activities;\nfor enabling us to perform our obligations and enforce our rights under any agreements or documents that we are a party to;\nto transfer or assign our rights, interests and obligations under any agreements entered with us;\nto respond to your enquiries or complaints and resolve any issues and disputes which may arise in connection with any dealings with us;\nfor meeting any applicable legal or regulatory requirements and making disclosure under the requirements of any applicable law, regulation, direction, court order, by-law, guidance, circular or code applicable to us;\nto enforce or defend our rights and your rights under and to comply with, our obligations under the applicable laws, legislation and regulations; or\nother purposes required to operate, maintain and better manage our business and your relationship with us, which we notify you of at the time of obtaining your consent;\n(4) Personal Data and Sensitive Personal Data of those persons who post/submit Personal Data and Sensitive Personal Data on our website or application software\n\nUse of works posted/submitted on our website or application software in advertisements for the Company or its affiliates.\n*All rights of publicity, copyrights and other industrial property rights in such posted/submitted works shall be attributed to the user who posted/submitted such works; provided, however, that upon posting/submitting such works, the user shall be deemed to have granted the Company a global, royalty-free and non-exclusive license (with right of sublicense to third parties) to use (including, without limitation, reproduce, publicize, send, distribute, assign, loan, translate and adapt) such works, and such user agrees that he or she shall not assert any moral rights in such works.\n\n\nYou agree and consent to us using and processing your Personal Data for the Purposes in the manner as identified in this Privacy Policy. If you do not consent to us processing your Personal Data for one or more of the Purposes, please notify us at the contact details below.\n\nInquiries regarding display, correction, deletion and/or termination of use of Personal Data\n\nUpon receipt of a request for display, correction, deletion, withdrawal (in full or in part) and/or termination of use of Personal Data, we will promptly respond to such requests upon confirming the identity of the person through prescribed procedures. For any inquiries regarding Personal Data, please contact our Data Protection Officer at the following contact details:\n\nData Protection Officer : Clarence Chua\nPostal Address: 23 Depot Lane Singapore\nEmail Address: dpo_sg@yws.com.sg\n\nBy providing your Personal Data to us, you consent to us processing your Personal Data in accordance with this Privacy Policy, and you confirm that all Personal Data provided by you is accurate and complete, and that none of it is misleading or out of date. You will promptly update us in the event of any change to your Personal Data.\nWe may reject access request if any exception or prohibition under the PDPA apply.\n\nTurnaround time\n\nWe will respond as soon as possible but in all cases within thirty calendar days from the date of your request on the Personal Data relating to you.\n\nWhere we store your personal data?\n\nInternet is used in a global environment, using it to collect and process personal data may involve the transmission of data on an international basis. The Personal Data that we collect from you may be transferred to, accessed in and stored at, a destination outside Singapore, these data will always be held securely and in line with the requirements of any applicable laws and regulations regarding data protection. Please be aware that communications over the Internet, such as emails/webmails are not secure unless they have been encrypted.\n\nWe may need to transfer your Personal Data outside of Singapore. You hereby expressly consent to us transferring your Personal Data outside of Singapore for such Purposes. Your Personal Data may be processed by third-parties operating within or outside Singapore, working for us or for one of our suppliers, where necessary, for the Purposes mentioned above, to any party who undertakes to keep your Personal Data confidential or to whom we are compelled or required under the data protection laws to disclose to. Such third parties may be engaged in, among other things, the fulfillment of your order, the processing of your payment details and the provision of support services. When we transfer Personal Data to third parties outside Singapore, we ask them to provide adequate guarantees to implement appropriate technical and organizational security measures in such a manner that processing will meet the requirements of Singapore data protection laws and regulations to ensure the protection of your rights as an individual.\n\nProtection of your Personal Data\n\n\nWe will take reasonable steps to protect Personal Data from loss, misuse, modification, Personal Data in our possession or under our control in order to prevent unauthorized or accidental access or disclosure, alteration or destruction.\nWe will ensure technical and organizational security measures governing the processing of Personal Data to be carried out and ensure compliance with the measures. \n\nRetention Period of your Personal Data\nWe will cease to retain the documents containing Personal Data or remove the means by which the Personal Data can be associated with the individuals when it can be assumed that: the Purpose for which the personal data was collected is no longer being served by retention of personal data, and the retention is not necessary for legal or business purposes. We reserve the right to retain and keep your Personal Data for a period necessary for business, tax, or legal purposes.\n\nPersonal Data from other Individuals and Minors\n\nTo the extent that you have provided (or will provide) Personal Data about your family members, spouse and/or other dependents, you confirm that you have explained to them that their Personal Data will be provided to, and processed by us, and you represent and warrant that you have obtained their consent to the processing (including disclosure and transfer) of their Personal Data in accordance with this Privacy Policy.\n\nOur website is intended only for persons who are at least eighteen (18) years old. If you are an individual under 18 years of age (“Minors”) or individuals not legally competent to give consent, you will require a parent or legal guardian to consent to the processing (including disclosure and transfer) of your Personal Data in accordance with this Privacy Policy. We neither offer products or services to, nor knowingly collect Personal Data of Minors without any legal basis. Should we learn that we were provided with Personal Data of Minors without any legal basis, we will delete the same from our database. If you are a Minor, please do not provide any Personal Data to us, such as your name, age, gender, email address, contact information and the like, and kindly consult your parent(s) or legal guardian(s) first before visiting any website.\n\n\nOthers\n\nThe Company reserves the right to change or revise this Privacy Policy from time to time without prior notice to incorporate any changes in its procedures for protecting Personal Data or any regulatory changes. The latest version of the Privacy Policy is always available on our websites. We will communicate any material changes to this Privacy Policy via announcements on our Company website or any other appropriate mean. Please review this Privacy Policy every time before you deal with us to be sure you agree with it.\n\nFurther, by continuing to use the services, purchasing products from the Company or by your continued engagement with the Company following the change or revision to this Privacy Policy, you will be treated as having agreed to and accept those amendments.\n\nIf you do not agree to this Privacy Policy or any amendments to this Privacy Policy, we may not be able to render all services to you or dealing with you, and you may be required to terminate your relevant agreement with us, stop accessing or using our website and/or dealing with us.',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              fontSize: 8.0,
                              fontWeight: FontWeight.w200,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
