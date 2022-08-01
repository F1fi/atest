import 'package:andromotest/BackList.dart';
import 'package:andromotest/bloc/ScrollEvent.dart';
import 'package:andromotest/bloc/ScrollState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScrollBloc extends Bloc<ScrollEvent, ScrollState>{
  ScrollBloc() : super(ScrollState(currentMax: 10, modifier: false)){
    on<UpdateScrollEvent>(_updateList);
    on<FastLoadScrollEvent>(_fastLoad);
    on<ModifierScrollEvent>(_modifierList);
    if(!scrollController.hasClients){
      _fastLoad(FastLoadScrollEvent(), emit);
    }
    scrollController.addListener(() {
      if(scrollController.position.pixels == scrollController.position.maxScrollExtent
        && currentMax < BackList.linkList.length
        && scrollModifier == true){
          _updateList(UpdateScrollEvent(), emit);
      }
      if(scrollController.position.pixels < scrollController.position.maxScrollExtent - 50
        && scrollModifier == true){
          _modifierList(ModifierScrollEvent(false), emit);
      }
      if(scrollController.position.pixels == scrollController.position.maxScrollExtent
        && scrollModifier == false){
          _modifierList(ModifierScrollEvent(true), emit);
      }
    });
  }

  final scrollController = ScrollController();
  bool scrollModifier = false;
  int currentMax = 10;

  void _modifierList(ModifierScrollEvent event, emit){
    scrollModifier = true;
    emit(ScrollState(
      currentMax: currentMax,
      modifier: event.modifier,
      loading: currentMax < BackList.linkList.length
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
      modifier: false,
      loading: currentMax < BackList.linkList.length
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
    int limit = BackList.linkList.length;
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