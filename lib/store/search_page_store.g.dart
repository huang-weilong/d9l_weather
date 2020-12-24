// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchPageStore on SearchPageBase, Store {
  final _$cityListAtom = Atom(name: 'SearchPageBase.cityList');

  @override
  ObservableList<Basic> get cityList {
    _$cityListAtom.reportRead();
    return super.cityList;
  }

  @override
  set cityList(ObservableList<Basic> value) {
    _$cityListAtom.reportWrite(value, super.cityList, () {
      super.cityList = value;
    });
  }

  final _$getCityListAsyncAction = AsyncAction('SearchPageBase.getCityList');

  @override
  Future<dynamic> getCityList(String v) {
    return _$getCityListAsyncAction.run(() => super.getCityList(v));
  }

  @override
  String toString() {
    return '''
cityList: ${cityList}
    ''';
  }
}
