import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:edurald/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geocoder/model.dart';
import 'package:country_codes/country_codes.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:edurald/models/model_status.dart';
import 'package:edurald/models/strings.dart';
import 'package:edurald/utills/input_util.dart';
import 'package:edurald/utills/styles.dart';
import 'package:geolocator/geolocator.dart';
import 'package:edurald/validations/registration_validation.dart';
import 'package:connectivity/connectivity.dart';
import 'package:image_picker/image_picker.dart';
import '../../gen/assets.gen.dart';
import '../../main.dart';
import '../../utills/imageanimations.dart';
import 'package:firebase_database/firebase_database.dart';
// final userRef =  FirebaseFirestore.instance.collection('users');

class registration_formPage extends StatefulWidget {
  registration_formPage({Key? key,  this.user}) : super(key: key);

  final User? user;

  @override
  _Registration_formPageState createState() => _Registration_formPageState();
}

class _Registration_formPageState extends State<registration_formPage>
    with TickerProviderStateMixin {
  //String placeholderImage = imageBase+'graduatehat.jpg';
  String userIcon = 'https://firebasestorage.googleapis.com/v0/b/edurald.appspot.com/o/permanents%2Fgraduatehat.jpg?alt=media&token=fa45072d-2ecf-45ef-b225-b6199edf89c7';
  File _image = File(imageBase+'graduatehat.jpg');
  final picker = ImagePicker();
  int blurrySize = 0;
  double socialAuthsLocation = 0.75;
  final int _numPages = 3;
  bool next = true;
  String initialCountry = "";
  bool enableEmail = true;
  bool isFirstView = true;
  bool _passwordVisible = false;
  int _currentPage = 0;
  int _current = 0;
  bool  isSignUpComplete = false;
  bool  showLoader = false;
  String? phoneNumber = '';
  bool emailIsValid = false;
  bool userNameIsValid = false;
  bool firstNameIsValid = false;
  bool lastNameIsValid = false;
  bool phoneNumberIsValid = false;
  bool passwordIsValid = false;
  EmailStatus emailStatus = EmailStatus.success;
  FirstNameStatus firstNameStatus = FirstNameStatus.success;
  LastNameStatus lastNameStatus = LastNameStatus.success;
  UserNameStatus userNameStatus = UserNameStatus.success;
  PhoneNumberStatus phoneNumberStatus = PhoneNumberStatus.success;
  PasswordValidationResp passwordValidationResp = PasswordValidationResp(0, '');
  PasswordStatus passwordStatus = PasswordStatus.success;
  TextEditingController phoneNoController = new TextEditingController();
  TextEditingController userNameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController firstNameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  String countryCode = '';
  PhoneNumber? initialnumber;
  DateTime timeStamp = DateTime.now();
  late UserCredential user;
  void showPopUp(String msg){
    Fluttertoast.showToast(
        msg:msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  Future<void> getLocation() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high,);
    await CountryCodes.init();
    final coordinates = new Coordinates(position.latitude, position.longitude);
    var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    initialCountry = first.countryCode;
    setState(() {
      countryCode = first.countryCode;
      initialnumber = PhoneNumber(isoCode: countryCode);
    });
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
      height: 8.0,
      width: isActive ? 24.0 : 10.0,
      decoration: BoxDecoration(
        color: isActive ? projectDark : Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    getLocation();
  }

  Future<void> registerUser() async {
    if(!showLoader){
      setState(() {
        blurrySize = 1;
        showLoader = true;
      });
      await createUser();
      setState(() {
        blurrySize = 0;
        showLoader = false;
      });
    }
  }


  Future<void> updateUserRecords() async {
    if(!showLoader){
      setState(() {
        blurrySize = 1;
        showLoader = true;
      });
      await user.user?.updateDisplayName(userNameController.text);
      saveUserToFirestore(user.user);
      //await user?.updatePhotoURL("https://example.com/jane-q-user/profile.jpg");
      setState(() {
        next = !next;
        blurrySize = 0;
        showLoader = false;
      });
    }
  }

  validatePhoneNumber() async{
    setState(() {
      socialAuthsLocation = 1;
      showLoader = true;
    });
    print(user.user?.providerData);
    await user.user?.updateDisplayName(userNameController.text);
    print(FirebaseAuth.instance.currentUser?.providerData);
  }

  createUser() async{
    try{
      final response = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text,password: passwordController.text);
      user = response;
      await user.user?.sendEmailVerification();
      showMyDialog(context,"Account Verification",account_verification_msg);
      setState((){
        socialAuthsLocation = 1;
        //next = !next;
        isFirstView = false;
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {

        _current = --_current % 3;
        showPopUp('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        _current = --_current % 3;
        showPopUp('An account already exists for that email.');
      }
    } catch (e) {
      _current = --_current % 3;
      print(e);
    }


    // var userArgs = ModalRoute.of(context)!.settings.arguments as User;
    // User user = new User(
    //   bio: "",
    //   displayName: userNameController.text,
    //   email: emailController.text,
    //   firstName: firstNameController.text,
    //   lastName: lastNameController.text,
    //   phoneNumber: phoneNoController.text,
    //   photoUrl: userArgs.photoUrl
    // );
    // //DocumentSnapshot doc = await userRef.doc(user.email).get();
    //
    // if(!doc.exists){
    //
    //   userRef.doc(user.id).set({
    //     "id": user.id,
    //     "phoneNumber": user.phoneNumber,
    //     "photoUrl": user.photoUrl,
    //     "email": user.email,
    //     "displayName": user.displayName,
    //     "bio": "",
    //     "timeStamp": timeStamp
    //   });
    //   await followersRef.doc(user.id)
    //       .collection("userFollowers")
    //       .doc(user.id)
    //       .set({});
    //   doc = await userRef.doc(user.id).get();
    // }
    // currentUser = User.fromDocument(doc);
  }

  saveUserToFirestore(user) {
    userRef.doc(user.uid).set({
      "profile":{
        "firstName": firstNameController.text,
        "lastName": lastNameController.text,
        "point": 30,
        "socialMedia":{},
        "communities":{},
        "training": {},
        "bookmarks": {},
        "ratings":0,
        "friends":{
          "followers":{},
          "followings":{},
        },
        "notifications":{}
      },
    });
  }


  @override
  Widget build(BuildContext context) {
    // var user = ModalRoute.of(context)!.settings.arguments as User;
     var size = MediaQuery.of(context).size;
    // emailController.text = user.email!;
    // firstNameController.text = user.firstName!;
    // lastNameController.text = user.lastName!;
    // userIcon = user.photoUrl ?? userIcon;
    //isNetwork = !(user.photoUrl == null);
    setState(() {
      // enableEmail = false;
      // emailIsValid = emailValidator(user.email!);
      // firstNameIsValid = firstNameValidator(user.firstName!);
      // lastNameIsValid = lastNameValidator(user.lastName!);
    });
    PhoneNumber number = PhoneNumber(isoCode: countryCode);

    Widget thirdView = Container(
      alignment: Alignment.center, padding:EdgeInsets.all(0),
      child:  Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
              decoration: InputDecoration(
                  labelText: 'User name :-',
                  labelStyle: blue20Style),
              controller: userNameController,
              onChanged: (value) {
                setState(() {
                  userNameIsValid = firstNameValidator(value);
                  if (!userNameIsValid) {
                    userNameStatus = UserNameStatus.error;
                  } else
                    userNameStatus = UserNameStatus.success;
                });}
          ),
          (userNameStatus == UserNameStatus.error) ? error(userName_error) : Text(''),
          TextField(
              decoration: InputDecoration(
                  labelText: 'First name :-',
                  labelStyle: blue20Style),
              controller: firstNameController,
              onChanged: (value) {
                setState(() {
                  firstNameIsValid = firstNameValidator(value);
                  if (!firstNameIsValid) {
                    firstNameStatus = FirstNameStatus.error;
                  } else
                    firstNameStatus = FirstNameStatus.success;
                });}
          ),
          (firstNameStatus == FirstNameStatus.error) ? error(firstName_error) : Text(''),
          TextField(
              decoration: InputDecoration(
                  labelText: 'Last name :-',
                  labelStyle: blue20Style),
            controller: lastNameController,
              onChanged: (value) {
                setState(() {
                  lastNameIsValid = lastNameValidator(value);
                  if (!lastNameIsValid) {
                    lastNameStatus = LastNameStatus.error;
                  } else
                    lastNameStatus = LastNameStatus.success;
                });}
          ),
          (lastNameStatus == LastNameStatus.error) ? error(lastName_error) : Text(''),

        ],
      ),
    );

    Widget firstView = Container(
        alignment: Alignment.center, padding:EdgeInsets.all(0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Container(
          //   child: Stack(
          //     children: [
          //       AnimatedCrossFade(
          //         duration: const Duration(milliseconds: 500),
          //         firstChild: RawMaterialButton(
          //           onPressed: (){},
          //           elevation: 2.0,
          //           fillColor: projectGray2,
          //           child: CircleAvatar(
          //             foregroundImage:  NetworkImage(userIcon),
          //             radius: size.height * 0.06,
          //           ),
          //           padding: EdgeInsets.all(5.0),
          //           shape: CircleBorder(side: BorderSide(color: projectGray)),
          //         ),
          //         secondChild: RawMaterialButton(
          //           onPressed: (){},
          //           elevation: 2.0,
          //           fillColor: projectGray2,
          //           child: CircleAvatar(
          //             foregroundImage:  FileImage(_image),
          //             radius: size.height * 0.06,
          //           ),
          //           padding: EdgeInsets.all(3.0),
          //           shape: CircleBorder(side: BorderSide(color: projectGray)),
          //         ),
          //         crossFadeState: isNetwork
          //             ? CrossFadeState.showFirst
          //             : CrossFadeState.showSecond,
          //       ),
          //       Positioned(
          //         top: size.height * 0.08,left:size.width * 0.08,
          //         child: IconButton(
          //             icon: Icon(Icons.add_circle,color: projectBlue,size: size.height * 0.04,),
          //             onPressed: () async {
          //               final pickedFile = await picker.getImage(source: ImageSource.gallery);
          //
          //               setState(() {
          //                 if (pickedFile != null) {
          //                   isNetwork = false;
          //                   _image = File(pickedFile.path);
          //                 } else {
          //                   print('No image selected.');
          //                 }
          //               });
          //             })
          //       ),
          //     ],
          //   ),
          //
          //   width: size.width,alignment: Alignment.center,height: size.height * 0.15
          // ),
          Hero(
            tag: "splashscreenImage",
            child: WidgetAnimator(
              component: Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,alignment: Alignment.topCenter,
                child:
                imgAnimation2(url: Assets.images.logo.path,time: Duration(milliseconds: 4000),
                  width: MediaQuery.of(context).size.width * 0.5,beginx:0.1,endx: -0.1, beginy: 0,endy: 0,
                  height: MediaQuery.of(context).size.height * 0.5,transition: PositionedTransition,
                ),

              ),
              transition: Transform,animPattern: Curves.easeIn,pixle: Colors.transparent,time: Duration(seconds: 1),animType: "nothing",xAxis: 0,yAxis: 0,
            ),
          ),
          TextField(
              textAlignVertical: TextAlignVertical.bottom,enabled: enableEmail,
              decoration: InputDecoration(
                  labelText: 'Email ',
                  labelStyle: blue20Style),keyboardType: TextInputType.emailAddress,
              controller: emailController,
              onChanged: (value) {
                setState(() {
                  emailIsValid = emailValidator(value);
                  if (!emailIsValid) {
                    emailStatus = EmailStatus.error;
                  } else
                    emailStatus = EmailStatus.success;
                });}
          ),
          (emailStatus == EmailStatus.error) ? error(email_error) : Text(''),
          TextField(
            decoration: InputDecoration(
                labelText: 'Password',
                suffixIcon: IconButton(
                  icon: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                    color: projectBlue,
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
                labelStyle: blue20Style),obscureText: !_passwordVisible,
            controller: passwordController,
            onChanged: (value) {
              setState(() {
                passwordValidationResp = passwordValidator(value);
                if (passwordValidationResp.validated < 4) {
                  //passwordIsValid = passwordValidationResp.validated;
                  passwordStatus = PasswordStatus.error;
                } else {
                  passwordIsValid = true;
                  passwordStatus =
                      PasswordStatus.success;
                }
              });
            },),
          (passwordStatus == PasswordStatus.error) ? error(passwordValidationResp.error) : Text(''),
        ])
    );

    return Scaffold(
      body: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          AnimatedPositioned(
              top: 0,
              duration: Duration(seconds: 1),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(30, 10, 30, 20),
                alignment: Alignment.center,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Hero(
                        tag: "headerTxt",
                        child: Text('Join Edurald',style: blue25BoldStyle,textAlign: TextAlign.center,),
                      ),
                      SizedBox(height: size.height * 0.02,),
                      Text('Sign up to learn and connect with other professionals like you',style: darkNormal18Style,textAlign: TextAlign.center,),
                    ]),
              ),
          ),

          //bottom rect
          AnimatedPositioned(
            top: MediaQuery.of(context).size.height * 0.15,
            height: MediaQuery.of(context).size.height,
            duration: Duration(seconds: 0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(30, 10, 30, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  AnimatedCrossFade(
                    duration: const Duration(milliseconds: 500),
                    firstChild: (isFirstView)?firstView:thirdView,
                    secondChild: Container(
                      alignment: Alignment.center, padding:EdgeInsets.all(0),
                      child:  Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          InternationalPhoneNumberInput(
                            onInputChanged: (PhoneNumber number) {
                              setState(() {
                                phoneNumberIsValid =
                                    phoneNumberValidator(number.phoneNumber);
                                if (!phoneNumberIsValid) {
                                  phoneNumberStatus =
                                      PhoneNumberStatus.error;
                                } else
                                  phoneNumberStatus =
                                      PhoneNumberStatus.success;
                              });
                              print(number.phoneNumber);
                              setState(() {
                                phoneNumber =number.phoneNumber;
                              });
                            },
                            onInputValidated: (bool value) {
                              print(value);
                            },
                            selectorConfig: SelectorConfig(
                              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                            ),
                            ignoreBlank: false,
                            autoValidateMode: AutovalidateMode.disabled,
                            selectorTextStyle: TextStyle(color: projectDark),
                            initialValue: initialnumber,
                            textFieldController: phoneNoController,
                          ),
                          (phoneNumberStatus == PhoneNumberStatus.error)
                              ? error(phoneNumber_error)
                              : Text(''),
                        ],
                      ),
                    ),
                    crossFadeState: next
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                  ),

                  Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: Column(
                      children: <Widget>[

                        SizedBox(height: size.height * 0.01),
                        Container(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: 'You agree to the edurald',
                              style: gray12Style,
                              children: <TextSpan>[
                            TextSpan(
                                text: 'User Agreement, Privacy Policy, and Cookie Policy.',
                                style: blue12Style,
                            )
                              ]
                            ),
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        SizedBox(height: size.height * 0.01),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                          child: ButtonTheme(
                              minWidth: MediaQuery.of(context).size.width ,
                              height: 40,
                              buttonColor: Colors.transparent,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    side: BorderSide(color: projectBlue)
                                ),
                                color: projectBlue,
                                child: Text('Continue',style: white18Style,),
                                onPressed: () async {
                                    setState((){
                                      _current = ++_current % 3;
                                    });
                                      print(_current);
                                      switch (_current){
                                      case 1:
                                        if(!emailIsValid || !passwordIsValid){
                                          _current = 0;
                                          showPopUp(form_update_error);
                                          return;
                                        }
                                        var connectivityResult = await (Connectivity().checkConnectivity());
                                        if (connectivityResult == ConnectivityResult.none) {
                                          showPopUp(internet_error);
                                          // Mobile is not Connected to Internet
                                        }
                                        else {
                                          registerUser();
                                          // I am connected to a network.
                                        }
                                        break;
                                      case 2:
                                      if(!firstNameIsValid || !lastNameIsValid || !userNameIsValid){
                                        _current = 2;
                                        showPopUp(form_update_error);
                                        return;
                                      }
                                      _current = 2;
                                      var connectivityResult = await (Connectivity().checkConnectivity());
                                      if (connectivityResult == ConnectivityResult.none) {
                                        showPopUp(internet_error);
                                        // Mobile is not Connected to Internet
                                      }
                                      else {
                                        updateUserRecords();
                                        // I am connected to a network.
                                      }
                                      break;
                                      default:
                                        print(_current);
                                        validatePhoneNumber();

                                        // if(!phoneNumberIsValid || (passwordStatus == PasswordStatus.error) || passwordController.text.isEmpty){
                                        //   showPopUp(form_update_error);
                                        //   _current = 1;
                                        //   return;
                                        // }
                                        // next = !next;
                                        break;
                                    }
                                },
                                highlightElevation: 0.8,
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          AnimatedPositioned(
              top: size.height * socialAuthsLocation,
              duration: Duration(seconds: 1),
              child: Container(
                height: size.height * 0.25,color: Colors.transparent,width: size.width,
                  alignment: Alignment.center,
                  child: Column(
                      children: <Widget>[
                        SizedBox(height: size.height * 0.02),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center, padding:EdgeInsets.all(0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                alignment: Alignment.center, padding:EdgeInsets.all(0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                                      child: Container(
                                          height: 3,
                                          width: size.width * 0.15,
                                          color: projectBlue),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      child: Text('or sign up with',style: darkSemiBold19Style,textAlign: TextAlign.center,),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                                      child: Container(
                                          height: 3,
                                          width: size.width * 0.15,
                                          color: projectBlue),
                                    ),

                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: size.height * 0.02),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.12,
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                CupertinoButton(child: Image.asset(Assets.images.socials.linkedInIcon.path,height: size.height * 0.08), onPressed: () =>print('LinkedIn Clicked'),),
                                CupertinoButton(child: Image.asset(Assets.images.socials.googleIcon.path,height: size.height * 0.07), onPressed: () =>print('Google Clicked'),),
                                CupertinoButton(child: Image.asset(Assets.images.socials.twitterIcon.path,height: size.height * 0.08), onPressed: () =>print('Twitter Clicked'),),

                              ]),
                        ),
                      ])
              )
          ),

          AnimatedPositioned(
              top: 10,
              duration: Duration(seconds: 1),
              child: Container(
                height: size.height * blurrySize,color: Colors.transparent,width: size.width * blurrySize,
              )
          ),

          if(showLoader)AnimatedPositioned(
            top: MediaQuery.of(context).size.height * 0,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            duration: Duration(milliseconds: 500),
            child: Center(
              child: new CircularProgressIndicator(),
            ),
          )
        ],
      ),
    );
  }
}