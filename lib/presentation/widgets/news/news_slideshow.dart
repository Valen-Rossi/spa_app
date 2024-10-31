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

    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      height: 210,
      width: double.infinity,
      child: Swiper(
        viewportFraction: 0.8,
        scale: 0.9,
        autoplay: true,
        pagination: SwiperPagination(
          margin: const EdgeInsets.only(top: 0),
          builder: DotSwiperPaginationBuilder(
            activeColor: colors.primary,
            color: colors.secondary,
          ),
        ),
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

    final textStyles = Theme.of(context).textTheme;

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
          child: FadeIn(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(news.imageUrl, fit: BoxFit.fill,),
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.center,
                      stops: [0.0, 0.9],
                      colors: [
                        Colors.black45,
                        Colors.transparent,
                      ]
                    )
                  )
                ),
                Text(
                  news.title, 
                  textAlign: TextAlign.center, 
                  // style: textStyles.titleMedium,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
