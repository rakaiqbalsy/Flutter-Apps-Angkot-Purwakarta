import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pwk_pro/rute/api/angkot.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // Variabel Untuk Get Future Class
  Future<ListAngkot> listAngkot;

  Future<ListAngkot> getListAngkot() async {
    // Fetch Data Dari API
    var dio = Dio();
    Response response =
        await dio.get('https://dev.farizdotid.com/api/purwakarta/ruteangkot');
    print(response.data);

    // Throw Exception

    // Bila Respond Code Berhasil Tampilkan Data Dari JSON
    if (response.statusCode == 200) {
      return ListAngkot.fromJson(response.data);
    }

    // Bila Gagal Load Data
    else {
      throw Exception('Gagal Load Data');
    }
  }

  @override
  void initState() {
    super.initState();
    listAngkot = getListAngkot();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rute Angkot Di Purwakarta"),
      ),
      body: FutureBuilder<ListAngkot>(
          future: listAngkot,
          builder: (context, snapshot) {
            // Bila data ditemukan tampilkan data
            if (snapshot.hasData) {
              return ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  itemCount: snapshot.data.ruteAngkot.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              '${snapshot.data.ruteAngkot[index].gambarUrl}'),
                        ),
                        title: Text(
                            "${snapshot.data.ruteAngkot[index].nomorAngkot} ${snapshot.data.ruteAngkot[index].trayek}"),
                        subtitle:
                            Text("${snapshot.data.ruteAngkot[index].lintasan}"),
                      ),
                    );
                  });
            }
            // Bila Data Error Munculkan Notification error
            else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
