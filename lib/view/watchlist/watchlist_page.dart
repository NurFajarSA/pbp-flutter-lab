import 'package:counter_7/data/data_source/remote_api.dart';
import 'package:counter_7/view/budget/data_budget_page.dart';
import 'package:counter_7/view/budget/form_budget_page.dart';
import 'package:counter_7/view/counter/counter_page.dart';
import 'package:counter_7/view/watchlist/detail_watchlist_page.dart';
import 'package:counter_7/view/widgets/drawer.dart';
import 'package:flutter/material.dart';

class WatchlistPage extends StatelessWidget {
  const WatchlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watchlist'),
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
          'Watchlist': () => Navigator.pop(context),
        },
      ),
      body: FutureBuilder(
        future: RemoteApi.fetchWatchList(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return const Center(
                child: Text('No Data'),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: snapshot.data![index].fields.watched
                          ? Border.all(color: Colors.greenAccent)
                          : Border.all(color: Colors.redAccent),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: const Color.fromARGB(255, 2, 18, 42)
                                .withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(0, 2)),
                      ],
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailWatchlistPage(
                                        data: snapshot.data![index],
                                      )));
                        }),
                        child: Ink(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data![index].fields.title,
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}
