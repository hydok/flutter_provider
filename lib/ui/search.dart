import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/provider/count_provider.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('number : ${context.watch<CountProvider>().count}'),
            Padding(padding: EdgeInsets.all(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {
                  context.read<CountProvider>().plus();
                }, child: Text('+')),
                Padding(padding: EdgeInsets.all(10)),
                ElevatedButton(onPressed: () {
                  context.read<CountProvider>().minus();
                }, child: Text('-')),
              ],
            )
          ],
        ),
      ),
    );
    /*return Container(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('number : ${context.watch<CountProvider>().count}'),
            Padding(padding: EdgeInsets.all(10)),
            Consumer<CountProvider>(
              builder: (_, counter, __) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        counter.plus();
                      },
                      child: Text('+')),
                  Padding(padding: EdgeInsets.all(10)),
                  ElevatedButton(
                      onPressed: () {
                        counter.minus();
                      },
                      child: Text('-')),
                ],
              ),
            )
          ],
        ),
      ),
    );*/

  }
}
