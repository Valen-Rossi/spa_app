
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spa_app/domain/entities/news.dart';
import 'package:spa_app/presentation/providers/news/news_repository_provider.dart';

final recentNewsProvider = StateNotifierProvider<NewsNotifier, List<News>>((ref) {
  
  final fetchMoreNews= ref.watch(newsRepositoryProvider).getRecentNews;

  return NewsNotifier(
    fetchMoreNews: fetchMoreNews
    );
});

typedef NewsCallBack = Future<List<News>> Function({int page});

class NewsNotifier extends StateNotifier<List<News>>{

  int currentPage= 0;
  NewsCallBack fetchMoreNews;

  NewsNotifier({
    required this.fetchMoreNews,
  }): super([]);

  Future<void> loadNextPage() async{
    currentPage++;

    final List<News> news = await fetchMoreNews(page: currentPage);

    state = [...state, ...news];
  }
}