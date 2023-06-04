import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cart_entry_model.dart';
export 'cart_entry_model.dart';

class CartEntryWidget extends StatefulWidget {
  const CartEntryWidget({
    Key? key,
    this.productName,
    this.productPrice,
    this.productImage,
    required this.productQty,
    required this.cartRef,
    this.productUOM,
    this.unitPrice,
  }) : super(key: key);

  final String? productName;
  final double? productPrice;
  final String? productImage;
  final int? productQty;
  final DocumentReference? cartRef;
  final String? productUOM;
  final double? unitPrice;

  @override
  _CartEntryWidgetState createState() => _CartEntryWidgetState();
}

class _CartEntryWidgetState extends State<CartEntryWidget> {
  late CartEntryModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CartEntryModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
      child: Container(
        width: double.infinity,
        height: 137.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x320E151B),
              offset: Offset(0.0, 1.0),
            )
          ],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 8.0, 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Hero(
                tag: widget.productImage!,
                transitionOnUserGestures: true,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.network(
                    widget.productImage!,
                    width: 80.0,
                    height: 80.0,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.productName!.maybeHandleOverflow(maxChars: 22),
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily: 'Poppins',
                              fontSize: 16.0,
                            ),
                      ),
                      Text(
                        '${formatNumber(
                          widget.productPrice,
                          formatType: FormatType.decimal,
                          decimalType: DecimalType.automatic,
                          currency: '',
                        )} / ${widget.productUOM}',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              fontSize: 12.0,
                            ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                        child: Text(
                          'Total Price ${valueOrDefault<String>(
                            formatNumber(
                              functions.calItemPrice(
                                  widget.productPrice!, widget.productQty!),
                              formatType: FormatType.custom,
                              currency: '',
                              format: ' #,##0.##',
                              locale: 'en_US',
                            ),
                            '0.00',
                          )}',
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 16.0,
                                  ),
                        ),
                      ),
                      Container(
                        width: 130.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFCDCCCC),
                          borderRadius: BorderRadius.circular(0.0),
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                            width: 1.0,
                          ),
                        ),
                        child: FlutterFlowCountController(
                          decrementIconBuilder: (enabled) => FaIcon(
                            FontAwesomeIcons.minus,
                            color:
                                enabled ? Color(0xDD000000) : Color(0xFFEEEEEE),
                            size: 18.0,
                          ),
                          incrementIconBuilder: (enabled) => FaIcon(
                            FontAwesomeIcons.plus,
                            color: enabled ? Colors.blue : Color(0xFFEEEEEE),
                            size: 18.0,
                          ),
                          countBuilder: (count) => Text(
                            count.toString(),
                            style: GoogleFonts.getFont(
                              'Poppins',
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 18.0,
                            ),
                          ),
                          count: _model.countControllerValue ??=
                              widget.productQty!,
                          updateCount: (count) async {
                            setState(() => _model.countControllerValue = count);
                            _model.qtyInCart = await actions.quantityValidation(
                              _model.countControllerValue!,
                            );
                            if (_model.qtyInCart!) {
                              await widget.cartRef!.delete();
                            } else {
                              final cartUpdateData = createCartRecordData(
                                quantity: _model.countControllerValue,
                              );
                              await widget.cartRef!.update(cartUpdateData);
                            }

                            setState(() {});
                          },
                          stepSize: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 40.0,
                icon: Icon(
                  Icons.delete_outline_rounded,
                  color: FlutterFlowTheme.of(context).error,
                  size: 20.0,
                ),
                onPressed: () async {
                  await widget.cartRef!.delete();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
