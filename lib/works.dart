import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getNews() async{
  List news = [];
  CollectionReference collectionReferenceNews = db.collection('noticias');

  QuerySnapshot queryNews = await collectionReferenceNews.get();

  queryNews.docs.forEach((element) {
    news.add(element.data());
  });

  return news;
}

class HomeScreen extends StatefulWidget {

  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getNews(), 
        builder: (context, snapshot) {
          return const Text("Hola");
        },
      ),
    );
  }
}