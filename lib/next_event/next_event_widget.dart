import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextEventWidget extends StatefulWidget {
  const NextEventWidget({Key? key}) : super(key: key);

  @override
  _NextEventWidgetState createState() => _NextEventWidgetState();
}

class _NextEventWidgetState extends State<NextEventWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<MealRecord>>(
      stream: queryMealRecord(
        queryBuilder: (mealRecord) => mealRecord
            .where('host_ID', isEqualTo: currentUserReference)
            .where('time', isGreaterThan: getCurrentTimestamp)
            .orderBy('time'),
        singleRecord: true,
      ),
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
        List<MealRecord> nextEventMealRecordList = snapshot.data!;
        final nextEventMealRecord = nextEventMealRecordList.isNotEmpty
            ? nextEventMealRecordList.first
            : null;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryColor,
            automaticallyImplyLeading: false,
            title: Text(
              'My Next Hosting',
              style: FlutterFlowTheme.of(context).title2.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 22,
                  ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 2,
          ),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (!(nextEventMealRecord != null))
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Oh my, you\'re not organizing anything?',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ],
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              context.pushNamed('add_meal');
                            },
                            text: 'Create New Event',
                            options: FFButtonOptions(
                              width: 180,
                              height: 40,
                              color: FlutterFlowTheme.of(context).tertiaryColor,
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (nextEventMealRecord != null)
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Image.network(
                              nextEventMealRecord!.photoUrl != null &&
                                      nextEventMealRecord!.photoUrl != ''
                                  ? nextEventMealRecord!.photoUrl!
                                  : 'https://static01.nyt.com/images/2022/10/20/dining/20FALLBUDGET-ROUNDUP18/20FALLBUDGET-ROUNDUP18-threeByTwoMediumAt2X.jpg',
                              height: MediaQuery.of(context).size.height * 0.25,
                              fit: BoxFit.cover,
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                              child: Text(
                                nextEventMealRecord!.name!,
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 20,
                                    ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                              child: Text(
                                dateTimeFormat(
                                    'MMMMEEEEd', nextEventMealRecord!.time!),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontStyle: FontStyle.italic,
                                    ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                              child: Text(
                                'Currently ${nextEventMealRecord!.spotsTaken?.toString()} out of ${nextEventMealRecord!.capacity?.toString()} guests attending',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                            Text(
                              nextEventMealRecord!.description!,
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                              child: Text(
                                'Guest List',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                            StreamBuilder<List<AcceptanceRecord>>(
                              stream: queryAcceptanceRecord(
                                queryBuilder: (acceptanceRecord) =>
                                    acceptanceRecord.where('meal_ID',
                                        isEqualTo:
                                            nextEventMealRecord!.reference),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      ),
                                    ),
                                  );
                                }
                                List<AcceptanceRecord>
                                    listViewAcceptanceRecordList =
                                    snapshot.data!;
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount:
                                      listViewAcceptanceRecordList.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewAcceptanceRecord =
                                        listViewAcceptanceRecordList[
                                            listViewIndex];
                                    return StreamBuilder<UserRecord>(
                                      stream: UserRecord.getDocument(
                                          listViewAcceptanceRecord.clientID!),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50,
                                              height: 50,
                                              child: CircularProgressIndicator(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                              ),
                                            ),
                                          );
                                        }
                                        final textUserRecord = snapshot.data!;
                                        return Text(
                                          textUserRecord.displayName!,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
