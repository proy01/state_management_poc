import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_poc/classes/screen_selector.dart';
import 'package:state_management_poc/screens/screen_one.dart';
import 'package:get/get.dart';
import 'package:state_management_poc/screens/screen_three.dart';
import 'package:state_management_poc/screens/screen_two.dart';

void main(){
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ScreenSelector())
      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Provider POC';

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title),),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${context.watch<ScreenSelector>().screenIndex}', key: const Key('screenNumber'),),
              const PageSlider(),
              const SizedBox(
                height: 30,
              ),
              TextButton(
                  onPressed: (){
                    // print(ScreenSelector().screenIndex);
                    switch (Provider.of<ScreenSelector>(context, listen: false).screenIndex) {
                      case 1: {
                        Get.to(()=>const ScreenOne());
                        break;
                      }
                      case 2:{
                        Get.to(()=>const ScreenTwo());
                        break;
                      }
                      case 3: {
                        Get.to(()=>const ScreenThree());
                        break;
                      }
                      default : {
                        break;
                      }
                    }
                  },
                  child: const Text("Launch Screen")
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PageSlider extends StatefulWidget {
  const PageSlider({Key? key}) : super(key: key);

  @override
  _PageSliderState createState() => _PageSliderState();
}

class _PageSliderState extends State<PageSlider> {
  double _currentSliderValue = 1;
  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _currentSliderValue,
      min: 1,
      max: 3,
      divisions: 2,
      label: _currentSliderValue.round().toString(),
      onChanged: (double value){
        context.read<ScreenSelector>().updatePage(value);
        setState(() {
          _currentSliderValue = value;
        });
      },
    );
  }
}