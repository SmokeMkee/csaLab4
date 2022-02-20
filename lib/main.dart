import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HIA LAB4',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final N = TextEditingController();
  final M = TextEditingController();
  final K = TextEditingController();
  final a = TextEditingController();
  final b = TextEditingController();
  final c = TextEditingController();
  final d = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: N,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 2,
                            )),
                        hintText: "Write N"),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextField(
                    controller: M,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 2,
                            )),
                        hintText: "Write M"),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextField(
                    controller: K,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 2,
                            )),
                        hintText: "Write K"),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              height: 4,
              color: Colors.black,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: a,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 2,
                            )),
                        hintText: "Write a"),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextField(
                    controller: b,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 2,
                            )),
                        hintText: "Write b"),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextField(
                    controller: c,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 2,
                            )),
                        hintText: "Write c"),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextField(
                    controller: d,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 2,
                            )),
                        hintText: "Write d"),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          Calcs calcs = new Calcs();
                          calcs.main(N.text, M.text, K.text, a.text, b.text,
                              c.text, d.text);
                        },
                        child: Text('Find')))
              ],
            )
          ],
        ),
      ),
    );
  }
}

class color {
  late int c;
  late int m;
  late int y;
  late int k;
}

class cache {
  late bool validation;
  late int position;
  late color colorValue;
}

class algorithm {
  void alg1(int N, int M, List<List<color>> memory) {
    for (int i = 0; i < N; i++) {
      for (int j = 0; j < M; j++) {
        memory[i][j].c = 0;
        memory[i][j].m = 0;
        memory[i][j].y = 1;
        memory[i][j].k = 0;
      }
    }
  }

  void alg2(int N, int M, List<List<color>> memory) {
    for (int i = 0; i < N; i++) {
      for (int j = 0; j < M; j++) {
        memory[j][i].c = 0;
        memory[j][i].m = 0;
        memory[j][i].y = 1;
        memory[j][i].k = 0;
      }
    }
  }

  void alg3(int N, int M, List<List<color>> memory) {
    for (int i = 0; i < N; i++) {
      for (int j = 0; j < M; j++) {
        memory[i][j].y = 1;
      }
    }
    for (int i = 0; i < N; i++) {
      for (int j = 0; j < M; j++) {
        memory[i][j].c = 0;
        memory[i][j].m = 0;
        memory[i][j].k = 0;
      }
    }
  }
}

class Calcs {
  void main(
      String N, String M, String K, String a, String b, String c, String d) {
    int n = int.parse(N);
    int m = int.parse(M);
    int k = int.parse(K);
    int A = int.parse(a);
    int B = int.parse(b);
    int C = int.parse(c);
    int D = int.parse(d);

    List<List<color>> arr = [n][m] as List<List<color>>;
    int leng = (n * m / k) as int;
    List<cache> arrCache = [leng] as List<cache>;
    algorithm alg1 = new algorithm();
    alg1.alg1(n, m, arr);
    bool search = false;
    int hit = 0;
    int miss = 0;
    for (int i = 0; i < leng; i++) {
      if (arrCache[i].colorValue.c == A &&
          arrCache[i].colorValue.m == B &&
          arrCache[i].colorValue.y == C &&
          arrCache[i].colorValue.k == D) {
        hit++;
        search = true;
      }
    }
    if (search == false) {
      miss++;
      for (int i = 0; i < n; i++) {
        for (int j = 0; j < m; j++) {
          if (arr[i][j].c == A &&
              arr[i][j].m == B &&
              arr[i][j].y == C &&
              arr[i][j].k == D) {
            arrCache[(i * m + j) % k].position == (i * m + j) / k;
            arrCache[(i * m + j) % k].validation == true;
            arrCache[(i * m + j) % k].colorValue == arr[i][j];
          }
        }
      }
    }
    print(hit);
    print(miss);
    print(hit / (hit + miss));
  }
}
