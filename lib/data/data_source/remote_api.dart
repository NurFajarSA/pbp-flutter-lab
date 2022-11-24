import 'package:counter_7/data/model/mywatchlist/mywatchlist.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RemoteApi{
  static Future<List<MyWatchlist>> fetchWatchList() async {
    var url = Uri.parse(
        'https://katalogku.herokuapp.com/mywatchlist/json');
    var response = await http.get(
      url,
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(response.body);

    // melakukan konversi data json menjadi object ToDo
    List<MyWatchlist> myWatchlistData = [];
    for (var d in data) {
      if (d != null) {
        myWatchlistData.add(MyWatchlist.fromJson(d));
      }
    }

    return myWatchlistData;
  }
}