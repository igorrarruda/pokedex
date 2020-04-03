import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/models/pokeapi.dart';
import 'package:pokedex/models/specie.dart';
import 'package:pokedex/pages/about_page/widgets/biology_data.dart';
import 'package:pokedex/stores/pokeapi_store.dart';
import 'package:pokedex/stores/pokeapiv2_store.dart';

class AboutItem extends StatelessWidget {
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
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Descrição",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        _specie.flavorTextEntries
                            .where(
                                (descricao) => descricao.language.name == 'en')
                            .first
                            .flavorText,
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(height: 15),
                      Text(
                        "Biologia",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      BiologyData(
                        description: 'Espécie',
                        value: _specie.genera
                            .where((gen) => gen.language.name == 'en')
                            .first
                            .genus,
                      ),
                      BiologyData(
                        description: 'Altura',
                        value: _pokeData.height,
                      ),
                      BiologyData(
                        description: 'Peso',
                        value: _pokeData.weight,
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
