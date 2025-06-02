import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'accept_terms_model.dart';
export 'accept_terms_model.dart';

class AcceptTermsWidget extends StatefulWidget {
  const AcceptTermsWidget({super.key});

  static String routeName = 'AcceptTerms';
  static String routePath = '/acceptTerms';

  @override
  State<AcceptTermsWidget> createState() => _AcceptTermsWidgetState();
}

class _AcceptTermsWidgetState extends State<AcceptTermsWidget> {
  late AcceptTermsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AcceptTermsModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              alignment: AlignmentDirectional(1.0, -1.0),
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: CachedNetworkImage(
                                      fadeInDuration:
                                          Duration(milliseconds: 500),
                                      fadeOutDuration:
                                          Duration(milliseconds: 500),
                                      imageUrl:
                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/huber-eats-consumer-app-38yn7u/assets/1yoiptace4c3/Screenshot_2024-02-26_at_10.19.33.png',
                                      width: 77.0,
                                      height: 77.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      'Accept Kaboom’s Terms & Review Privacy Notice',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            font: GoogleFonts.openSans(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .fontStyle,
                                            ),
                                            fontSize: 28.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmall
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 14.0)),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 500.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Terms and Conditions:\n1. Introduction\nWelcome to Kaboom Gaming. By renting a PS5 console from us, you agree to abide by these terms and conditions. Please read them carefully before making a booking. If you do not agree with any part of these terms, please do not proceed with the rental.\n\n2. Eligibility\nTo rent a PS5 console, you must be at least 18 years of age. Minors must be accompanied by a guardian who will take full responsibility for the rental.\n\n3. Rental Terms\nRentals are charged on an hourly basis. The minimum rental period is half an hour. Rental time begins as soon as the PS5 is handed over and ends when the time is over. All rentals must be returned promptly at the end of the agreed rental period in its original condition.\n\n4. Booking and Payment\nBookings must be made online through our website. Full payment for the rental period must be made upfront before the PS5 console is handed over. We accept payment through UPI, net banking, and credit/debit cards. Once the payment is made, it is non-refundable except in cases where Kaboom Gaming is unable to provide the service.\n\n5. Cancellation Policy\nCancellations made 24 hours before the rental period will be eligible for a full refund. Cancellations made within 24 hours of the rental period will incur a 50% cancellation fee.\n\n6. User Responsibilities\nThe user is responsible for the proper care and use of the PS5 console and any accessories provided. The user is liable for any damage to or theft of the PS5 console, DualSense controllers, TV, speakers, and all other external hardware during the rental period. In case of damage, the user will be required to pay for the repair or replacement of the console and other accessories at market value.\n\nThe PS5 console and all other accessories must only be used for legal and legitimate purposes. Any misuse, including but not limited to illegal downloads, hacks, or modifications, is strictly prohibited and will result in immediate termination of the rental without a refund.\n\n7. Limitation of Liability\nKaboom Gaming is not liable for any injury, loss, or damage that may occur during the rental period, including but not limited to physical harm, property damage, or data loss. Kaboom Gaming is not responsible for any malfunction of the PS5 console that occurs during the rental period. In such cases, the user should immediately notify us and we will arrange for a replacement or repair.\n\n8. Indemnification\nThe user agrees to indemnify and hold Kaboom Gaming harmless from any claims, liabilities, damages, or expenses (including legal fees) arising from their use of the PS5 console, breach of these terms, or any unauthorized activity.\n\n9. Governing Law and Jurisdiction\nThese terms and conditions are governed by and construed in accordance with the laws of India. Any disputes arising from these terms will be subject to the exclusive jurisdiction of the courts in Bengaluru, India.\n\n10. Amendments\nKaboom Gaming reserves the right to modify or amend these terms and conditions at any time. Any changes will be communicated to users via the website or email. Continued use of the rental service after such changes constitutes acceptance of the new terms.\n\n11. Contact Information\nFor any questions or concerns regarding these terms and conditions, please contact us at:\n\nEmail: kaboomgamingfun@gmail.com\n\nPhone: 8688186964\n\nAddress: No. 154/20, 3rd Floor, Royal Space Building, V 439 5th Main, HSR Layout, 7th Sector, Madina Nagar, Bommanahalli, Bangalore-Karnataka- 560102\n\nCancellation and Refund Policy:\nLast Updated: 20-Aug-2024\n\nAt Kaboom Gaming, we strive to provide a seamless and enjoyable gaming experience for all our users. To maintain the quality and availability of our services, we have implemented the following cancellation and refund policy.\n\n1. Cancellation Policy\n1.1. No Cancellations\nOnce a booking is confirmed on our website, it cannot be cancelled. All bookings are final and non-cancellable.\n\n1.2. Careful Selection\nWe encourage you to carefully select your preferred time slot before finalizing your booking as changes or cancellations cannot be accommodated once the booking is completed.\n\n2. Refund Policy\n2.1. Company-Initiated Refunds\nIf Kaboom Gaming is unable to provide the booked service due to unforeseen circumstances such as technical issues, unavailability of the PS5 console, or other operational disruptions, you will be eligible for a full refund of the amount paid for the affected booking.\n\n2.2. Refund Process\nIn the event of a company-initiated refund, we will notify you via email and initiate the refund process. Refunds will be processed to the original payment method used during booking. Please allow up to 7-10 business days for the refund to reflect in your account, depending on your payment provider’s processing times.\n\n2.3. No Refund for User-Initiated Requests\nRefunds will not be provided for any user-initiated requests such as no-shows or personal reasons for not utilizing the booking.\n\n3. Dispute Resolution\n3.1. Contact Us\nIf you believe you are entitled to a refund under this policy and have not received it, please contact our customer support team at kaboomgamingfun@gmail.com within 7 days of your booking date.\n\n3.2. Response Time\nWe will review your case and respond within 5 business days to address your concerns.\n\n4. Finality of Decisions\n4.1. Final and Binding\nAll decisions made by Kaboom Gaming regarding cancellations and refunds are final and binding.\n\n5. Governing Law\n5.1. Jurisdiction\nThis policy is governed by and construed in accordance with the laws of India. Any disputes arising under this policy shall be subject to the exclusive jurisdiction of the courts of Bengaluru City, India.\n\nPrivacy Policy\nEffective Date: 20-Aug-2024\n\nWelcome to Kaboom Gaming. We value your privacy and are committed to protecting your personal information. This Privacy Policy outlines how we collect, use, disclose, and protect your data when you use our services, including our website, rental services, and any associated mobile applications.\n\n1. Information We Collect\nPersonal Information\nWhen you create an account, book a rental, or contact us, we may collect your name, email address, phone number, address, payment information, and other details necessary to provide our services.\n\nUsage Data\nWe may collect data on how you interact with our website and services, including your IP address, browser type, device information, and browsing behavior.\n\nTransaction Information\nDetails of your transactions, including rental history and payment records, are collected and stored for legal and operational purposes.\n\n2. How We Use Your Information\nService Provision\nTo manage your account, process transactions, provide customer support, and deliver our services efficiently.\n\nCommunication\nTo send you updates, promotions, and other relevant information about our services. You can opt out of these communications at any time.\n\nLegal Compliance\nTo comply with applicable laws, regulations, and legal processes, including tax reporting and financial audits.\n\nSecurity\nTo monitor and improve the security of our services, prevent fraud, and protect against unauthorized access.\n\n3. Data Sharing and Disclosure\nWe do not sell, trade, or otherwise transfer your personal information to third parties except in the following circumstances:\n\nService Providers\nWe may share your data with trusted third-party service providers who assist us in operating our business, such as payment processors, IT service providers, and marketing agencies. These parties are bound by confidentiality agreements.\n\nLegal Requirements\nWe may disclose your data if required by law or in response to valid requests by public authorities, such as a court order or government regulation.\n\nBusiness Transfers\nIn the event of a merger, acquisition, or sale of all or a portion of our assets, your personal information may be transferred to the new owner.\n\n4. Data Security\nWe implement reasonable security measures to protect your data from unauthorized access, alteration, disclosure, or destruction. These include encryption, access control, and secure storage protocols. However, please be aware that no method of transmission over the Internet or electronic storage is completely secure.\n\n5. Your Rights\nUnder Indian law, you have the following rights concerning your personal data:\n\nAccess and Correction\nYou can request access to your personal information and correct any inaccuracies.\n\nData Portability\nYou can request a copy of your data in a structured, commonly used format.\n\nErasure\nYou have the right to request the deletion of your personal data, subject to legal and contractual obligations.\n\nObjection and Restriction\nYou may object to or request the restriction of the processing of your personal data in certain circumstances.\n\nWithdraw Consent\nWhere processing is based on your consent, you have the right to withdraw your consent at any time.\n\nTo exercise these rights, please contact us at kaboomgamingfun@gmail.com.\n\n6. Cookies and Tracking Technologies\nOur website may use cookies and similar tracking technologies to enhance your experience. Cookies are small files stored on your device that help us remember your preferences and track your usage of our site. You can manage cookie preferences through your browser settings.\n\n7. Children\'s Privacy\nOur services are not intended for children under the age of 18. We do not knowingly collect or process personal data from children. If we become aware that we have collected data from a child under 18, we will take steps to delete such information.\n\n8. Changes to This Privacy Policy\nWe may update this Privacy Policy from time to time to reflect changes in our practices or for other operational, legal, or regulatory reasons. We will notify you of any material changes by posting the updated policy on our website and updating the \"Effective Date\" at the top.\n\n9. Contact Us\nIf you have any questions or concerns about this Privacy Policy or our data practices, please contact us at:\n\nEmail: kaboomgamingfun@gmail.com\n\nPhone: 8688186964\n\nAddress: No. 154/20, 3rd Floor, Royal Space Building, V 439 5th Main, HSR Layout, 7th Sector, Madina Nagar, Bommanahalli, Bangalore-Karnataka- 560102\n\n10. Jurisdiction and Dispute Resolution\nThis Privacy Policy is governed by the laws of India. Any disputes arising from or relating to this policy will be subject to the exclusive jurisdiction of the courts in Bengaluru City, India.',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'I have read and agree to the terms and conditions.',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 0.0, 0.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              _model.termsAccepted = true;
                                              safeSetState(() {});
                                            },
                                            child: Container(
                                              width: 30.0,
                                              height: 30.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 4.0,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    offset: Offset(
                                                      0.0,
                                                      2.0,
                                                    ),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                ),
                                              ),
                                              child: Visibility(
                                                visible: _model.termsAccepted ==
                                                    true,
                                                child: Theme(
                                                  data: ThemeData(
                                                    checkboxTheme:
                                                        CheckboxThemeData(
                                                      visualDensity:
                                                          VisualDensity.compact,
                                                      materialTapTargetSize:
                                                          MaterialTapTargetSize
                                                              .shrinkWrap,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4.0),
                                                      ),
                                                    ),
                                                    unselectedWidgetColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                  ),
                                                  child: Checkbox(
                                                    value: _model
                                                        .checkboxValue ??= true,
                                                    onChanged:
                                                        (newValue) async {
                                                      safeSetState(() =>
                                                          _model.checkboxValue =
                                                              newValue!);
                                                    },
                                                    side: (FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate !=
                                                            null)
                                                        ? BorderSide(
                                                            width: 2,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                          )
                                                        : null,
                                                    activeColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    checkColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .info,
                                                  ),
                                                ),
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
                          ].divide(SizedBox(height: 27.0)),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FlutterFlowIconButton(
                                  borderRadius: 20.0,
                                  borderWidth: 1.0,
                                  buttonSize: 40.0,
                                  fillColor: Color(0xFFEFECF0),
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    context.safePop();
                                  },
                                ),
                                if (_model.termsAccepted == true)
                                  FFButtonWidget(
                                    onPressed: () async {
                                      await currentUserReference!
                                          .update(createUsersRecordData(
                                        termsAccepted:
                                            _model.termsAccepted == true,
                                      ));

                                      context.pushNamed(HomeWidget.routeName);
                                    },
                                    text: 'Next',
                                    icon: Icon(
                                      Icons.arrow_forward,
                                      size: 24.0,
                                    ),
                                    options: FFButtonOptions(
                                      width: 100.0,
                                      height: 55.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 10.0, 16.0, 10.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge
                                                    .fontStyle,
                                          ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ]
                        .addToStart(SizedBox(height: 20.0))
                        .addToEnd(SizedBox(height: 24.0)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
