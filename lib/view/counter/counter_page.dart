import 'package:counter_7/view/budget/data_budget_page.dart';
import 'package:counter_7/view/budget/form_budget_page.dart';
import 'package:counter_7/view/widgets/drawer.dart';
import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Program Counter'),
      ),
      drawer: MyDrawer(
        title: 'Menu',
        menu: {
          'Counter': () => Navigator.pop(context),
          'Tambah Budget': () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const FormBudgetPage())),
          'Data Budget': () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const DataBudgetPage())),
        },
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_counter.isEven)
              const Text('GENAP', style: TextStyle(color: Colors.blue)),
            if (_counter.isOdd)
              const Text(
                'GANJIL',
                style: TextStyle(color: Colors.red),
              ),
            Text('$_counter', style: Theme.of(context).textTheme.headline4),
          ],
        ),
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(left: 32),
        child: Row(
          mainAxisAlignment: _counter != 0
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.end,
          children: [
            if (_counter != 0)
              FloatingActionButton(
                onPressed: _decementCounter,
                tooltip: 'Decrement',
                child: const Icon(Icons.remove),
              ),
            FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
