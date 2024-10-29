import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:spa_app/domain/entities/news.dart';

class NewsSlideshow extends StatelessWidget {

  final List<News> recentNews;

  const NewsSlideshow({
    super.key, 
    required this.recentNews
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      width: double.infinity,
      child: Swiper(
        viewportFraction: 0.8,
        scale: 0.9,
        autoplay: true,
        itemCount: recentNews.length,
        itemBuilder: (context, index) => _Slide(news: recentNews[index]),
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final News news;

  const _Slide({required this.news});

  @override
  Widget build(BuildContext context) {

    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(
          color: Colors.black45,
          blurRadius: 10,
          offset: Offset(0, 10)
        )
      ]
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: DecoratedBox(
        decoration: decoration,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            news.imageUrl,
            fit: BoxFit.fill,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress != null) {
                return const DecoratedBox(
                  decoration: BoxDecoration(color: Colors.black12) 
                );
              }
              return FadeIn(child: child);
            },
          ),
        ),
      ),
    );
  }
}