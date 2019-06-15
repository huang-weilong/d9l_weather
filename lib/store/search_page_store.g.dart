// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$SearchPageStore on SearchPageBase, Store {
  final _$cityListAtom = Atom(name: 'SearchPageBase.cityList');

  @override
  List<Basic> get cityList {
    _$cityListAtom.reportObserved();
    return super.cityList;
  }

  @override
  set cityList(List<Basic> value) {
    _$cityListAtom.context.checkIfStateModificationsAreAllowed(_$cityListAtom);
    super.cityList = value;
    _$cityListAtom.reportChanged();
  }

  final _$SearchPageBaseActionController =
      ActionController(name: 'SearchPageBase');

  @override
  void setCityList(List<Basic> list) {
    final _$actionInfo = _$SearchPageBaseActionController.startAction();
    try {
      return super.setCityList(list);
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
