import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  //dispose메서드 설명관련
  bool showTitle = true;
  void toggleTitle() {
    setState(() {});
    showTitle = !showTitle;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showTitle ? const MyLargeTitle() : const Text('nothing'),
              IconButton(
                  onPressed: toggleTitle,
                  icon: const Icon(Icons.energy_savings_leaf))
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    Key? key,
  }) : super(key: key);

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  //StatefulWidget은 initState메서드도 가지고 있다.
  int count = 0; //이런식으로 초기화가 가능하기에 initState가 대부분 필요하진 않음.

  //가끔 부모 요소에 의존하는 데이터를 초기화하는 경우
  // 데이터를 초기화하기 위해 context를 사용하거나
  //API에서 업데이트를 구독하기 위해 사용함.
  // initState는 단 한번 build메서드보다 앞서 호출됨.
  @override
  void initState() {
    super.initState();
    print('initState');
  }

//dispose메서드는 API 업데이트나 이벤트리스너로부터 구독을 취소,
//form의 리스너로부터 벗어나고 싶을 때.. 무언가를 취소하는 곳
//위젯이 위젯트리에서 제거되기 전에 호출되는 것
  @override
  void dispose() {
    super.dispose();
    print('dispose');
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Text(
      'My Large Title',
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).textTheme.titleLarge?.color,
      ),
    );
  }
}

// Widget Life Cycle
// init : API 구독 or 변수 초기화 -> build 실행 -> dispose : API or 이벤트리스너 벗어나기