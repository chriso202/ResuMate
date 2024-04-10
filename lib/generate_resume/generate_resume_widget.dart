import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'generate_resume_model.dart';
export 'generate_resume_model.dart';

class GenerateResumeWidget extends StatefulWidget {
  const GenerateResumeWidget({super.key});

  @override
  State<GenerateResumeWidget> createState() => _GenerateResumeWidgetState();
}

class _GenerateResumeWidgetState extends State<GenerateResumeWidget> {
  late GenerateResumeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GenerateResumeModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Club2Record>>(
      stream: queryClub2Record(
        queryBuilder: (club2Record) => club2Record.where(
          'owner',
          isEqualTo: currentUserUid,
        ),
        singleRecord: true,
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
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<Club2Record> generateResumeClub2RecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final generateResumeClub2Record =
            generateResumeClub2RecordList.isNotEmpty
                ? generateResumeClub2RecordList.first
                : null;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: StreamBuilder<List<SchoolInformationRecord>>(
                stream: querySchoolInformationRecord(
                  queryBuilder: (schoolInformationRecord) =>
                      schoolInformationRecord.where(
                    'owner',
                    isEqualTo: currentUserUid,
                  ),
                  singleRecord: true,
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    );
                  }
                  List<SchoolInformationRecord>
                      stackSchoolInformationRecordList = snapshot.data!;
                  // Return an empty Container when the item does not exist.
                  if (snapshot.data!.isEmpty) {
                    return Container();
                  }
                  final stackSchoolInformationRecord =
                      stackSchoolInformationRecordList.isNotEmpty
                          ? stackSchoolInformationRecordList.first
                          : null;
                  return Stack(
                    children: [
                      StreamBuilder<List<VolunteerRecord>>(
                        stream: queryVolunteerRecord(
                          queryBuilder: (volunteerRecord) =>
                              volunteerRecord.where(
                            'owner',
                            isEqualTo: currentUserUid,
                          ),
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<VolunteerRecord> stackVolunteerRecordList =
                              snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final stackVolunteerRecord =
                              stackVolunteerRecordList.isNotEmpty
                                  ? stackVolunteerRecordList.first
                                  : null;
                          return Stack(
                            children: [
                              StreamBuilder<List<Work1Record>>(
                                stream: queryWork1Record(
                                  queryBuilder: (work1Record) =>
                                      work1Record.where(
                                    'owner',
                                    isEqualTo: currentUserUid,
                                  ),
                                  singleRecord: true,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<Work1Record> stackWork1RecordList =
                                      snapshot.data!;
                                  // Return an empty Container when the item does not exist.
                                  if (snapshot.data!.isEmpty) {
                                    return Container();
                                  }
                                  final stackWork1Record =
                                      stackWork1RecordList.isNotEmpty
                                          ? stackWork1RecordList.first
                                          : null;
                                  return Stack(
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: StreamBuilder<List<Work2Record>>(
                                          stream: queryWork2Record(
                                            queryBuilder: (work2Record) =>
                                                work2Record.where(
                                              'owner',
                                              isEqualTo: currentUserUid,
                                            ),
                                            singleRecord: true,
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            List<Work2Record>
                                                listViewWork2RecordList =
                                                snapshot.data!;
                                            // Return an empty Container when the item does not exist.
                                            if (snapshot.data!.isEmpty) {
                                              return Container();
                                            }
                                            final listViewWork2Record =
                                                listViewWork2RecordList
                                                        .isNotEmpty
                                                    ? listViewWork2RecordList
                                                        .first
                                                    : null;
                                            return ListView(
                                              padding: EdgeInsets.zero,
                                              primary: false,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              children: [
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: StreamBuilder<
                                                      List<Club1Record>>(
                                                    stream: queryClub1Record(
                                                      queryBuilder:
                                                          (club1Record) =>
                                                              club1Record.where(
                                                        'owner',
                                                        isEqualTo:
                                                            currentUserUid,
                                                      ),
                                                      singleRecord: true,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                CircularProgressIndicator(
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<Club1Record>
                                                          buttonClub1RecordList =
                                                          snapshot.data!;
                                                      // Return an empty Container when the item does not exist.
                                                      if (snapshot
                                                          .data!.isEmpty) {
                                                        return Container();
                                                      }
                                                      final buttonClub1Record =
                                                          buttonClub1RecordList
                                                                  .isNotEmpty
                                                              ? buttonClub1RecordList
                                                                  .first
                                                              : null;
                                                      return FFButtonWidget(
                                                        onPressed: () async {
                                                          await actions.newPDF(
                                                            valueOrDefault<
                                                                String>(
                                                              valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.firstName,
                                                                  ''),
                                                              'WRONG',
                                                            ),
                                                            valueOrDefault<
                                                                String>(
                                                              valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.lastName,
                                                                  ''),
                                                              'WRONG',
                                                            ),
                                                            stackSchoolInformationRecord!
                                                                .name,
                                                            stackSchoolInformationRecord
                                                                .city,
                                                            stackSchoolInformationRecord
                                                                .state,
                                                            stackSchoolInformationRecord
                                                                .otherInfo,
                                                            buttonClub1Record!
                                                                .title,
                                                            buttonClub1Record
                                                                .startDate,
                                                            buttonClub1Record
                                                                .endDate,
                                                            buttonClub1Record
                                                                .otherInfo,
                                                            generateResumeClub2Record!
                                                                .title,
                                                            generateResumeClub2Record
                                                                .startDate,
                                                            generateResumeClub2Record
                                                                .endDate,
                                                            generateResumeClub2Record
                                                                .otherInfo,
                                                            stackWork1Record!
                                                                .title,
                                                            stackWork1Record
                                                                .startDate,
                                                            stackWork1Record
                                                                .endDate,
                                                            stackWork1Record
                                                                .otherInfo,
                                                            listViewWork2Record!
                                                                .title,
                                                            listViewWork2Record
                                                                .startDate,
                                                            listViewWork2Record
                                                                .endDate,
                                                            listViewWork2Record
                                                                .otherInfo,
                                                            stackVolunteerRecord!
                                                                .title,
                                                            stackVolunteerRecord
                                                                .hoursContributed,
                                                            stackVolunteerRecord
                                                                .otherInfo,
                                                          );
                                                        },
                                                        text:
                                                            'Generate Résumé!',
                                                        options:
                                                            FFButtonOptions(
                                                          width: 200.0,
                                                          height: 60.0,
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          iconPadding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Colors
                                                                        .white,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          elevation: 4.0,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      30.0),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      context.pushNamed(
                                                        'resumeShare',
                                                        extra: <String,
                                                            dynamic>{
                                                          kTransitionInfoKey:
                                                              const TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .scale,
                                                            alignment: Alignment
                                                                .bottomCenter,
                                                          ),
                                                        },
                                                      );
                                                    },
                                                    text: 'Share Rèsumè!',
                                                    options: FFButtonOptions(
                                                      width: 200.0,
                                                      height: 60.0,
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      iconPadding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: Colors
                                                                    .white,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      elevation: 4.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30.0),
                                                    ),
                                                  ),
                                                ),
                                              ].divide(const SizedBox(height: 8.0)),
                                            );
                                          },
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, -0.75),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.asset(
                                            'assets/images/ResuMateLogoHorizontal.png',
                                            width: 300.0,
                                            height: 200.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                              Align(
                                alignment: const AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 0.0, 16.0),
                                  child: FlutterFlowIconButton(
                                    buttonSize: 45.0,
                                    icon: Icon(
                                      Icons.arrow_back_ios,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      context.pushNamed('home');
                                    },
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
