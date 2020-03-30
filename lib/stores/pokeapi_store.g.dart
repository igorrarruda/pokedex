// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokeapi_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokeApiStore on _PokeApiStoreBase, Store {
  Computed<PokeAPI> _$pokeAPIComputed;

  @override
  PokeAPI get pokeAPI =>
      (_$pokeAPIComputed ??= Computed<PokeAPI>(() => super.pokeAPI)).value;
  Computed<Pokemon> _$pokemonAtualComputed;

  @override
  Pokemon get pokemonAtual =>
      (_$pokemonAtualComputed ??= Computed<Pokemon>(() => super.pokemonAtual))
          .value;
  Computed<Color> _$corPokemonComputed;

  @override
  Color get corPokemon =>
      (_$corPokemonComputed ??= Computed<Color>(() => super.corPokemon)).value;

  final _$_pokeAPIAtom = Atom(name: '_PokeApiStoreBase._pokeAPI');

  @override
  PokeAPI get _pokeAPI {
    _$_pokeAPIAtom.context.enforceReadPolicy(_$_pokeAPIAtom);
    _$_pokeAPIAtom.reportObserved();
    return super._pokeAPI;
  }

  @override
  set _pokeAPI(PokeAPI value) {
    _$_pokeAPIAtom.context.conditionallyRunInAction(() {
      super._pokeAPI = value;
      _$_pokeAPIAtom.reportChanged();
    }, _$_pokeAPIAtom, name: '${_$_pokeAPIAtom.name}_set');
  }

  final _$_pokemonAtualAtom = Atom(name: '_PokeApiStoreBase._pokemonAtual');

  @override
  Pokemon get _pokemonAtual {
    _$_pokemonAtualAtom.context.enforceReadPolicy(_$_pokemonAtualAtom);
    _$_pokemonAtualAtom.reportObserved();
    return super._pokemonAtual;
  }

  @override
  set _pokemonAtual(Pokemon value) {
    _$_pokemonAtualAtom.context.conditionallyRunInAction(() {
      super._pokemonAtual = value;
      _$_pokemonAtualAtom.reportChanged();
    }, _$_pokemonAtualAtom, name: '${_$_pokemonAtualAtom.name}_set');
  }

  final _$_corPokemonAtom = Atom(name: '_PokeApiStoreBase._corPokemon');

  @override
  Color get _corPokemon {
    _$_corPokemonAtom.context.enforceReadPolicy(_$_corPokemonAtom);
    _$_corPokemonAtom.reportObserved();
    return super._corPokemon;
  }

  @override
  set _corPokemon(Color value) {
    _$_corPokemonAtom.context.conditionallyRunInAction(() {
      super._corPokemon = value;
      _$_corPokemonAtom.reportChanged();
    }, _$_corPokemonAtom, name: '${_$_corPokemonAtom.name}_set');
  }

  final _$posicaoAtualAtom = Atom(name: '_PokeApiStoreBase.posicaoAtual');

  @override
  int get posicaoAtual {
    _$posicaoAtualAtom.context.enforceReadPolicy(_$posicaoAtualAtom);
    _$posicaoAtualAtom.reportObserved();
    return super.posicaoAtual;
  }

  @override
  set posicaoAtual(int value) {
    _$posicaoAtualAtom.context.conditionallyRunInAction(() {
      super.posicaoAtual = value;
      _$posicaoAtualAtom.reportChanged();
    }, _$posicaoAtualAtom, name: '${_$posicaoAtualAtom.name}_set');
  }

  final _$_PokeApiStoreBaseActionController =
      ActionController(name: '_PokeApiStoreBase');

  @override
  dynamic fetchPokemonList() {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction();
    try {
      return super.fetchPokemonList();
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPokemonAtual({int index}) {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction();
    try {
      return super.setPokemonAtual(index: index);
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Widget getImage(
      {String numero,
      double width,
      double height,
      Color color,
      Alignment alignment}) {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction();
    try {
      return super.getImage(
          numero: numero,
          width: width,
          height: height,
          color: color,
          alignment: alignment);
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'posicaoAtual: ${posicaoAtual.toString()},pokeAPI: ${pokeAPI.toString()},pokemonAtual: ${pokemonAtual.toString()},corPokemon: ${corPokemon.toString()}';
    return '{$string}';
  }
}
