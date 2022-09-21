import 'package:flutter/material.dart';
import 'package:flutter_animations_themes_custom_painter/widgets/custom_text.dart';

class TweenAnimationExample extends StatefulWidget {
  const TweenAnimationExample({Key? key}) : super(key: key);

  @override
  _TweenAnimationExampleState createState() => _TweenAnimationExampleState();
}

class _TweenAnimationExampleState extends State<TweenAnimationExample> {
  var _scale = 1.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('Transform Widget', style: TextStyle(color: Colors.black)),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder<double>(
                tween: Tween(begin: 1, end: _scale),
                duration: Duration(seconds: 1),
                child: Align(
                    alignment: Alignment.center,
                    child: CustomText('🍑', size: 50)),
                builder: (context, value, child) {
                  return Transform.scale(
                    scale: value,
                    child: child,
                  );
                }),
            SizedBox(
              height: 20,
            ),
            Slider.adaptive(
                value: _scale,
                max: 5,
                min: 1,
                onChanged: (value) {
                  setState(() {
                    _scale = value;
                  });
                })
          ],
        ),
      ),
    );
  }
}
