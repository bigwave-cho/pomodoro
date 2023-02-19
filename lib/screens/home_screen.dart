import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int totlaSeconds = 1500;
  // late 당장 initilize 하지 않아도 됨(사용할 때 초기화하겠다.)
  late Timer timer;

  void onTick(Timer timer) {
    setState(() {
      totlaSeconds--;
    });
  }

  void onStartPressed() {
    // duration마다 콜백함수 실행
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //현재 위젯의 위치를 알려주고(context) -> ThemeData의 backgroundColor 가져오기
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          //Flexible 화면 비율에 따라 UI를 유연하게 만들어줌.
          //flex 로 비율 정하기 가능.
          Flexible(
            flex: 1,
            child: Container(
              // alignment 세로 정렬
              alignment: Alignment.bottomCenter,
              child: Text(
                '$totlaSeconds',
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 89,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Center(
              child: IconButton(
                iconSize: 120,
                color: Theme.of(context).cardColor,
                onPressed: onStartPressed,
                icon: const Icon(
                  Icons.play_circle_outlined,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                //Expanded  display block 같은 것.
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pomodoros',
                          style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).textTheme.headline1!.color,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '0',
                          style: TextStyle(
                            fontSize: 58,
                            color: Theme.of(context).textTheme.headline1!.color,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
