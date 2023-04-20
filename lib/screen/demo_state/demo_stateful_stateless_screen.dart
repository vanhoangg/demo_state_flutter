import 'package:flutter/material.dart';

class DemoStatefulStatelessScreen extends StatefulWidget {
  const DemoStatefulStatelessScreen({
    super.key,
  });

  @override
  State<DemoStatefulStatelessScreen> createState() =>
      _DemoStatefulStatelessScreenState();
}

class _DemoStatefulStatelessScreenState
    extends State<DemoStatefulStatelessScreen> {
  int counter = 0;
  double heightYellowWidget = 200;
  Color colorRow = Colors.black;
  GlobalKey keyRed = GlobalKey(debugLabel: "keyStateful");
  GlobalKey keyYellow = GlobalKey(debugLabel: "keyStateless");
  final ScrollController scrollController =
      ScrollController(initialScrollOffset: 0);

  void _onTap() {
    Scrollable.ensureVisible(keyYellow.currentContext!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo Stateless Stateful"),
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              color: colorRow,
              child: Row(children: [
                DemoStatelessWidget(
                    height: MediaQuery.of(context).size.height / 2,
                    color: Colors.blue),
                DemoStatefulWidget(
                  key: keyRed,
                  heightOfContainer: MediaQuery.of(context).size.height / 2,
                ),
              ]),
            ),
            InkWell(
              onTap: () {
                // colorRow = Colors.white;
                heightYellowWidget == 500
                    ? heightYellowWidget = 100
                    : heightYellowWidget = 500;
                setState(() {});
              },
              child: DemoStatelessWidget(
                key: keyYellow,
                height: heightYellowWidget,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onTap,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class DemoStatelessWidget extends StatelessWidget {
  const DemoStatelessWidget({Key? key, this.height, this.color})
      : super(key: key);

  final Color? color;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 200,
      width: 200,
      color: color ?? Colors.yellow,
    );
  }
}

class DemoStatefulWidget extends StatefulWidget {
  DemoStatefulWidget({super.key, this.heightOfContainer});

  double? heightOfContainer;

  @override
  State<DemoStatefulWidget> createState() => _DemoStatefulWidgetState();
}

class _DemoStatefulWidgetState extends State<DemoStatefulWidget> {
  @override
  void initState() {
    super.initState();
  }

  void onClick() {
    // sizeOfContainer = 300;
    print("sizeOfContainer : ${context.size?.height}");

    setState(() {
      widget.heightOfContainer != 300
          ? widget.heightOfContainer = 300
          : widget.heightOfContainer = 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onClick(),
      child: Container(
          height: widget.heightOfContainer, width: 100, color: Colors.red),
    );
  }
}
