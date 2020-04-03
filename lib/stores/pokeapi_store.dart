import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/consts/consts_api.dart';
import 'package:pokedex/consts/consts_app.dart';
import 'package:pokedex/models/pokeapi.dart';
part 'pokeapi_store.g.dart';

class PokeApiStore = _PokeApiStoreBase with _$PokeApiStore;

abstract class _PokeApiStoreBase with Store {
  @observable
  PokeAPI _pokeAPI;

  @observable
  Pokemon _pokemonAtual;

  @observable
  Color _corPokemon;

  @observable
  int posicaoAtual;

  @computed
  PokeAPI get pokeAPI => _pokeAPI;

  @computed
  Pokemon get pokemonAtual => _pokemonAtual;

  @computed
  Color get corPokemon => _corPokemon;

  @action
  fetchPokemonList() {
    _pokeAPI = null;
    loadPokeApi().then((pokeList) {
      _pokeAPI = pokeList;
    });
  }

  Pokemon getPokemon({int index}) {
    return _pokeAPI.pokemon[index];
  }

  @action
  void setPokemonAtual({int index}) {
    _pokemonAtual = _pokeAPI.pokemon[index];
    _corPokemon = ConstsApp.getColorType(type: _pokemonAtual.type[0]);
    posicaoAtual = index;
  }

  @action
  Widget getImage({
    String numero,
    double width,
    double height,
    Color color,
    Alignment alignment,
  }) {
    return CachedNetworkImage(
      placeholder: (contex, index) => new Container(
        color: Colors.transparent,
      ),
      width: width,
      height: height,
      color: color,
      alignment: alignment,
      imageUrl:
          'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/$numero.png',
    );
  }

  Future<PokeAPI> loadPokeApi() async {
    try {
      final response = await http.get(ConstsApi.pokeapiURL);
      var decodeJson = jsonDecode(response.body);
      return PokeAPI.fromJson(decodeJson);
    } catch (error, stacktrace) {
      print("Erro ao carregar a lista" + stacktrace.toString());
      return null;
    }
  }
}
