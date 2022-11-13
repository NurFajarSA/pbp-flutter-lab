import 'package:counter_7/model/budget/budget.dart';
import 'package:counter_7/view/budget/form_budget_page.dart';
import 'package:counter_7/view/counter/counter_page.dart';
import 'package:counter_7/view/widgets/drawer.dart';
import 'package:flutter/material.dart';

class DataBudgetPage extends StatelessWidget {
  const DataBudgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    final data = DataBudget.data;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Budget'),
      ),
      drawer: MyDrawer(title: 'Menu', menu: {
        'Counter': () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const CounterPage())),
        'Tambah Budget': () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const FormBudgetPage())),
        'Data Budget': () => Navigator.pop(context),
      }),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(data[index].getName),
                      subtitle: Text(data[index].getAmount + " | " + data[index].getDate),
                      trailing: Text(data[index].getType),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
