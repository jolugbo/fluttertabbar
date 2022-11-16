//  Card(
//                                     elevation: 2,
//                                     shape: cardShape,
//                                     child: Container(
//                                       width: MediaQuery.of(context).size.width *
//                                           0.95,
//                                       //height: MediaQuery.of(context).size.height * 0.26,
//                                       alignment: Alignment.topLeft,
//                                       padding: EdgeInsets.all(10),
//                                       child: Column(
//                                         mainAxisSize: MainAxisSize.max,
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.start,
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.center,
//                                         children: <Widget>[
//                                           Container(
//                                             padding: EdgeInsets.fromLTRB(
//                                                 10, 10, 0, 0),
//                                             alignment: Alignment.topLeft,
//                                             child: Text(
//                                               'Become an Expert in Corporate Governance ',
//                                               style: blue14Style,
//                                             ),
//                                           ),
//                                           Container(
//                                               padding: EdgeInsets.fromLTRB(
//                                                   10, 5, 10, 10),
//                                               alignment: Alignment.topLeft,
//                                               child: Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceBetween,
//                                                 children: [
//                                                   Text(
//                                                     'Learn to govern companies',
//                                                     style: dark10Style,
//                                                   ),
//                                                   Text(
//                                                     'View more',
//                                                     style: green12Style,
//                                                   )
//                                                 ],
//                                               )),
//                                           Container(
//                                             child: CarouselSlider(
//                                               options: CarouselOptions(
//                                                 height: MediaQuery.of(context)
//                                                         .size
//                                                         .height *
//                                                     0.12,
//                                                 aspectRatio: 1,
//                                                 viewportFraction: 1,
//                                                 initialPage: 0,
//                                                 enableInfiniteScroll: true,
//                                                 reverse: false,
//                                                 autoPlay: false,
//                                                 autoPlayInterval:
//                                                     Duration(seconds: 4),
//                                                 autoPlayAnimationDuration:
//                                                     Duration(seconds: 1),
//                                                 autoPlayCurve:
//                                                     Curves.fastOutSlowIn,
//                                                 enlargeCenterPage: true,
//                                                 onPageChanged: (index, reason) {
//                                                   setState(() {
//                                                     //_current = index;
//                                                   });
//                                                 },
//                                                 scrollDirection:
//                                                     Axis.horizontal,
//                                               ),
//                                               items: [0, 1, 2].map((i) {
//                                                 return Builder(
//                                                   builder:
//                                                       (BuildContext context) {
//                                                     return Container(
//                                                       //width: MediaQuery.of(context).size.width * 0.8,
//                                                       padding:
//                                                           EdgeInsets.fromLTRB(
//                                                               10, 0, 10, 0),
//                                                       alignment:
//                                                           Alignment.center,
//                                                       color: accent,
//                                                       child: ListView(
//                                                         scrollDirection:
//                                                             Axis.horizontal,
//                                                         children: <Widget>[
//                                                           OpenContainer<bool>(
//                                                             transitionType:
//                                                                 _transitionType,
//                                                             openBuilder: (context,
//                                                                     openContainer) =>
//                                                                 const _DetailsCard(),
//                                                             tappable: false,
//                                                             closedShape:
//                                                                 const RoundedRectangleBorder(),
//                                                             closedElevation: 0,
//                                                             closedBuilder: (context,
//                                                                 openContainer) {
//                                                               return Column(
//                                                                   mainAxisSize:
//                                                                       MainAxisSize
//                                                                           .max,
//                                                                   mainAxisAlignment:
//                                                                       MainAxisAlignment
//                                                                           .center,
//                                                                   crossAxisAlignment:
//                                                                       CrossAxisAlignment
//                                                                           .center,
//                                                                   children: <
//                                                                       Widget>[
//                                                                     RawMaterialButton(
//                                                                       onPressed:
//                                                                           openContainer,
//                                                                       elevation:
//                                                                           2.0,
//                                                                       fillColor:
//                                                                           projectGray2,
//                                                                       child: Image
//                                                                           .asset(
//                                                                         advisory,
//                                                                         width:
//                                                                             30,
//                                                                         height:
//                                                                             30,
//                                                                       ),
//                                                                       padding:
//                                                                           EdgeInsets.all(
//                                                                               10.0),
//                                                                       shape: CircleBorder(
//                                                                           side:
//                                                                               BorderSide(color: projectGray2)),
//                                                                     ),
//                                                                     Container(
//                                                                         padding: EdgeInsets.fromLTRB(
//                                                                             5,
//                                                                             5,
//                                                                             5,
//                                                                             0),
//                                                                         alignment:
//                                                                             Alignment
//                                                                                 .center,
//                                                                         width:
//                                                                             120,
//                                                                         child:
//                                                                             Text(
//                                                                           'Advisory',
//                                                                           style:
//                                                                               dark12Style,
//                                                                           softWrap:
//                                                                               true,
//                                                                           textAlign:
//                                                                               TextAlign.center,
//                                                                         )),
//                                                                   ]);
//                                                             },
//                                                           ),
//                                                           OpenContainer<bool>(
//                                                             transitionType:
//                                                                 _transitionType,
//                                                             openBuilder: (context,
//                                                                     openContainer) =>
//                                                                 const _DetailsCard(),
//                                                             tappable: false,
//                                                             closedShape:
//                                                                 const RoundedRectangleBorder(),
//                                                             closedElevation: 0,
//                                                             closedBuilder: (context,
//                                                                 openContainer) {
//                                                               return Column(
//                                                                   mainAxisSize:
//                                                                       MainAxisSize
//                                                                           .max,
//                                                                   mainAxisAlignment:
//                                                                       MainAxisAlignment
//                                                                           .center,
//                                                                   crossAxisAlignment:
//                                                                       CrossAxisAlignment
//                                                                           .center,
//                                                                   children: <
//                                                                       Widget>[
//                                                                     RawMaterialButton(
//                                                                       onPressed:
//                                                                           openContainer,
//                                                                       elevation:
//                                                                           2.0,
//                                                                       fillColor:
//                                                                           projectGray2,
//                                                                       child: Image
//                                                                           .asset(
//                                                                         assetManagement,
//                                                                         width:
//                                                                             30,
//                                                                         height:
//                                                                             30,
//                                                                       ),
//                                                                       padding:
//                                                                           EdgeInsets.all(
//                                                                               10.0),
//                                                                       shape: CircleBorder(
//                                                                           side:
//                                                                               BorderSide(color: projectGray2)),
//                                                                     ),
//                                                                     Container(
//                                                                         padding: EdgeInsets.fromLTRB(
//                                                                             5,
//                                                                             5,
//                                                                             5,
//                                                                             0),
//                                                                         alignment:
//                                                                             Alignment
//                                                                                 .center,
//                                                                         width:
//                                                                             120,
//                                                                         child:
//                                                                             Text(
//                                                                           'Asset Management',
//                                                                           style:
//                                                                               dark12Style,
//                                                                           softWrap:
//                                                                               true,
//                                                                           textAlign:
//                                                                               TextAlign.center,
//                                                                         )),
//                                                                   ]);
//                                                             },
//                                                           ),
//                                                           OpenContainer<bool>(
//                                                             transitionType:
//                                                                 _transitionType,
//                                                             openBuilder: (context,
//                                                                     openContainer) =>
//                                                                 const _DetailsCard(),
//                                                             tappable: false,
//                                                             closedShape:
//                                                                 const RoundedRectangleBorder(),
//                                                             closedElevation: 0,
//                                                             closedBuilder: (context,
//                                                                 openContainer) {
//                                                               return Column(
//                                                                   mainAxisSize:
//                                                                       MainAxisSize
//                                                                           .max,
//                                                                   mainAxisAlignment:
//                                                                       MainAxisAlignment
//                                                                           .center,
//                                                                   crossAxisAlignment:
//                                                                       CrossAxisAlignment
//                                                                           .center,
//                                                                   children: <
//                                                                       Widget>[
//                                                                     RawMaterialButton(
//                                                                       onPressed:
//                                                                           openContainer,
//                                                                       elevation:
//                                                                           2.0,
//                                                                       fillColor:
//                                                                           projectGray2,
//                                                                       child: Image
//                                                                           .asset(
//                                                                         capitalMarket,
//                                                                         width:
//                                                                             30,
//                                                                       ), //,backgroundColor: Colors.green,
//                                                                       padding:
//                                                                           EdgeInsets.all(
//                                                                               10.0),
//                                                                       shape: CircleBorder(
//                                                                           side:
//                                                                               BorderSide(color: projectGray2)),
//                                                                     ),
//                                                                     Container(
//                                                                         padding: EdgeInsets.fromLTRB(
//                                                                             5,
//                                                                             5,
//                                                                             5,
//                                                                             0),
//                                                                         alignment:
//                                                                             Alignment
//                                                                                 .center,
//                                                                         width:
//                                                                             120,
//                                                                         child:
//                                                                             Text(
//                                                                           'Capital Market',
//                                                                           style:
//                                                                               dark12Style,
//                                                                           softWrap:
//                                                                               true,
//                                                                           textAlign:
//                                                                               TextAlign.center,
//                                                                         )),
//                                                                   ]);
//                                                             },
//                                                           ),
//                                                           OpenContainer<bool>(
//                                                             transitionType:
//                                                                 _transitionType,
//                                                             openBuilder: (context,
//                                                                     openContainer) =>
//                                                                 const _DetailsCard(),
//                                                             tappable: false,
//                                                             closedShape:
//                                                                 const RoundedRectangleBorder(),
//                                                             closedElevation: 0,
//                                                             closedBuilder: (context,
//                                                                 openContainer) {
//                                                               return Column(
//                                                                   mainAxisSize:
//                                                                       MainAxisSize
//                                                                           .max,
//                                                                   mainAxisAlignment:
//                                                                       MainAxisAlignment
//                                                                           .center,
//                                                                   crossAxisAlignment:
//                                                                       CrossAxisAlignment
//                                                                           .center,
//                                                                   children: <
//                                                                       Widget>[
//                                                                     RawMaterialButton(
//                                                                       onPressed:
//                                                                           openContainer,
//                                                                       elevation:
//                                                                           2.0,
//                                                                       fillColor:
//                                                                           projectGray2,
//                                                                       child: Image
//                                                                           .asset(
//                                                                         trading,
//                                                                         width:
//                                                                             30,
//                                                                       ), //,backgroundColor: Colors.green,
//                                                                       padding:
//                                                                           EdgeInsets.all(
//                                                                               10.0),
//                                                                       shape: CircleBorder(
//                                                                           side:
//                                                                               BorderSide(color: projectGray2)),
//                                                                     ),
//                                                                     Container(
//                                                                         padding: EdgeInsets.fromLTRB(
//                                                                             5,
//                                                                             5,
//                                                                             5,
//                                                                             0),
//                                                                         alignment:
//                                                                             Alignment
//                                                                                 .center,
//                                                                         width:
//                                                                             120,
//                                                                         child:
//                                                                             Text(
//                                                                           'Trading',
//                                                                           style:
//                                                                               dark12Style,
//                                                                           softWrap:
//                                                                               true,
//                                                                           textAlign:
//                                                                               TextAlign.center,
//                                                                         )),
//                                                                   ]);
//                                                             },
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     );
//                                                   },
//                                                 );
//                                               }).toList(),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
                                 

