// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchPageStore on SearchPageBase, Store {
  final _$cityListAtom = Atom(name: 'SearchPageBase.cityList');

  @override
  ObservableList<Basic> get cityList {
    _$cityListAtom.context.enforceReadPolicy(_$cityListAtom);
    _$cityListAtom.reportObserved();
    return super.cityList;
  }

  @override
  set cityList(ObservableList<Basic> value) {
    _$cityListAtom.context.conditionallyRunInAction(() {
      super.cityList = value;
      _$cityListAtom.reportChanged();
    }, _$cityListAtom, name: '${_$cityListAtom.name}_set');
  }

  final _$SearchPageBaseActionController =
      ActionController(name: 'SearchPageBase');

  @override
  void addCity(Basic city) {
    final _$actionInfo = _$SearchPageBaseActionController.startAction();
    try {
      return super.addCity(city);
    } finally {
      _$SearchPageBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearCityList() {
    final _$actionInfo = _$SearchPageBaseActionController.startAction();
    try {
      return super.clearCityList();
    } finally {
      _$SearchPageBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getCityList(String v) {
    final _$actionInfo = _$SearchPageBaseActionController.startAction();
    try {
      return super.getCityList(v);
    } finally {
      _$SearchPageBaseActionController.endAction(_$actionInfo);
    }
  }
}
