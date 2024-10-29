import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spa_app/presentation/providers/news/news_providers.dart';
import 'package:spa_app/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

  static const name = 'home-screen';
   
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      //  appBar: AppBar(
      //      title: const Text('HomeTitle'),
      //  ),
      body: _HomeView(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {

  @override
  void initState() {
    super.initState();

    ref.read(recentNewsProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {

    final recentNews = ref.watch(recentNewsProvider);

    return Column(
      children: [

        CustomAppbar(),

        NewsSlideshow(recentNews: recentNews),
        
      ],
    );
  }
}