//                                    Card(
//                                     elevation: 2,
//                                     shape: cardShape,
//                                     child: Container(
//                                       width: MediaQuery.of(context).size.width *
//                                           0.95,
//                                       //height: MediaQuery.of(context).size.height * 0.26,
//                                       alignment: Alignment.topLeft,
//                                       padding: EdgeInsets.all(10),
//                                       child: Column(
//                                         mainAxisSize: MainAxisSize.max,
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.start,
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.center,
//                                         children: <Widget>[
//                                           Container(
//                                             padding: EdgeInsets.fromLTRB(
//                                                 10, 10, 10, 0),
//                                             alignment: Alignment.topLeft,
//                                             child: Text(
//                                               'Obtain Knowledge of Accounting',
//                                               style: blue14Style,
//                                             ),
//                                           ),
//                                           Container(
//                                               padding: EdgeInsets.fromLTRB(
//                                                   10, 5, 10, 10),
//                                               alignment: Alignment.topLeft,
//                                               child: Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceBetween,
//                                                 children: [
//                                                   Text(
//                                                     'Accounting simplified',
//                                                     style: dark10Style,
//                                                   ),
//                                                   Text(
//                                                     'View more',
//                                                     style: green12Style,
//                                                   )
//                                                 ],
//                                               )),
//                                           Container(
//                                             child: CarouselSlider(
//                                               options: CarouselOptions(
//                                                 height: MediaQuery.of(context)
//                                                         .size
//                                                         .height *
//                                                     0.12,
//                                                 aspectRatio: 1,
//                                                 viewportFraction: 1,
//                                                 initialPage: 0,
//                                                 enableInfiniteScroll: true,
//                                                 reverse: false,
//                                                 autoPlay: false,
//                                                 autoPlayInterval:
//                                                     Duration(seconds: 4),
//                                                 autoPlayAnimationDuration:
//                                                     Duration(seconds: 1),
//                                                 autoPlayCurve:
//                                                     Curves.fastOutSlowIn,
//                                                 enlargeCenterPage: true,
//                                                 onPageChanged: (index, reason) {
//                                                   setState(() {
//                                                     //_current = index;
//                                                   });
//                                                 },
//                                                 scrollDirection:
//                                                     Axis.horizontal,
//                                               ),
//                                               items: [0, 1, 2].map((i) {
//                                                 return Builder(
//                                                   builder:
//                                                       (BuildContext context) {
//                                                     return Container(
//                                                       //width: MediaQuery.of(context).size.width * 0.8,
//                                                       padding:
//                                                           EdgeInsets.fromLTRB(
//                                                               10, 0, 10, 0),
//                                                       alignment:
//                                                           Alignment.center,
//                                                       color: accent,
//                                                       child: ListView(
//                                                         scrollDirection:
//                                                             Axis.horizontal,
//                                                         children: <Widget>[
//                                                           OpenContainer<bool>(
//                                                             transitionType:
//                                                                 _transitionType,
//                                                             openBuilder: (context,
//                                                                     openContainer) =>
//                                                                 const _DetailsCard(),
//                                                             tappable: false,
//                                                             closedShape:
//                                                                 const RoundedRectangleBorder(),
//                                                             closedElevation: 0,
//                                                             closedBuilder: (context,
//                                                                 openContainer) {
//                                                               return Column(
//                                                                   mainAxisSize:
//                                                                       MainAxisSize
//                                                                           .max,
//                                                                   mainAxisAlignment:
//                                                                       MainAxisAlignment
//                                                                           .center,
//                                                                   crossAxisAlignment:
//                                                                       CrossAxisAlignment
//                                                                           .center,
//                                                                   children: <
//                                                                       Widget>[
//                                                                     RawMaterialButton(
//                                                                       onPressed:
//                                                                           openContainer,
//                                                                       elevation:
//                                                                           2.0,
//                                                                       fillColor:
//                                                                           projectGray2,
//                                                                       child: Image
//                                                                           .asset(
//                                                                         advisory,
//                                                                         width:
//                                                                             30,
//                                                                         height:
//                                                                             30,
//                                                                       ),
//                                                                       padding:
//                                                                           EdgeInsets.all(
//                                                                               10.0),
//                                                                       shape: CircleBorder(
//                                                                           side:
//                                                                               BorderSide(color: projectGray2)),
//                                                                     ),
//                                                                     Container(
//                                                                         padding: EdgeInsets.fromLTRB(
//                                                                             5,
//                                                                             5,
//                                                                             5,
//                                                                             0),
//                                                                         alignment:
//                                                                             Alignment
//                                                                                 .center,
//                                                                         width:
//                                                                             120,
//                                                                         child:
//                                                                             Text(
//                                                                           'Advisory',
//                                                                           style:
//                                                                               dark12Style,
//                                                                           softWrap:
//                                                                               true,
//                                                                           textAlign:
//                                                                               TextAlign.center,
//                                                                         )),
//                                                                   ]);
//                                                             },
//                                                           ),
//                                                           OpenContainer<bool>(
//                                                             transitionType:
//                                                                 _transitionType,
//                                                             openBuilder: (context,
//                                                                     openContainer) =>
//                                                                 const _DetailsCard(),
//                                                             tappable: false,
//                                                             closedShape:
//                                                                 const RoundedRectangleBorder(),
//                                                             closedElevation: 0,
//                                                             closedBuilder: (context,
//                                                                 openContainer) {
//                                                               return Column(
//                                                                   mainAxisSize:
//                                                                       MainAxisSize
//                                                                           .max,
//                                                                   mainAxisAlignment:
//                                                                       MainAxisAlignment
//                                                                           .center,
//                                                                   crossAxisAlignment:
//                                                                       CrossAxisAlignment
//                                                                           .center,
//                                                                   children: <
//                                                                       Widget>[
//                                                                     RawMaterialButton(
//                                                                       onPressed:
//                                                                           openContainer,
//                                                                       elevation:
//                                                                           2.0,
//                                                                       fillColor:
//                                                                           projectGray2,
//                                                                       child: Image
//                                                                           .asset(
//                                                                         assetManagement,
//                                                                         width:
//                                                                             30,
//                                                                         height:
//                                                                             30,
//                                                                       ),
//                                                                       padding:
//                                                                           EdgeInsets.all(
//                                                                               10.0),
//                                                                       shape: CircleBorder(
//                                                                           side:
//                                                                               BorderSide(color: projectGray2)),
//                                                                     ),
//                                                                     Container(
//                                                                         padding: EdgeInsets.fromLTRB(
//                                                                             5,
//                                                                             5,
//                                                                             5,
//                                                                             0),
//                                                                         alignment:
//                                                                             Alignment
//                                                                                 .center,
//                                                                         width:
//                                                                             120,
//                                                                         child:
//                                                                             Text(
//                                                                           'Asset Management',
//                                                                           style:
//                                                                               dark12Style,
//                                                                           softWrap:
//                                                                               true,
//                                                                           textAlign:
//                                                                               TextAlign.center,
//                                                                         )),
//                                                                   ]);
//                                                             },
//                                                           ),
//                                                           OpenContainer<bool>(
//                                                             transitionType:
//                                                                 _transitionType,
//                                                             openBuilder: (context,
//                                                                     openContainer) =>
//                                                                 const _DetailsCard(),
//                                                             tappable: false,
//                                                             closedShape:
//                                                                 const RoundedRectangleBorder(),
//                                                             closedElevation: 0,
//                                                             closedBuilder: (context,
//                                                                 openContainer) {
//                                                               return Column(
//                                                                   mainAxisSize:
//                                                                       MainAxisSize
//                                                                           .max,
//                                                                   mainAxisAlignment:
//                                                                       MainAxisAlignment
//                                                                           .center,
//                                                                   crossAxisAlignment:
//                                                                       CrossAxisAlignment
//                                                                           .center,
//                                                                   children: <
//                                                                       Widget>[
//                                                                     RawMaterialButton(
//                                                                       onPressed:
//                                                                           openContainer,
//                                                                       elevation:
//                                                                           2.0,
//                                                                       fillColor:
//                                                                           projectGray2,
//                                                                       child: Image
//                                                                           .asset(
//                                                                         capitalMarket,
//                                                                         width:
//                                                                             30,
//                                                                       ), //,backgroundColor: Colors.green,
//                                                                       padding:
//                                                                           EdgeInsets.all(
//                                                                               10.0),
//                                                                       shape: CircleBorder(
//                                                                           side:
//                                                                               BorderSide(color: projectGray2)),
//                                                                     ),
//                                                                     Container(
//                                                                         padding: EdgeInsets.fromLTRB(
//                                                                             5,
//                                                                             5,
//                                                                             5,
//                                                                             0),
//                                                                         alignment:
//                                                                             Alignment
//                                                                                 .center,
//                                                                         width:
//                                                                             120,
//                                                                         child:
//                                                                             Text(
//                                                                           'Capital Market',
//                                                                           style:
//                                                                               dark12Style,
//                                                                           softWrap:
//                                                                               true,
//                                                                           textAlign:
//                                                                               TextAlign.center,
//                                                                         )),
//                                                                   ]);
//                                                             },
//                                                           ),
//                                                           OpenContainer<bool>(
//                                                             transitionType:
//                                                                 _transitionType,
//                                                             openBuilder: (context,
//                                                                     openContainer) =>
//                                                                 const _DetailsCard(),
//                                                             tappable: false,
//                                                             closedShape:
//                                                                 const RoundedRectangleBorder(),
//                                                             closedElevation: 0,
//                                                             closedBuilder: (context,
//                                                                 openContainer) {
//                                                               return Column(
//                                                                   mainAxisSize:
//                                                                       MainAxisSize
//                                                                           .max,
//                                                                   mainAxisAlignment:
//                                                                       MainAxisAlignment
//                                                                           .center,
//                                                                   crossAxisAlignment:
//                                                                       CrossAxisAlignment
//                                                                           .center,
//                                                                   children: <
//                                                                       Widget>[
//                                                                     RawMaterialButton(
//                                                                       onPressed:
//                                                                           openContainer,
//                                                                       elevation:
//                                                                           2.0,
//                                                                       fillColor:
//                                                                           projectGray2,
//                                                                       child: Image
//                                                                           .asset(
//                                                                         trading,
//                                                                         width:
//                                                                             30,
//                                                                       ), //,backgroundColor: Colors.green,
//                                                                       padding:
//                                                                           EdgeInsets.all(
//                                                                               10.0),
//                                                                       shape: CircleBorder(
//                                                                           side:
//                                                                               BorderSide(color: projectGray2)),
//                                                                     ),
//                                                                     Container(
//                                                                         padding: EdgeInsets.fromLTRB(
//                                                                             5,
//                                                                             5,
//                                                                             5,
//                                                                             0),
//                                                                         alignment:
//                                                                             Alignment
//                                                                                 .center,
//                                                                         width:
//                                                                             120,
//                                                                         child:
//                                                                             Text(
//                                                                           'Trading',
//                                                                           style:
//                                                                               dark12Style,
//                                                                           softWrap:
//                                                                               true,
//                                                                           textAlign:
//                                                                               TextAlign.center,
//                                                                         )),
//                                                                   ]);
//                                                             },
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     );
//                                                   },
//                                                 );
//                                               }).toList(),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                   Container(
//                                     height: 30,
//                                   ),
//                                   Card(
//                                     elevation: 2,
//                                     shape: cardShape,
//                                     child: Container(
//                                       width: MediaQuery.of(context).size.width *
//                                           0.95,
//                                       //height: MediaQuery.of(context).size.height * 0.26,
//                                       alignment: Alignment.topLeft,
//                                       padding: EdgeInsets.all(10),
//                                       child: Column(
//                                         mainAxisSize: MainAxisSize.max,
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.start,
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.center,
//                                         children: <Widget>[
//                                           Container(
//                                             padding: EdgeInsets.fromLTRB(
//                                                 10, 10, 10, 0),
//                                             alignment: Alignment.topLeft,
//                                             child: Text(
//                                               'Understanding Micro and Macro Economics',
//                                               style: blue14Style,
//                                             ),
//                                           ),
//                                           Container(
//                                               padding: EdgeInsets.fromLTRB(
//                                                   10, 5, 10, 10),
//                                               alignment: Alignment.topLeft,
//                                               child: Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceBetween,
//                                                 children: [
//                                                   Text(
//                                                     'Learn effects of supply and demand',
//                                                     style: dark10Style,
//                                                   ),
//                                                   Text(
//                                                     'View more',
//                                                     style: green12Style,
//                                                   )
//                                                 ],
//                                               )),
//                                           Container(
//                                             child: CarouselSlider(
//                                               options: CarouselOptions(
//                                                 height: MediaQuery.of(context)
//                                                         .size
//                                                         .height *
//                                                     0.12,
//                                                 aspectRatio: 1,
//                                                 viewportFraction: 1,
//                                                 initialPage: 0,
//                                                 enableInfiniteScroll: true,
//                                                 reverse: false,
//                                                 autoPlay: false,
//                                                 autoPlayInterval:
//                                                     Duration(seconds: 4),
//                                                 autoPlayAnimationDuration:
//                                                     Duration(seconds: 1),
//                                                 autoPlayCurve:
//                                                     Curves.fastOutSlowIn,
//                                                 enlargeCenterPage: true,
//                                                 onPageChanged: (index, reason) {
//                                                   setState(() {
//                                                     //_current = index;
//                                                   });
//                                                 },
//                                                 scrollDirection:
//                                                     Axis.horizontal,
//                                               ),
//                                               items: [0, 1, 2].map((i) {
//                                                 return Builder(
//                                                   builder:
//                                                       (BuildContext context) {
//                                                     return Container(
//                                                       //width: MediaQuery.of(context).size.width * 0.8,
//                                                       padding:
//                                                           EdgeInsets.fromLTRB(
//                                                               10, 0, 10, 0),
//                                                       alignment:
//                                                           Alignment.center,
//                                                       color: accent,
//                                                       child: ListView(
//                                                         scrollDirection:
//                                                             Axis.horizontal,
//                                                         children: <Widget>[
//                                                           OpenContainer<bool>(
//                                                             transitionType:
//                                                                 _transitionType,
//                                                             openBuilder: (context,
//                                                                     openContainer) =>
//                                                                 const _DetailsCard(),
//                                                             tappable: false,
//                                                             closedShape:
//                                                                 const RoundedRectangleBorder(),
//                                                             closedElevation: 0,
//                                                             closedBuilder: (context,
//                                                                 openContainer) {
//                                                               return Column(
//                                                                   mainAxisSize:
//                                                                       MainAxisSize
//                                                                           .max,
//                                                                   mainAxisAlignment:
//                                                                       MainAxisAlignment
//                                                                           .center,
//                                                                   crossAxisAlignment:
//                                                                       CrossAxisAlignment
//                                                                           .center,
//                                                                   children: <
//                                                                       Widget>[
//                                                                     RawMaterialButton(
//                                                                       onPressed:
//                                                                           openContainer,
//                                                                       elevation:
//                                                                           2.0,
//                                                                       fillColor:
//                                                                           projectGray2,
//                                                                       child: Image
//                                                                           .asset(
//                                                                         advisory,
//                                                                         width:
//                                                                             30,
//                                                                         height:
//                                                                             30,
//                                                                       ),
//                                                                       padding:
//                                                                           EdgeInsets.all(
//                                                                               10.0),
//                                                                       shape: CircleBorder(
//                                                                           side:
//                                                                               BorderSide(color: projectGray2)),
//                                                                     ),
//                                                                     Container(
//                                                                         padding: EdgeInsets.fromLTRB(
//                                                                             5,
//                                                                             5,
//                                                                             5,
//                                                                             0),
//                                                                         alignment:
//                                                                             Alignment
//                                                                                 .center,
//                                                                         width:
//                                                                             120,
//                                                                         child:
//                                                                             Text(
//                                                                           'Advisory',
//                                                                           style:
//                                                                               dark12Style,
//                                                                           softWrap:
//                                                                               true,
//                                                                           textAlign:
//                                                                               TextAlign.center,
//                                                                         )),
//                                                                   ]);
//                                                             },
//                                                           ),
//                                                           OpenContainer<bool>(
//                                                             transitionType:
//                                                                 _transitionType,
//                                                             openBuilder: (context,
//                                                                     openContainer) =>
//                                                                 const _DetailsCard(),
//                                                             tappable: false,
//                                                             closedShape:
//                                                                 const RoundedRectangleBorder(),
//                                                             closedElevation: 0,
//                                                             closedBuilder: (context,
//                                                                 openContainer) {
//                                                               return Column(
//                                                                   mainAxisSize:
//                                                                       MainAxisSize
//                                                                           .max,
//                                                                   mainAxisAlignment:
//                                                                       MainAxisAlignment
//                                                                           .center,
//                                                                   crossAxisAlignment:
//                                                                       CrossAxisAlignment
//                                                                           .center,
//                                                                   children: <
//                                                                       Widget>[
//                                                                     RawMaterialButton(
//                                                                       onPressed:
//                                                                           openContainer,
//                                                                       elevation:
//                                                                           2.0,
//                                                                       fillColor:
//                                                                           projectGray2,
//                                                                       child: Image
//                                                                           .asset(
//                                                                         assetManagement,
//                                                                         width:
//                                                                             30,
//                                                                         height:
//                                                                             30,
//                                                                       ),
//                                                                       padding:
//                                                                           EdgeInsets.all(
//                                                                               10.0),
//                                                                       shape: CircleBorder(
//                                                                           side:
//                                                                               BorderSide(color: projectGray2)),
//                                                                     ),
//                                                                     Container(
//                                                                         padding: EdgeInsets.fromLTRB(
//                                                                             5,
//                                                                             5,
//                                                                             5,
//                                                                             0),
//                                                                         alignment:
//                                                                             Alignment
//                                                                                 .center,
//                                                                         width:
//                                                                             120,
//                                                                         child:
//                                                                             Text(
//                                                                           'Asset Management',
//                                                                           style:
//                                                                               dark12Style,
//                                                                           softWrap:
//                                                                               true,
//                                                                           textAlign:
//                                                                               TextAlign.center,
//                                                                         )),
//                                                                   ]);
//                                                             },
//                                                           ),
//                                                           OpenContainer<bool>(
//                                                             transitionType:
//                                                                 _transitionType,
//                                                             openBuilder: (context,
//                                                                     openContainer) =>
//                                                                 const _DetailsCard(),
//                                                             tappable: false,
//                                                             closedShape:
//                                                                 const RoundedRectangleBorder(),
//                                                             closedElevation: 0,
//                                                             closedBuilder: (context,
//                                                                 openContainer) {
//                                                               return Column(
//                                                                   mainAxisSize:
//                                                                       MainAxisSize
//                                                                           .max,
//                                                                   mainAxisAlignment:
//                                                                       MainAxisAlignment
//                                                                           .center,
//                                                                   crossAxisAlignment:
//                                                                       CrossAxisAlignment
//                                                                           .center,
//                                                                   children: <
//                                                                       Widget>[
//                                                                     RawMaterialButton(
//                                                                       onPressed:
//                                                                           openContainer,
//                                                                       elevation:
//                                                                           2.0,
//                                                                       fillColor:
//                                                                           projectGray2,
//                                                                       child: Image
//                                                                           .asset(
//                                                                         capitalMarket,
//                                                                         width:
//                                                                             30,
//                                                                       ), //,backgroundColor: Colors.green,
//                                                                       padding:
//                                                                           EdgeInsets.all(
//                                                                               10.0),
//                                                                       shape: CircleBorder(
//                                                                           side:
//                                                                               BorderSide(color: projectGray2)),
//                                                                     ),
//                                                                     Container(
//                                                                         padding: EdgeInsets.fromLTRB(
//                                                                             5,
//                                                                             5,
//                                                                             5,
//                                                                             0),
//                                                                         alignment:
//                                                                             Alignment
//                                                                                 .center,
//                                                                         width:
//                                                                             120,
//                                                                         child:
//                                                                             Text(
//                                                                           'Capital Market',
//                                                                           style:
//                                                                               dark12Style,
//                                                                           softWrap:
//                                                                               true,
//                                                                           textAlign:
//                                                                               TextAlign.center,
//                                                                         )),
//                                                                   ]);
//                                                             },
//                                                           ),
//                                                           OpenContainer<bool>(
//                                                             transitionType:
//                                                                 _transitionType,
//                                                             openBuilder: (context,
//                                                                     openContainer) =>
//                                                                 const _DetailsCard(),
//                                                             tappable: false,
//                                                             closedShape:
//                                                                 const RoundedRectangleBorder(),
//                                                             closedElevation: 0,
//                                                             closedBuilder: (context,
//                                                                 openContainer) {
//                                                               return Column(
//                                                                   mainAxisSize:
//                                                                       MainAxisSize
//                                                                           .max,
//                                                                   mainAxisAlignment:
//                                                                       MainAxisAlignment
//                                                                           .center,
//                                                                   crossAxisAlignment:
//                                                                       CrossAxisAlignment
//                                                                           .center,
//                                                                   children: <
//                                                                       Widget>[
//                                                                     RawMaterialButton(
//                                                                       onPressed:
//                                                                           openContainer,
//                                                                       elevation:
//                                                                           2.0,
//                                                                       fillColor:
//                                                                           projectGray2,
//                                                                       child: Image
//                                                                           .asset(
//                                                                         trading,
//                                                                         width:
//                                                                             30,
//                                                                       ), //,backgroundColor: Colors.green,
//                                                                       padding:
//                                                                           EdgeInsets.all(
//                                                                               10.0),
//                                                                       shape: CircleBorder(
//                                                                           side:
//                                                                               BorderSide(color: projectGray2)),
//                                                                     ),
//                                                                     Container(
//                                                                         padding: EdgeInsets.fromLTRB(
//                                                                             5,
//                                                                             5,
//                                                                             5,
//                                                                             0),
//                                                                         alignment:
//                                                                             Alignment
//                                                                                 .center,
//                                                                         width:
//                                                                             120,
//                                                                         child:
//                                                                             Text(
//                                                                           'Trading',
//                                                                           style:
//                                                                               dark12Style,
//                                                                           softWrap:
//                                                                               true,
//                                                                           textAlign:
//                                                                               TextAlign.center,
//                                                                         )),
//                                                                   ]);
//                                                             },
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     );
//                                                   },
//                                                 );
//                                               }).toList(),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                   Container(
//                                     height: 100,
//                                   ),