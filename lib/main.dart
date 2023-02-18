import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  List<int> numbers = [];

  void onClicked() {
    setState(() => {numbers.add(numbers.length)});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //flutter는 앱의 모든 스타일을 한 곳에 저장할 수 있는 기능을 제공
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
            children: const [
              MyLargeTitle(),
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatelessWidget {
  const MyLargeTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 자식 클래스는 BuildContext를 통해 부모 위젯의 theme 값에 접근 가능
    // 사실상 MyLargeTitle 위젯은 column -> Center -> Scaffold를 지나서야(위젯트리참고)
    // Material 위젯에 도달할 수 있음.
    //context는 Text 위에 있는 모든 상위 요소들에 대한 정보.
    //즉, context에는 위젯 트리에 대한 정보가 담겨있음.
    return Text(
      'My Large Title',
      style: TextStyle(
        fontSize: 30,
        //Theme.of(context) : 위젯의 현재 위치를 제공
        //ThemeData에 저장된 textTheme의 titleLarge의 color 값을 가져옴
        color: Theme.of(context).textTheme.titleLarge?.color,
      ),
    );
  }
}

// BuildContext는 위젯 트리에서 위젯의 위치를 제공하고
// 이를 통해 상위 요소 데이터에 접근 가능하다.
