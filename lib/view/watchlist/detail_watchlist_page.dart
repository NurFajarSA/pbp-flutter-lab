import 'package:counter_7/data/model/mywatchlist/mywatchlist.dart';
import 'package:counter_7/view/budget/data_budget_page.dart';
import 'package:counter_7/view/budget/form_budget_page.dart';
import 'package:counter_7/view/counter/counter_page.dart';
import 'package:counter_7/view/watchlist/watchlist_page.dart';
import 'package:counter_7/view/widgets/checkbox.dart';
import 'package:counter_7/view/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailWatchlistPage extends StatelessWidget {
  const DetailWatchlistPage({super.key, required this.data});

  final MyWatchlist data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Watchlist'),
      ),
      drawer: MyDrawer(
        title: 'Menu',
        menu: {
          'Counter': () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const CounterPage())),
          'Tambah Budget': () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const FormBudgetPage())),
          'Data Budget': () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const DataBudgetPage())),
          'Watchlist': () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const WatchlistPage())),
        },
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                data.fields.title,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              children: [
                const Text('Release Date: ',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(DateFormat.yMMMd().format(data.fields.releaseDate),
                    style: const TextStyle(fontSize: 18)),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                const Text('Rating: ',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text("${data.fields.rating.toString()}/10",
                    style: const TextStyle(fontSize: 18)),
              ],
            ),
            Row(
              children: [
                const Text('Status: ',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                MyCheckbox(value: data.fields.watched),
                const Text('Watched', style: const TextStyle(fontSize: 18)),
              ],
            ),
            const Text("Review: ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(data.fields.review, style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
      persistentFooterButtons: [
        Container(
          padding: const EdgeInsets.only(bottom: 5),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Center(child: Text('Back')),
          ),
        ),
      ],
    );
  }
}
