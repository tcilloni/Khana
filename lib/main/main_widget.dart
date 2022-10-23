import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<AcceptanceRecord>>(
      stream: queryAcceptanceRecord(),
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
        List<AcceptanceRecord> mainAcceptanceRecordList = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryColor,
            automaticallyImplyLeading: false,
            title: Text(
              'Share Meals, Share Love',
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
              child: Stack(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(100, 15, 0, 20),
                        child: Container(
                          width: 150,
                          height: 30,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Stack(
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    60, 5, 20, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    AuthUserStreamWidget(
                                      child: Text(
                                        valueOrDefault(
                                                currentUserDocument?.balance, 0)
                                            .toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 0, 100, 0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    'https://www.pngkey.com/png/full/663-6634551_gold-coin-vector-png-clipart-gold-coin-clip.png',
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            context.pushNamed('add_meal');
                          },
                          text: '',
                          icon: Icon(
                            Icons.add_box_outlined,
                            color: FlutterFlowTheme.of(context).tertiaryColor,
                            size: 30,
                          ),
                          options: FFButtonOptions(
                            width: 60,
                            height: 40,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                    ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
                    child: StreamBuilder<List<MealRecord>>(
                      stream: queryMealRecord(
                        queryBuilder: (mealRecord) =>
                            mealRecord.orderBy('time'),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              ),
                            ),
                          );
                        }
                        List<MealRecord> listViewMealRecordList =
                            snapshot.data!;
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewMealRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewMealRecord =
                                listViewMealRecordList[listViewIndex];
                            return Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(5, 15, 5, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      listViewMealRecord.photoUrl != null &&
                                              listViewMealRecord.photoUrl != ''
                                          ? listViewMealRecord.photoUrl!
                                          : 'https://static01.nyt.com/images/2022/10/20/dining/20FALLBUDGET-ROUNDUP18/20FALLBUDGET-ROUNDUP18-threeByTwoMediumAt2X.jpg',
                                      width: 2000,
                                      height: 200,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        listViewMealRecord.name!,
                                        style:
                                            FlutterFlowTheme.of(context).title3,
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            '${listViewMealRecord.price?.toString()}',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              'https://www.pngkey.com/png/full/663-6634551_gold-coin-vector-png-clipart-gold-coin-clip.png',
                                              width: 20,
                                              height: 20,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        dateTimeFormat(
                                            'MMMEd', listViewMealRecord.time!),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontStyle: FontStyle.italic,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        listViewMealRecord.description!,
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 12,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        listViewMealRecord.location!,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        'assets/images/profile.png',
                                        width: 20,
                                        height: 20,
                                        fit: BoxFit.cover,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            'Attendees: ${valueOrDefault<String>(
                                              listViewMealRecord.spotsTaken
                                                  ?.toString(),
                                              '0',
                                            )} of ${valueOrDefault<String>(
                                              listViewMealRecord.capacity
                                                  ?.toString(),
                                              '5',
                                            )}',
                                            'Attendees: 0/1',
                                          ),
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      if (!functions.userAcceptedMeal(
                                          currentUserReference!,
                                          listViewMealRecord.reference,
                                          mainAcceptanceRecordList.toList()))
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 10, 0, 10),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              final acceptanceCreateData =
                                                  createAcceptanceRecordData(
                                                mealID: listViewMealRecord
                                                    .reference,
                                                clientID: currentUserReference,
                                              );
                                              await AcceptanceRecord.collection
                                                  .doc()
                                                  .set(acceptanceCreateData);

                                              final mealUpdateData = {
                                                'spots_taken':
                                                    FieldValue.increment(1),
                                              };
                                              await listViewMealRecord.reference
                                                  .update(mealUpdateData);

                                              final userUpdateData = {
                                                'balance': FieldValue.increment(
                                                    -(listViewMealRecord
                                                        .price!)),
                                              };
                                              await currentUserReference!
                                                  .update(userUpdateData);
                                            },
                                            text: 'Request',
                                            options: FFButtonOptions(
                                              width: 120,
                                              height: 30,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiaryColor,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                      ),
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                        ),
                                      if (functions.userAcceptedMeal(
                                          currentUserReference!,
                                          listViewMealRecord.reference,
                                          mainAcceptanceRecordList.toList()))
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 10, 0, 10),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              await functions
                                                  .getAcceptedMeal(
                                                      currentUserReference!,
                                                      listViewMealRecord
                                                          .reference,
                                                      mainAcceptanceRecordList
                                                          .toList())
                                                  .delete();

                                              final mealUpdateData = {
                                                'spots_taken':
                                                    FieldValue.increment(-(1)),
                                              };
                                              await listViewMealRecord.reference
                                                  .update(mealUpdateData);

                                              final userUpdateData = {
                                                'balance': FieldValue.increment(
                                                    listViewMealRecord.price!),
                                              };
                                              await currentUserReference!
                                                  .update(userUpdateData);
                                            },
                                            text: 'Cancel',
                                            options: FFButtonOptions(
                                              width: 120,
                                              height: 30,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                      ),
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
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
