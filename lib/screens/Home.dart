import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final _scrollController = ScrollController();

  int _currentMax = 10;

  bool scrollModifier = false;

  bool _loading = true;

  List<String> linkList = [
    "https://cdn.pixabay.com/photo/2015/04/23/22/01/tree-736888_960_720.jpg",
    "https://images.unsplash.com/photo-1657299143363-621ba0a1e6ac?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHw%3D&w=1000&q=80",
    "https://images.unsplash.com/photo-1658830123727-4febcf91ec80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzfHx8ZW58MHx8fHw%3D&w=1000&q=80",
    "https://images.unsplash.com/photo-1658867835488-611ad1af15cc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1fHx8ZW58MHx8fHw%3D&w=1000&q=80",
    "https://images.unsplash.com/photo-1658937632483-e3777b516549?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw3fHx8ZW58MHx8fHw%3D&w=1000&q=80",
    "https://images.unsplash.com/photo-1658856102291-74df9dd0c544?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw5fHx8ZW58MHx8fHw%3D&w=1000&q=80",
    "https://images.unsplash.com/photo-1657299170964-205905bb0940?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxMXx8fGVufDB8fHx8&w=1000&q=80",
    "https://images.unsplash.com/photo-1658847412035-2ae0d3d5c364?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMnx8fGVufDB8fHx8&w=1000&q=80",
    "https://images.unsplash.com/photo-1658859976257-325eb7ac5fce?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNHx8fGVufDB8fHx8&w=1000&q=80",
    "https://images.unsplash.com/photo-1658924288266-4ec20a81969c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxN3x8fGVufDB8fHx8&w=1000&q=80",
    "https://images.unsplash.com/photo-1658905900425-f0a22fc5d024?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxOXx8fGVufDB8fHx8&w=1000&q=80",
    "https://images.unsplash.com/photo-1657299156000-2cccaea36b2b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwyMXx8fGVufDB8fHx8&w=1000&q=80",
    "https://images.unsplash.com/photo-1658856446922-b3878c5426e4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyM3x8fGVufDB8fHx8&w=1000&q=80",
    "https://images.unsplash.com/photo-1658933864678-9719d4eae248?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyNHx8fGVufDB8fHx8&w=1000&q=80",
    "https://images.unsplash.com/photo-1658786335116-369505985304?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fHw%3D&w=1000&q=80",
    "https://images.unsplash.com/photo-1658934475116-990b909c3038?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0fHx8ZW58MHx8fHw%3D&w=1000&q=80",
    "https://images.unsplash.com/photo-1657299143322-934f44698807?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHw2fHx8ZW58MHx8fHw%3D&w=1000&q=80",
    "https://images.unsplash.com/photo-1658937364065-60f3f6818724?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw4fHx8ZW58MHx8fHw%3D&w=1000&q=80",
    "https://images.unsplash.com/photo-1658728942158-30564d7d6aa6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMHx8fGVufDB8fHx8&w=1000&q=80",
    "https://images.unsplash.com/photo-1658928237337-a3347b887602?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxM3x8fGVufDB8fHx8&w=1000&q=80",
    "https://images.unsplash.com/photo-1658928784381-6f68bbcf92f6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNXx8fGVufDB8fHx8&w=1000&q=80",
    "https://images.unsplash.com/photo-1657299143544-f10ea56fbcd2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxNnx8fGVufDB8fHx8&w=1000&q=80",
    "https://images.unsplash.com/photo-1658927285044-4a29569c57a8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxOHx8fGVufDB8fHx8&w=1000&q=80",
    "https://images.unsplash.com/photo-1658877915390-cbdda4d7e1f5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyMHx8fGVufDB8fHx8&w=1000&q=80",
    "https://images.unsplash.com/photo-1658871125741-5e82ffd531b6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyMnx8fGVufDB8fHx8&w=1000&q=80",
    "https://images.unsplash.com/photo-1657299143363-621ba0a1e6ac?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHw%3D&w=1000&q=80",
    "https://images.unsplash.com/photo-1658867835488-611ad1af15cc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1fHx8ZW58MHx8fHw%3D&w=1000&q=80",
    "https://images.unsplash.com/photo-1658937364065-60f3f6818724?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw4fHx8ZW58MHx8fHw%3D&w=1000&q=80",
    "https://images.unsplash.com/photo-1658728942158-30564d7d6aa6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMHx8fGVufDB8fHx8&w=1000&q=80",
    "https://images.unsplash.com/photo-1658859976257-325eb7ac5fce?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNHx8fGVufDB8fHx8&w=1000&q=80",
    "https://images.unsplash.com/photo-1658924288266-4ec20a81969c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxN3x8fGVufDB8fHx8&w=1000&q=80",
    "https://images.unsplash.com/photo-1658877915390-cbdda4d7e1f5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyMHx8fGVufDB8fHx8&w=1000&q=80",
    "https://images.unsplash.com/photo-1658856446922-b3878c5426e4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyM3x8fGVufDB8fHx8&w=1000&q=80",
    "https://images.unsplash.com/photo-1658786335116-369505985304?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fHw%3D&w=1000&q=80",
    "https://images.unsplash.com/photo-1657299143322-934f44698807?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHw2fHx8ZW58MHx8fHw%3D&w=1000&q=80",
    "https://images.unsplash.com/photo-1658856102291-74df9dd0c544?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw5fHx8ZW58MHx8fHw%3D&w=1000&q=80",
    "https://images.unsplash.com/photo-1658847412035-2ae0d3d5c364?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMnx8fGVufDB8fHx8&w=1000&q=80",
    "https://images.unsplash.com/photo-1658928784381-6f68bbcf92f6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNXx8fGVufDB8fHx8&w=1000&q=80",
    "https://images.unsplash.com/photo-1658927285044-4a29569c57a8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxOHx8fGVufDB8fHx8&w=1000&q=80",
    "https://images.unsplash.com/photo-1657299156000-2cccaea36b2b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwyMXx8fGVufDB8fHx8&w=1000&q=80",
    "https://images.unsplash.com/photo-1658933864678-9719d4eae248?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyNHx8fGVufDB8fHx8&w=1000&q=80",
    "https://images.unsplash.com/photo-1658830123727-4febcf91ec80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzfHx8ZW58MHx8fHw%3D&w=1000&q=80",
    "https://images.unsplash.com/photo-1658934475116-990b909c3038?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0fHx8ZW58MHx8fHw%3D&w=1000&q=80",
    "https://images.unsplash.com/photo-1658937632483-e3777b516549?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw3fHx8ZW58MHx8fHw%3D&w=1000&q=80",
    "https://images.unsplash.com/photo-1657299170964-205905bb0940?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxMXx8fGVufDB8fHx8&w=1000&q=80",
    "https://images.unsplash.com/photo-1658928237337-a3347b887602?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxM3x8fGVufDB8fHx8&w=1000&q=80",
    "https://images.unsplash.com/photo-1657299143544-f10ea56fbcd2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxNnx8fGVufDB8fHx8&w=1000&q=80",
    "https://images.unsplash.com/photo-1658905900425-f0a22fc5d024?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxOXx8fGVufDB8fHx8&w=1000&q=80",
    "https://images.unsplash.com/photo-1658871125741-5e82ffd531b6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyMnx8fGVufDB8fHx8&w=1000&q=80",
    "https://images.unsplash.com/photo-1657299143363-621ba0a1e6ac?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHw%3D&w=1000&q=80",
    "https://images.unsplash.com/photo-1658786335116-369505985304?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fHw%3D&w=1000&q=80",
    "https://images.unsplash.com/photo-1658830123727-4febcf91ec80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzfHx8ZW58MHx8fHw%3D&w=1000&q=80",
    "https://images.unsplash.com/photo-1658934475116-990b909c3038?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0fHx8ZW58MHx8fHw%3D&w=1000&q=80",
    "https://images.unsplash.com/photo-1658867835488-611ad1af15cc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1fHx8ZW58MHx8fHw%3D&w=1000&q=80",
    "https://images.unsplash.com/photo-1657299143322-934f44698807?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHw2fHx8ZW58MHx8fHw%3D&w=1000&q=80",
    "https://images.unsplash.com/photo-1658937632483-e3777b516549?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw3fHx8ZW58MHx8fHw%3D&w=1000&q=80",
    "https://images.unsplash.com/photo-1658937364065-60f3f6818724?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw4fHx8ZW58MHx8fHw%3D&w=1000&q=80",
    "https://images.unsplash.com/photo-1658856102291-74df9dd0c544?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw5fHx8ZW58MHx8fHw%3D&w=1000&q=80",
    "https://images.unsplash.com/photo-1658728942158-30564d7d6aa6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMHx8fGVufDB8fHx8&w=1000&q=80",
    "https://images.unsplash.com/photo-1657299170964-205905bb0940?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxMXx8fGVufDB8fHx8&w=1000&q=80",
    "https://images.unsplash.com/photo-1658847412035-2ae0d3d5c364?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMnx8fGVufDB8fHx8&w=1000&q=80",
    "https://images.unsplash.com/photo-1658928237337-a3347b887602?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxM3x8fGVufDB8fHx8&w=1000&q=80",
    "https://images.unsplash.com/photo-1658859976257-325eb7ac5fce?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNHx8fGVufDB8fHx8&w=1000&q=80",
    "https://images.unsplash.com/photo-1658928784381-6f68bbcf92f6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNXx8fGVufDB8fHx8&w=1000&q=80",
    "https://images.unsplash.com/photo-1657299143544-f10ea56fbcd2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxNnx8fGVufDB8fHx8&w=1000&q=80",
    "https://images.unsplash.com/photo-1658924288266-4ec20a81969c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxN3x8fGVufDB8fHx8&w=1000&q=80",
    "https://images.unsplash.com/photo-1658927285044-4a29569c57a8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxOHx8fGVufDB8fHx8&w=1000&q=80",
    "https://images.unsplash.com/photo-1658905900425-f0a22fc5d024?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxOXx8fGVufDB8fHx8&w=1000&q=80",
    "https://images.unsplash.com/photo-1658877915390-cbdda4d7e1f5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyMHx8fGVufDB8fHx8&w=1000&q=80",
    "https://images.unsplash.com/photo-1657299156000-2cccaea36b2b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwyMXx8fGVufDB8fHx8&w=1000&q=80",
    "https://images.unsplash.com/photo-1658871125741-5e82ffd531b6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyMnx8fGVufDB8fHx8&w=1000&q=80",
    "https://images.unsplash.com/photo-1658856446922-b3878c5426e4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyM3x8fGVufDB8fHx8&w=1000&q=80",
    "https://images.unsplash.com/photo-1658933864678-9719d4eae248?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyNHx8fGVufDB8fHx8&w=1000&q=80",
  ];
  
  int _limit = 100;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _limit = linkList.length;
    if(!_scrollController.hasClients){
      _getMoreImages();
    }
    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent
        && _currentMax != _limit
        && scrollModifier == true){
        _callMoreImages();
      }
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent
        && scrollModifier == false){
        setState(() {
          scrollModifier = true;
        });
        if(_currentMax == _limit){
          setState(() => _loading = false);
        }else{
          setState(() => _loading = true);
        }
      }
      if(_scrollController.position.pixels < _scrollController.position.maxScrollExtent - 100
        && scrollModifier == true){
        setState(() {
          scrollModifier = false;
        });
      }
    });
  }

  void _getMoreImages(){
    if(_currentMax + 10 <= _limit){
      setState(() {
        _currentMax = _currentMax + 10;
      });
    }else{
      setState(() {
        _currentMax = _currentMax + (_limit - _currentMax);
      });
    }
  }

  void _callMoreImages() async{
    await Future.delayed(Duration(milliseconds: 800));
    _getMoreImages();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              crossAxisCount: 3
            ),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: _currentMax,
            itemBuilder: ((context, index){
                return CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: linkList[index],
                  placeholder: ((context, url) => Container()),
                  imageBuilder: ((context, imageProvider){
                    return GestureDetector(
                      onTap: () => context.goNamed("image", extra: linkList[index]),
                      child: Image(image: imageProvider, fit: BoxFit.cover),
                    );
                  }),
                  errorWidget: ((context, url, e) {
                    return Image.asset("assets/jpg/erorr-image.jpg", fit: BoxFit.cover);
                    }
                  )
                );
            })
          ),
          scrollModifier?
          Container(
            height: 50,
            child: Align(
              alignment: Alignment.center,
              child: _loading?
                CircularProgressIndicator()
                :
                const Text("end of story :(")
            ),
          ):
          Container()
        ],
      ),
    );
  }
}