import 'package:counter_7/model/budget/budget.dart';
import 'package:counter_7/view/budget/data_budget_page.dart';
import 'package:counter_7/view/counter/counter_page.dart';
import 'package:counter_7/view/widgets/drawer.dart';
import 'package:flutter/material.dart';

class FormBudgetPage extends StatefulWidget {
  const FormBudgetPage({super.key});

  @override
  State<FormBudgetPage> createState() => _FormBudgetPageState();
}

class _FormBudgetPageState extends State<FormBudgetPage> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _nominalController = TextEditingController();
  final _tipeController = TextEditingController();
  final _dateController = TextEditingController();

  // Show date picker
  Future<Function()?> chooseDate({required BuildContext context}) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    if (date != null) {
      _dateController.text = date.toString();
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Budget'),
      ),
      drawer: MyDrawer(
        menu: {
          'Counter': () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const CounterPage())),
          'Tambah Budget': () => Navigator.pop(context),
          'Data Budget': () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const DataBudgetPage())),
        },
        title: 'Menu',
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  // Nama
                  TextFormField(
                    controller: _namaController,
                    decoration: const InputDecoration(
                      labelText: 'Nama',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  // Nominal
                  TextFormField(
                    controller: _nominalController,
                    decoration: const InputDecoration(
                      labelText: 'Nominal',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nominal tidak boleh kosong';
                      } else if (int.tryParse(value) == null) {
                        return 'Nominal harus berupa angka';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  // Tipe
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'Tipe',
                      border: OutlineInputBorder(),
                    ),
                    items: const [
                      DropdownMenuItem(
                        value: 'Pemasukan',
                        child: Text('Pemasukan'),
                      ),
                      DropdownMenuItem(
                        value: 'Pengeluaran',
                        child: Text('Pengeluaran'),
                      ),
                    ],
                    onChanged: (value) => setState(() {
                      _tipeController.text = value!;
                    }),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Tipe tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  // Tanggal
                  TextFormField(
                    controller: _dateController,
                    decoration: const InputDecoration(
                      labelText: 'Tanggal',
                      border: OutlineInputBorder(),
                    ),
                    onTap: () {
                      chooseDate(context: context);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Tanggal tidak boleh kosong';
                      } else if (DateTime.tryParse(value) == null) {
                        return 'Tanggal tidak valid';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  addBudget(_namaController.text, _nominalController.text,
                      _tipeController.text, _dateController.text);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Data berhasil disimpan'),
                    ),
                  );
                }
              },
              child: const Text('Simpan'),
            ),
            ElevatedButton(
              onPressed: () {
                _namaController.clear();
                _nominalController.clear();
                _tipeController.clear();
                _dateController.clear();
              },
              child: const Text('Reset'),
            ),
          ],
        ),
      ],
    );
  }
}

void addBudget(String nama, String nominal, String tipe, String date) {
  DataBudget.data
      .add(Budget(name: nama, amount: nominal, type: tipe, date: date));
}
