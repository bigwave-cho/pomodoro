import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

// stateless widget은 단지 UI를 리턴해주는 역할만을 한다.

/* stateful widget은 state(상태)를 가진 위젯을 말한다.(실시간 데이터 반영)
statefulWidget은 두가지 파트로 나뉘는데 하나는 상태가 없는 위젯
하나는 State 위젯은 위젯에 들어갈 데이터와 UI를 넣는 곳.

*/

//state가 없는 위젯 자체
class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

//State 위젯은 데이터가 반영되면서 UI가 변화하는 곳.
class _AppState extends State<App> {
  // 아래 값을 변경하고 덮어쓸 예정이라 final을 붙이지 않는다.
  // 또한 데이터는 단지 dart 클래스의 프로퍼티
  int counter = 0;

  void onClicked() {
    //react의 useState처럼 상태 변경을 알려서 렌더링(build메서드 호출)을 발생시키는 setState함수가 필요
    setState(() => {});
    // 콜백 내에 아래 표현식을 넣어도 되고 걍 밖에 둬도 작동함.
    counter = counter + 1;
  }

// State 클래스는 위젯의 UI도 보유
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Click Count',
              style: TextStyle(fontSize: 30),
            ),
            Text(
              '$counter',
              style: const TextStyle(fontSize: 30),
            ),
            IconButton(
              iconSize: 40,
              onPressed: onClicked,
              icon: const Icon(Icons.add_box_rounded),
            ),
          ],
        )),
      ),
    );
  }
}
