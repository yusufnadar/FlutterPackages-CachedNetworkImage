import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CacheNetworkImagePage extends StatefulWidget {
  const CacheNetworkImagePage({Key? key}) : super(key: key);

  @override
  State<CacheNetworkImagePage> createState() => _CacheNetworkImagePageState();
}

class _CacheNetworkImagePageState extends State<CacheNetworkImagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cache Network Image'),
        actions: [
          TextButton(onPressed: (){
            clearCache();
          }, child: const Text('Clear Cache',style: TextStyle(color: Colors.white),)),
        ],
      ),
      body: Center(
        child: CachedNetworkImage(
          key: UniqueKey(),
          imageUrl: 'https://mymodernmet.com/wp/wp-content/uploads/2019/07/will-burrard-lucas-beetlecam-23-1024x683.jpg',
          imageBuilder: (context,imageProvider) => CircleAvatar(backgroundImage: imageProvider,radius: 100,),
          errorWidget: (context,url,errorMessage)=>Text(errorMessage.toString()),
          //placeholder: (context,url)=>CircularProgressIndicator(),
          progressIndicatorBuilder: (context,url,progress)=>CircularProgressIndicator(value: progress.progress,),
          fit: BoxFit.contain,
          fadeInCurve: Curves.bounceOut,
          fadeInDuration: Duration(seconds: 5),
        ),
      ),
    );
  }

  void clearCache() {
    imageCache!.clear();
    imageCache!.clearLiveImages();
    setState(() {

    });
  }
}
