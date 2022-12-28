import 'package:flutter/material.dart';

class NotifyListenerScreen extends StatelessWidget {
  NotifyListenerScreen({super.key});
  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  final _toggle = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: ValueListenableBuilder(
          builder: (context, value, child) => Text(_counter.value.toString()),
          valueListenable: _counter,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ValueListenableBuilder(
              builder: (context, value, child) => TextField(
                obscureText: _toggle.value,
                decoration: InputDecoration(
                    hintText: 'Goutom',
                    suffixIcon: InkWell(
                        onTap: () {
                          _toggle.value = !_toggle.value;
                        },
                        child: Icon(_toggle.value
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined))),
              ),
              valueListenable: _toggle,
            ),
            MaterialButton(
              onPressed: () => _counter.value++,
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
