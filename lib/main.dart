import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const GridViewCount());
  }
}

// GridView.count:　横に表示する個数を指定するタイプ
class GridViewCount extends StatelessWidget {
  const GridViewCount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = [
      _photoItem("icon0"),
      _photoItem("icon1"),
      _photoItem("icon2"),
      _photoItem("icon3"),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("GridView"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.2,
        children: list,
      ),
    );
  }

  Widget _photoItem(String image) {
    var assetsImage = "images/" + image + ".png";
    return Container(
      child: Image.asset(
        assetsImage,
        fit: BoxFit.cover,
      ),
    );
  }
}

// GridViewExtent: 横幅の最大値を指定してそれを超えない程度に大きくした画像を自動設置
class GridViewExtent extends StatelessWidget {
  const GridViewExtent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = [
      _photoItem("icon0"),
      _photoItem("icon1"),
      _photoItem("icon2"),
      _photoItem("icon3"),
    ];
    return Scaffold(
        appBar: AppBar(
          title: const Text("GridViewExtent"),
        ),
        body: GridView.extent(
          maxCrossAxisExtent: 150,
          padding: const EdgeInsets.all(4),
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          children: list,
        ));
  }

  Widget _photoItem(String image) {
    var assetsImage = "images/" + image + ".png";
    return Container(
      child: Image.asset(
        assetsImage,
        fit: BoxFit.cover,
      ),
    );
  }
}

// GridView.builder: ListView.builder同様、無限にグリッドを作成できる
class GridViewBuilder extends StatelessWidget {
  const GridViewBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var grid = [
      "icon0",
      "icon1",
      "icon2",
      "icon3",
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('GridViewBuilder'),
        ),
        body: GridView.builder(

            // scrollDirection: スクロール方向を指定
            scrollDirection: Axis.horizontal,

            // gridDelegateプロパティにグリッド数やグリッド同士の間隔を指定
            // SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: int): 横に配置する数を指定
            // SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: int): グリッドの最大幅指定
            // mainAxisSpacing: 間隔を指定
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 150, mainAxisSpacing: 10),
            itemBuilder: (BuildContext context, int index) {
              if (index >= grid.length) {
                grid.addAll([
                  "icon0",
                  "icon1",
                  "icon2",
                  "icon3",
                ]);
              }
              return _photoItem(grid[index]);
            }),
      ),
    );
  }

  Widget _photoItem(String image) {
    var assetsImage = "images/" + image + ".png";
    return Container(
      child: Image.asset(
        assetsImage,
        fit: BoxFit.cover,
      ),
    );
  }
}
