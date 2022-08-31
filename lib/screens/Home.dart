import 'package:andromotest/BackList.dart';
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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScrollBloc, ScrollState>(
      builder: (context, state){
        return SingleChildScrollView(
          controller: BlocProvider.of<ScrollBloc>(context).scrollController,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text("LOL TEST"),
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
                    List<String> list = BackList.linkList;
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
          ),
        );
      }
    );
  }
}