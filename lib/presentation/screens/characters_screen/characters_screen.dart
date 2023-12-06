import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/business_logic/cubit/characters_cubit.dart';
import 'package:rick_and_morty/presentation/widgets/all_chars_screen/characters_list_widget.dart';
import 'package:rick_and_morty/presentation/widgets/common/loading_indicator.dart';

import '../../widgets/all_chars_screen/search_bar.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacters(null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: _isSearching
            ? SearchBarWidget(onChange: (String text) => BlocProvider.of<CharactersCubit>(context).getAllCharacters(text))
            : const Text(
                "Characters",
                style: TextStyle(color: Colors.white),
                maxLines: 1,
              ),

        leading: _isSearching ?
            IconButton(onPressed: (){
              setState(() {
                _isSearching = false;
              });
            }, icon: const Icon(Icons.arrow_back_rounded,color: Colors.white,))
            : const SizedBox(width: 0,height: 0,)
        ,
        actions: [
          _isSearching ?
          IconButton(onPressed: (){
            setState(() {
              _isSearching = false;
              BlocProvider.of<CharactersCubit>(context).getAllCharacters(null);
            });
          }, icon: const Icon(Icons.cancel_outlined,color: Colors.white,))
              :
          IconButton(onPressed: (){
            setState(() {
              _isSearching = true;
            });
          }, icon: const Icon(Icons.search,color: Colors.white,))
          ,
        ],
      ),
      body: BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) {
          if (state is CharactersLoaded) {
            return CharactersListWidget(state.data!.results);
          } else {
            return const AppLoadingIndicator();
          }
        },
      ),
    );
  }
}
