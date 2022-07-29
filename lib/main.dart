import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/Model/MoviesWidget.dart';
import 'package:movies_app/Model/movies_Model.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Movies> _movies = <Movies>[];
  @override
  void initState() {
    super.initState();
    _populateAllMovies();
  }

  void _populateAllMovies() async {
    final movies = await _fatchMovies();
    setState(() {
      _movies = movies;
    });
  }

  Future<List<Movies>> _fatchMovies() async {
    final response = await http.get(
        Uri.parse("http://www.omdbapi.com/?s=Batman&page=2&apikey=564727fa"));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result['Search'];
      return list.map((movies) => Movies.fromJson(movies)).toList();
    } else {
      throw Exception('Do not have any Movies');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red.shade500,
          title: const Text('Movies'),
        ),
        body: Container(
            color: Colors.grey.shade200, child: MoviesWidget(movies: _movies)),
      ),
    );
  }
}
