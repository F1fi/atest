import 'package:andromotest/bloc/ScrollEvent.dart';
import 'package:andromotest/bloc/ScrollBloc.dart';
import 'package:andromotest/bloc/ScrollState.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  @override
  void initState() {
    super.initState();
    final int limit = BlocProvider.of<ScrollBloc>(context).linkList.length;
    if(!_scrollController.hasClients){
      BlocProvider.of<ScrollBloc>(context).add(FastLoadScrollEvent());
    }
    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent
        && _currentMax < limit
        && scrollModifier == true){
          print("add more");
          BlocProvider.of<ScrollBloc>(context).add(UpdateScrollEvent());
          _currentMax = _currentMax + 10;
      }
      if(_scrollController.position.pixels < _scrollController.position.maxScrollExtent - 100
        && scrollModifier == true){
          print("remove modifier");
          scrollModifier = false;
          BlocProvider.of<ScrollBloc>(context).add(ModifierScrollEvent(scrollModifier));
      }
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent
        && scrollModifier == false){
          print("add modifier");
          scrollModifier = true;
          BlocProvider.of<ScrollBloc>(context).add(ModifierScrollEvent(scrollModifier));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: BlocBuilder<ScrollBloc, ScrollState>(
        builder: (context, state){
          return Column(
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
                itemCount: state.currentMax,
                itemBuilder: ((context, index){
                    List<String> list = BlocProvider.of<ScrollBloc>(context).linkList;
                    return CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: list[index],
                      placeholder: ((context, url) => Container()),
                      imageBuilder: ((context, imageProvider){
                        return GestureDetector(
                          onTap: () => context.goNamed("image", extra: list[index]),
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
              state.modifier?
              SizedBox(
                height: 50,
                child: Align(
                  alignment: Alignment.center,
                  child: state.loading?
                    const CircularProgressIndicator()
                    :
                    const Text("end of story :(")
                ),
              ):
              Container()
            ],
          );
        }
      ),
    );
  }
}