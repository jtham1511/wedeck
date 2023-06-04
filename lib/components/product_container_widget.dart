import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'product_container_model.dart';
export 'product_container_model.dart';

class ProductContainerWidget extends StatefulWidget {
  const ProductContainerWidget({
    Key? key,
    this.productName,
    this.productImage,
    this.productPrice,
    this.productUom,
    bool? productFavourite,
    this.productCategory,
  })  : this.productFavourite = productFavourite ?? true,
        super(key: key);

  final String? productName;
  final String? productImage;
  final double? productPrice;
  final String? productUom;
  final bool productFavourite;
  final String? productCategory;

  @override
  _ProductContainerWidgetState createState() => _ProductContainerWidgetState();
}

class _ProductContainerWidgetState extends State<ProductContainerWidget> {
  late ProductContainerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductContainerModel());
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
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.45,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    valueOrDefault<String>(
                      widget.productImage,
                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/wedeck005-jynq43/assets/vqzi5c115f23/WeDeck-beta.png',
                    ),
                    width: double.infinity,
                    height: 120.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                    child: Icon(
                      Icons.favorite_border,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 15.0,
                    ),
                  ),
                  Text(
                    valueOrDefault<String>(
                      widget.productCategory,
                      'All',
                    ),
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'Outfit',
                          color: Color(0xFF57636C),
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                child: Text(
                  valueOrDefault<String>(
                    widget.productName,
                    'Product Name',
                  ).maybeHandleOverflow(maxChars: 22),
                  maxLines: 2,
                  style: FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily: 'Outfit',
                        color: Color(0xFF101213),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 0.0, 0.0),
                child: Text(
                  '${valueOrDefault<String>(
                    formatNumber(
                      widget.productPrice,
                      formatType: FormatType.decimal,
                      decimalType: DecimalType.periodDecimal,
                      currency: 'S\$',
                    ),
                    '0.00',
                  )}/${valueOrDefault<String>(
                    widget.productUom,
                    'unit',
                  )}',
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Outfit',
                        color: Color(0xFF57636C),
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
