import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_date_model.dart';
export 'add_date_model.dart';

class AddDateWidget extends StatefulWidget {
  const AddDateWidget({Key? key}) : super(key: key);

  @override
  _AddDateWidgetState createState() => _AddDateWidgetState();
}

class _AddDateWidgetState extends State<AddDateWidget> {
  late AddDateModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddDateModel());

    _model.tokenController = TextEditingController(
        text: random_data.randomString(
      10,
      15,
      true,
      true,
      true,
    ));
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        title: Text(
          FFLocalizations.of(context).getText(
            'ec9karrc' /* Добавить дату */,
          ),
          style: FlutterFlowTheme.of(context).title2,
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: Form(
          key: _model.formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: StreamBuilder<UsersRecord>(
            stream: UsersRecord.getDocument(currentUserReference!),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(
                      color: FlutterFlowTheme.of(context).primaryColor,
                    ),
                  ),
                );
              }
              final parentColumnUsersRecord = snapshot.data!;
              return Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                        child: TextFormField(
                          controller: _model.userNameController ??=
                              TextEditingController(
                            text: parentColumnUsersRecord.email,
                          ),
                          readOnly: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle:
                                FlutterFlowTheme.of(context).title3.override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontWeight: FontWeight.normal,
                                    ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(20, 32, 20, 12),
                          ),
                          style: FlutterFlowTheme.of(context).title3,
                          textAlign: TextAlign.start,
                          validator: _model.userNameControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                        child: TextFormField(
                          controller: _model.tokenController,
                          readOnly: true,
                          obscureText: !_model.tokenVisibility,
                          decoration: InputDecoration(
                            labelStyle:
                                FlutterFlowTheme.of(context).title3.override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontWeight: FontWeight.normal,
                                    ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(20, 32, 20, 12),
                            suffixIcon: InkWell(
                              onTap: () => setState(
                                () => _model.tokenVisibility =
                                    !_model.tokenVisibility,
                              ),
                              focusNode: FocusNode(skipTraversal: true),
                              child: Icon(
                                _model.tokenVisibility
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: Color(0xFF757575),
                                size: 0,
                              ),
                            ),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyText2.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w100,
                                  ),
                          textAlign: TextAlign.start,
                          validator: _model.tokenControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      FlutterFlowCalendar(
                        color: FlutterFlowTheme.of(context).primaryColor,
                        weekFormat: true,
                        weekStartsMonday: true,
                        initialDate: null,
                        onChange: (DateTimeRange? newSelectedDate) {
                          setState(() =>
                              _model.calendarSelectedDay = newSelectedDate);
                        },
                        titleStyle: TextStyle(),
                        dayOfWeekStyle: TextStyle(),
                        dateStyle: TextStyle(),
                        selectedDateStyle: TextStyle(),
                        inactiveDateStyle: TextStyle(),
                        locale: FFLocalizations.of(context).languageCode,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.44,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(8),
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      width: 2,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      FlutterFlowDropDown<String>(
                                        options: [
                                          FFLocalizations.of(context).getText(
                                            'buzvrg1t' /* 09:00 */,
                                          ),
                                          FFLocalizations.of(context).getText(
                                            'szpb3k3y' /* 10:00 */,
                                          ),
                                          FFLocalizations.of(context).getText(
                                            '6k5d006j' /* 11:00 */,
                                          ),
                                          FFLocalizations.of(context).getText(
                                            'xg4xic2g' /* 12:00 */,
                                          ),
                                          FFLocalizations.of(context).getText(
                                            '23uz7pld' /* 13:00 */,
                                          ),
                                          FFLocalizations.of(context).getText(
                                            'qfyny3um' /* 14:00 */,
                                          ),
                                          FFLocalizations.of(context).getText(
                                            'bg0h0fxw' /* 15:00 */,
                                          ),
                                          FFLocalizations.of(context).getText(
                                            'rdq8l58q' /* 16:00 */,
                                          ),
                                          FFLocalizations.of(context).getText(
                                            'w79wvz2i' /* 17:00 */,
                                          ),
                                          FFLocalizations.of(context).getText(
                                            'dasyatqe' /* 18:00 */,
                                          ),
                                          FFLocalizations.of(context).getText(
                                            'suv05vaa' /* 19:00 */,
                                          ),
                                          FFLocalizations.of(context).getText(
                                            'w6e4ppeg' /* 20:00 */,
                                          )
                                        ],
                                        onChanged: (val) => setState(
                                            () => _model.dropDownValue1 = val),
                                        width: 180,
                                        height: 50,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.black,
                                            ),
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          'mmbgpt4a' /* Время начала */,
                                        ),
                                        fillColor: Colors.white,
                                        elevation: 2,
                                        borderColor: Colors.transparent,
                                        borderWidth: 0,
                                        borderRadius: 0,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            12, 4, 12, 4),
                                        hidesUnderline: true,
                                      ),
                                      FlutterFlowDropDown<String>(
                                        options: [
                                          FFLocalizations.of(context).getText(
                                            'mauhb5s2' /* 09:00 */,
                                          ),
                                          FFLocalizations.of(context).getText(
                                            '6m6i7ge1' /* 10:00 */,
                                          ),
                                          FFLocalizations.of(context).getText(
                                            'bjrpl9gs' /* 11:00 */,
                                          ),
                                          FFLocalizations.of(context).getText(
                                            '8hhjz8zi' /* 12:00 */,
                                          ),
                                          FFLocalizations.of(context).getText(
                                            'xhel7jnb' /* 13:00 */,
                                          ),
                                          FFLocalizations.of(context).getText(
                                            '4af4uofo' /* 14:00 */,
                                          ),
                                          FFLocalizations.of(context).getText(
                                            'es5c1onk' /* 15:00 */,
                                          ),
                                          FFLocalizations.of(context).getText(
                                            'e5b64031' /* 16:00 */,
                                          ),
                                          FFLocalizations.of(context).getText(
                                            '2cwm2i09' /* 17:00 */,
                                          ),
                                          FFLocalizations.of(context).getText(
                                            'ubxyzrmt' /* 18:00 */,
                                          ),
                                          FFLocalizations.of(context).getText(
                                            'nmavyv6i' /* 19:00 */,
                                          ),
                                          FFLocalizations.of(context).getText(
                                            'd4nag4k7' /* 20:00 */,
                                          )
                                        ],
                                        onChanged: (val) => setState(
                                            () => _model.dropDownValue2 = val),
                                        width: 180,
                                        height: 50,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.black,
                                            ),
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          'bzjilpfo' /* Время окончания */,
                                        ),
                                        fillColor: Colors.white,
                                        elevation: 2,
                                        borderColor: Colors.transparent,
                                        borderWidth: 0,
                                        borderRadius: 0,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            12, 4, 12, 4),
                                        hidesUnderline: true,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 16),
                    child: FFButtonWidget(
                      onPressed: () async {
                        if (_model.formKey.currentState == null ||
                            !_model.formKey.currentState!.validate()) {
                          return;
                        }

                        final calendarCreateData = createCalendarRecordData(
                          date: _model.calendarSelectedDay?.start,
                          startTime: _model.dropDownValue1,
                          endTime: _model.dropDownValue2,
                          available: true,
                          leader: parentColumnUsersRecord.reference,
                          eventId: _model.tokenController.text,
                        );
                        await CalendarRecord.collection
                            .doc()
                            .set(calendarCreateData);
                        await Future.delayed(
                            const Duration(milliseconds: 1000));
                        setState(() => _model.algoliaSearchResults = null);
                        await CalendarRecord.search(
                          term: _model.tokenController.text,
                        )
                            .then((r) => _model.algoliaSearchResults = r)
                            .onError(
                                (_, __) => _model.algoliaSearchResults = [])
                            .whenComplete(() => setState(() {}));

                        await FfApiCall.call(
                          email: _model.userNameController.text,
                          date: dateTimeFormat(
                            'd/M/y',
                            _model.calendarSelectedDay?.start,
                            locale: FFLocalizations.of(context).languageCode,
                          ),
                          timeStart: _model.dropDownValue1,
                          timeEnd: _model.dropDownValue2,
                          token: _model.tokenController.text,
                          uid: _model.algoliaSearchResults?.last!.reference.id,
                        );

                        context.pushNamed('AddDate');
                      },
                      text: FFLocalizations.of(context).getText(
                        '3ujjhek2' /* Добавить дату */,
                      ),
                      options: FFButtonOptions(
                        width: 270,
                        height: 50,
                        color: FlutterFlowTheme.of(context).primaryColor,
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle1.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                        elevation: 3,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
