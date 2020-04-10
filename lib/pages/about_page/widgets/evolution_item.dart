import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/models/pokeapi.dart';
import 'package:pokedex/models/specie.dart';
import 'package:pokedex/stores/pokeapi_store.dart';
import 'package:pokedex/stores/pokeapiv2_store.dart';

class EvolutionItem extends StatelessWidget {
  final PokeApiStore _pokeApiStore = GetIt.instance<PokeApiStore>();
  final PokeApiV2Store _pokeApiV2Store = GetIt.instance<PokeApiV2Store>();

  List<Widget> getEvolutions() {
    Pokemon pokemon = _pokeApiStore.pokemonAtual;
    List<Widget> _evolutions = [];
    Widget _getPokemonImage(String num) => _pokeApiStore.getImage(
          numero: num,
          width: 80,
          height: 80,
          alignment: Alignment.center,
        );

    Widget _getPokemonName(String name) => Padding(
          padding: const EdgeInsets.only(top: 6, bottom: 8),
          child: Text(
            name,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
    if (pokemon.prevEvolution != null) {
      pokemon.prevEvolution.forEach((f) {
        _evolutions.add(_getPokemonImage(f.num));
        _evolutions.add(_getPokemonName(f.name));
        _evolutions.add(Icon(Icons.keyboard_arrow_down));
      });
    }
    _evolutions.add(_getPokemonImage(pokemon.num));
    _evolutions.add(_getPokemonName(pokemon.name));
    if (pokemon.nextEvolution != null) {
      pokemon.nextEvolution.forEach((f) {
        _evolutions.add(Icon(Icons.keyboard_arrow_down));
        _evolutions.add(_getPokemonImage(f.num));
        _evolutions.add(_getPokemonName(f.name));
      });
    }
    return _evolutions;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 20,
        ),
        child: Observer(
          builder: (context) {
            Specie _specie = _pokeApiV2Store.specie;
            Pokemon _pokeData = _pokeApiStore.pokemonAtual;
            return _specie == null || _pokeData == null
                ? Container(
                    alignment: Alignment.topCenter,
                    height: 15,
                    width: 15,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          _pokeApiStore.corPokemon),
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: getEvolutions(),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
