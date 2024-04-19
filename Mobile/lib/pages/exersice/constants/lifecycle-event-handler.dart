import 'package:flutter/cupertino.dart';

class LifecycleEventHandler extends WidgetsBindingObserver {
  LifecycleEventHandler({required this.inactiveCallBack, required this.resumeCallBack, required this.detachedCallBack});

  final VoidCallback resumeCallBack;
  final VoidCallback detachedCallBack;
  final VoidCallback inactiveCallBack;

//  @override
//  Future<bool> didPopRoute()

//  @override
//  void didHaveMemoryPressure()

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {


    if(state==AppLifecycleState.inactive){
      inactiveCallBack();
    }
    else if(state==AppLifecycleState.paused){

    }
    else if(state==AppLifecycleState.detached){
      detachedCallBack();
    }
    else if(state==AppLifecycleState.resumed){
      resumeCallBack();
    }


    print('''
=============================================================
               $state
=============================================================
''');
    //inactiveCallBack();
  }

//  @override
//  void didChangeLocale(Locale locale)

//  @override
//  void didChangeTextScaleFactor()

//  @override
//  void didChangeMetrics();

//  @override
//  Future<bool> didPushRoute(String route)
}