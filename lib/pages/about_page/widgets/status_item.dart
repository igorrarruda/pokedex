import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/models/pokeapi.dart';
import 'package:pokedex/models/pokeapiv2.dart';
import 'package:pokedex/models/specie.dart';
import 'package:pokedex/stores/pokeapi_store.dart';
import 'package:pokedex/stores/pokeapiv2_store.dart';

class StatusItem extends StatelessWidget {
  final PokeApiStore _pokeApiStore = GetIt.instance<PokeApiStore>();
  final PokeApiV2Store _pokeApiV2Store = GetIt.instance<PokeApiV2Store>();

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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: _stats(context, _pokeApiV2Store.pokeApiV2),
                    ),
                  );
          },
        ),
      ),
    );
  }

  List<Widget> _stats(BuildContext context, PokeApiV2 pokeApiV2) {
    List<Widget> _items = [];
    int total = 0;
    pokeApiV2.stats.forEach((f) {
      double factor = f.baseStat / 160;
      total += f.baseStat;
      switch (f.stat.name) {
        case 'speed':
          _items.add(_statItem(context, "Velocidade", f.baseStat, factor));
          break;
        case 'special-defense':
          _items.add(_statItem(context, "Sp. Def.", f.baseStat, factor));
          break;
        case 'special-attack':
          _items.add(_statItem(context, "Sp. Atq.", f.baseStat, factor));
          break;
        case 'defense':
          _items.add(_statItem(context, "Defesa", f.baseStat, factor));
          break;
        case 'attack':
          _items.add(_statItem(context, "Ataque", f.baseStat, factor));
          break;
        case 'hp':
          _items.add(_statItem(context, "HP", f.baseStat, factor));
          break;
      }
    });
    _items.add(_statItem(context, "Total", total, total / 960));
    return _items;
  }

  Widget _statItem(
      BuildContext context, String stat, int value, double factor) {
    // double factor = value / 160;
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 80,
            child: Text(
              stat,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[800],
              ),
            ),
          ),
          Text(
            value.toString(),
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 19,
            child: Center(
              child: Container(
                height: 4,
                // width: 100,
                width: MediaQuery.of(context).size.width * .5,
                alignment: Alignment.centerLeft,
                decoration: ShapeDecoration(
                  shape: StadiumBorder(),
                  color: Colors.grey,
                ),
                child: FractionallySizedBox(
                  widthFactor: factor,
                  heightFactor: 1,
                  child: Container(
                    decoration: ShapeDecoration(
                      shape: StadiumBorder(),
                      color: factor > .5 ? Colors.green : Colors.red,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
