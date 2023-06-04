import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/check_out_page/check_out_page_widget.dart';
import '/components/cart_entry_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cart02_model.dart';
export 'cart02_model.dart';

class Cart02Widget extends StatefulWidget {
  const Cart02Widget({
    Key? key,
    this.cartRef,
  }) : super(key: key);

  final DocumentReference? cartRef;

  @override
  _Cart02WidgetState createState() => _Cart02WidgetState();
}

class _Cart02WidgetState extends State<Cart02Widget> {
  late Cart02Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Cart02Model());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<CartRecord>>(
      stream: queryCartRecord(
        queryBuilder: (cartRecord) =>
            cartRecord.where('user', isEqualTo: currentUserReference),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  color: FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
          );
        }
        List<CartRecord> cart02CartRecordList = snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 24.0,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'vubo115t' /* My Cart */,
                      ),
                      style: FlutterFlowTheme.of(context).displaySmall.override(
                            fontFamily: 'Poppins',
                            fontSize: 25.0,
                          ),
                    ),
                  ),
                ],
              ),
              actions: [],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'ibh5bomf' /* Below are the items in your ca... */,
                            ),
                            style: FlutterFlowTheme.of(context).labelMedium,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 0.0),
                          child: StreamBuilder<List<CartRecord>>(
                            stream: queryCartRecord(
                              queryBuilder: (cartRecord) => cartRecord.where(
                                  'user',
                                  isEqualTo: currentUserReference),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                );
                              }
                              List<CartRecord> listViewCartRecordList =
                                  snapshot.data!;
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: listViewCartRecordList.length,
                                itemBuilder: (context, listViewIndex) {
                                  final listViewCartRecord =
                                      listViewCartRecordList[listViewIndex];
                                  return CartEntryWidget(
                                    key: Key(
                                        'Keytjf_${listViewIndex}_of_${listViewCartRecordList.length}'),
                                    productName: listViewCartRecord.name,
                                    productPrice: listViewCartRecord.price,
                                    productImage:
                                        listViewCartRecord.producImage,
                                    productQty: listViewCartRecord.quantity,
                                    productUOM: listViewCartRecord.uom,
                                    cartRef: listViewCartRecord.reference,
                                    unitPrice: listViewCartRecord.price,
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 16.0, 24.0, 4.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'mr2j1rbl' /* Price Breakdown */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 8.0, 24.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'mqfru2ut' /* Base Price */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    Text(
                                      formatNumber(
                                        functions.cartTotal(
                                            cart02CartRecordList
                                                .map((e) => e.price)
                                                .toList(),
                                            cart02CartRecordList
                                                .map((e) => e.quantity)
                                                .toList()),
                                        formatType: FormatType.custom,
                                        currency: '',
                                        format: ' ###,##0.##',
                                        locale: 'en_US',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 2.0, 24.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        '8k5xqx4d' /* GST 8% */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    Text(
                                      valueOrDefault<String>(
                                        formatNumber(
                                          functions.calculateGST(
                                              cart02CartRecordList
                                                  .map((e) => e.price)
                                                  .toList(),
                                              cart02CartRecordList
                                                  .map((e) => e.quantity)
                                                  .toList()),
                                          formatType: FormatType.custom,
                                          currency: '',
                                          format: ' ###,##0.##',
                                          locale: '',
                                        ),
                                        '0.00',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 12.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '3l3uzdw5' /* Total */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30.0,
                                          borderWidth: 1.0,
                                          buttonSize: 36.0,
                                          icon: Icon(
                                            Icons.info_outlined,
                                            color: Color(0xFF57636C),
                                            size: 18.0,
                                          ),
                                          onPressed: () {
                                            print('IconButton pressed ...');
                                          },
                                        ),
                                      ],
                                    ),
                                    Text(
                                      formatNumber(
                                        functions.totalAndGST(
                                            cart02CartRecordList
                                                .map((e) => e.price)
                                                .toList(),
                                            cart02CartRecordList
                                                .map((e) => e.quantity)
                                                .toList()),
                                        formatType: FormatType.custom,
                                        currency: '',
                                        format: ' ###,##0.##',
                                        locale: 'en_US',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .headlineLarge,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    _model.orderIdGenerated = await actions.orderGenerator();
                    await Future.delayed(const Duration(milliseconds: 500));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Oder ID : ${_model.orderIdGenerated}',
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                        duration: Duration(milliseconds: 4000),
                        backgroundColor: FlutterFlowTheme.of(context).secondary,
                      ),
                    );
                    setState(() {
                      FFAppState().baseTotal = functions.cartTotal(
                          cart02CartRecordList.map((e) => e.price).toList(),
                          cart02CartRecordList
                              .map((e) => e.quantity)
                              .toList())!;
                      FFAppState().gstTotal = functions.calculateGST(
                          cart02CartRecordList.map((e) => e.price).toList(),
                          cart02CartRecordList
                              .map((e) => e.quantity)
                              .toList())!;
                      FFAppState().gstAndTotal = functions.totalAndGST(
                          cart02CartRecordList.map((e) => e.price).toList(),
                          cart02CartRecordList
                              .map((e) => e.quantity)
                              .toList())!;
                    });
                    await Future.delayed(const Duration(milliseconds: 650));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          '${FFAppState().gstTotal.toString()}  ${FFAppState().baseTotal.toString()}  ${FFAppState().gstAndTotal.toString()}',
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                        duration: Duration(milliseconds: 4000),
                        backgroundColor: FlutterFlowTheme.of(context).secondary,
                      ),
                    );
                    await Future.delayed(const Duration(milliseconds: 3000));

                    final paymentTxnCreateData = {
                      ...createPaymentTxnRecordData(
                        cartTotal: FFAppState().baseTotal,
                        gstTotal: FFAppState().gstTotal,
                        isPaid: false,
                        isCancel: false,
                        orderId: _model.orderIdGenerated,
                        totalPaid: FFAppState().gstAndTotal,
                        memberId:
                            valueOrDefault(currentUserDocument?.memberId, ''),
                        email: currentUserEmail,
                        hp: currentPhoneNumber,
                        userId: currentUserReference,
                      ),
                      'create_on': FieldValue.serverTimestamp(),
                      'updated_on': FieldValue.serverTimestamp(),
                    };
                    await PaymentTxnRecord.collection
                        .doc()
                        .set(paymentTxnCreateData);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Create Payment transaction',
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                        duration: Duration(milliseconds: 4000),
                        backgroundColor: FlutterFlowTheme.of(context).secondary,
                      ),
                    );
                    await Future.delayed(const Duration(milliseconds: 1000));
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CheckOutPageWidget(
                          orderId: _model.orderIdGenerated,
                          cartId: cart02CartRecordList
                              .map((e) => e.reference)
                              .toList(),
                        ),
                      ),
                    );

                    setState(() {});
                  },
                  child: Container(
                    width: double.infinity,
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primary,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4.0,
                          color: Color(0x320E151B),
                          offset: Offset(0.0, -2.0),
                        )
                      ],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(12.0),
                        topRight: Radius.circular(12.0),
                      ),
                    ),
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '70vd1lle' /* Proceed to Checkout */,
                      ),
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                            fontSize: 20.0,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
