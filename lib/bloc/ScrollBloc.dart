import 'package:andromotest/bloc/ScrollEvent.dart';
import 'package:andromotest/bloc/ScrollState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScrollBloc extends Bloc<ScrollEvent, ScrollState>{
  ScrollBloc() : super(ScrollState(currentMax: 10, modifier: false)){
    on<UpdateScrollEvent>(_updateList);
    on<FastLoadScrollEvent>(_fastLoad);
    on<ModifierScrollEvent>(_modifierList);
  }

  final List<String> linkList = [
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
  
  int currentMax = 10;

  void _modifierList(ModifierScrollEvent event, emit){
    emit(ScrollState(
      currentMax: currentMax,
      modifier: event.modifier,
      loading: currentMax < linkList.length
    ));
  }

  void _updateList(UpdateScrollEvent event, emit) async{
    emit(ScrollState(
      currentMax: currentMax,
      loading: true,
      modifier: true
    ));
    await _callMoreImages();
    emit(ScrollState(
      currentMax: currentMax,
      modifier: true,
      loading: false
    ));
  }
  
  void _fastLoad(FastLoadScrollEvent event, emit) async{
    _getMoreImages();
    emit(ScrollState(
      currentMax: currentMax,
      modifier: false
    ));
  }

  void _getMoreImages(){
    int limit = linkList.length;
    if(currentMax + 10 < limit){
      currentMax = currentMax + 10;
    }else{
      currentMax = currentMax + (limit - currentMax);
    }
  }

  Future<void> _callMoreImages() async{
    await Future.delayed(const Duration(milliseconds: 800));
    _getMoreImages();
  }
  
}