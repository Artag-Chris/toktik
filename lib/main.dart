import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/config/app_theme.dart';
import 'package:toktik/infrastructure/models/datasources/local_video_datasource_impl.dart';
import 'package:toktik/infrastructure/repositories/video_posts_repository_impl.dart';
import 'package:toktik/presentation/providers/discover_provider.dart';
import 'package:toktik/presentation/screens/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {


final videoPostRepository= VideoPostRepositoryImpl(videosDatasource: LocalVideoDatasource());


    return MultiProvider(
      providers: [
        
        ChangeNotifierProvider(
          lazy: false,
          create: (_)=>DiscoverProvider(videoRepository: videoPostRepository)..loadNextPage())
      ],
      child: MaterialApp(
        title: 'Toktik',
        debugShowCheckedModeBanner: false,
        theme: Apptheme().getTheme(),
        home: const DiscoverScreen()
      ),
    );
  }
}