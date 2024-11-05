
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spa_app/domain/entities/news.dart';
import 'package:spa_app/presentation/providers/news/news_repository_provider.dart';

final recentNewsProvider = StateNotifierProvider<NewsNotifier, List<News>>((ref) {
  
  final fetchMoreNews= ref.watch(newsRepositoryProvider).getRecentNews;

  return NewsNotifier(fetchMoreNews: fetchMoreNews);
});

typedef NewsCallBack = Future<List<News>> Function({int page});

class NewsNotifier extends StateNotifier<List<News>>{

  int currentPage= 0;
  bool isLoading= false;
  NewsCallBack fetchMoreNews;

  NewsNotifier({
    required this.fetchMoreNews,
  }): super([]);

  Future<void> loadNextPage() async{
    if (isLoading) return;

    isLoading= true;

    currentPage++;

    final List<News> news = await fetchMoreNews(page: currentPage);

    state = [...news];

    isLoading= false;
  }
}