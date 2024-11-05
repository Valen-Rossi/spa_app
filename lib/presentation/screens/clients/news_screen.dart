import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spa_app/domain/entities/entities.dart';
import 'package:spa_app/presentation/providers/providers.dart';

class NewsScreen extends ConsumerStatefulWidget {

  static const name = 'news-screen';

  final String newsId;

  const NewsScreen({
    super.key, 
    required this.newsId
  });

  @override
  NewsScreenState createState() => NewsScreenState();
}

class NewsScreenState extends ConsumerState<NewsScreen> {

  @override
  void initState() {
    super.initState();

    ref.read(recentNewsProvider.notifier);
  }

  @override
  Widget build(BuildContext context) {

    final news = ref.watch(recentNewsProvider).singleWhere((element) => element.id==widget.newsId);

    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [

          _CustomSliverAppBar(news: news),

          SliverList(delegate: SliverChildBuilderDelegate(
            (context, index) => _NewsDetails(news: news),
            childCount: 1
          ))

        ],
      ),
    );
  }
}


class _NewsDetails extends StatelessWidget {

  final News news;

  const _NewsDetails({required this.news});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final textStyles = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Padding(
          padding: const EdgeInsets.all(7),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Imagen
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  news.imageUrl,
                  width: size.width*0.3,
                )
              ),

              const SizedBox(width: 10),

              // Descripción
              SizedBox(
                width: (size.width-40)*0.7,
                child: Text(news.description),
              ),

            ],
          ),
        ),

        const SizedBox(height: 100),

      ],
    );
  }
}


class _CustomSliverAppBar extends StatelessWidget {

  final News news;

  const _CustomSliverAppBar({required this.news});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: size.height*0.7,
      foregroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.all(7),
        centerTitle: true,
        title: Text(
          news.title,
          style: const TextStyle(color: Colors.white, fontSize: 20),
          textAlign: TextAlign.start,
        ),
        background: Stack(
          children: [

            SizedBox.expand(
              child: Image.network(
                news.imageUrl,
                fit: BoxFit.cover,
              ),
            ),

            const _CustomGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter
            ),

            const _CustomGradient(
              begin: Alignment.topLeft, 
              end: Alignment.centerRight
            ),

          ],
        ),
      ),
    );
  }
}

class _CustomGradient extends StatelessWidget {

  final AlignmentGeometry begin;
  final AlignmentGeometry end;

  const _CustomGradient({
    required this.begin, 
    required this.end, 
  });
  
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
          child: DecoratedBox(
            decoration:BoxDecoration(
              gradient: LinearGradient(
                begin: begin,
                end: end,
                stops: const [0.0,0.37], 
                colors: const [
                  Colors.black87,
                  Colors.transparent,
                ],
              )
            ) 
          ),
        );
  }
}