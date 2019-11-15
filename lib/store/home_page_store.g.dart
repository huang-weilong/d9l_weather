// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomePageStore on HomePageBase, Store {
  final _$isNoNetworkAtom = Atom(name: 'HomePageBase.isNoNetwork');

  @override
  bool get isNoNetwork {
    _$isNoNetworkAtom.context.enforceReadPolicy(_$isNoNetworkAtom);
    _$isNoNetworkAtom.reportObserved();
    return super.isNoNetwork;
  }

  @override
  set isNoNetwork(bool value) {
    _$isNoNetworkAtom.context.conditionallyRunInAction(() {
      super.isNoNetwork = value;
      _$isNoNetworkAtom.reportChanged();
    }, _$isNoNetworkAtom, name: '${_$isNoNetworkAtom.name}_set');
  }

  final _$cidAtom = Atom(name: 'HomePageBase.cid');

  @override
  String get cid {
    _$cidAtom.context.enforceReadPolicy(_$cidAtom);
    _$cidAtom.reportObserved();
    return super.cid;
  }

  @override
  set cid(String value) {
    _$cidAtom.context.conditionallyRunInAction(() {
      super.cid = value;
      _$cidAtom.reportChanged();
    }, _$cidAtom, name: '${_$cidAtom.name}_set');
  }

  final _$realTimeWeatherAtom = Atom(name: 'HomePageBase.realTimeWeather');

  @override
  RealTimeWeather get realTimeWeather {
    _$realTimeWeatherAtom.context.enforceReadPolicy(_$realTimeWeatherAtom);
    _$realTimeWeatherAtom.reportObserved();
    return super.realTimeWeather;
  }

  @override
  set realTimeWeather(RealTimeWeather value) {
    _$realTimeWeatherAtom.context.conditionallyRunInAction(() {
      super.realTimeWeather = value;
      _$realTimeWeatherAtom.reportChanged();
    }, _$realTimeWeatherAtom, name: '${_$realTimeWeatherAtom.name}_set');
  }

  final _$dailyForecastListAtom = Atom(name: 'HomePageBase.dailyForecastList');

  @override
  ObservableList<DailyForecast> get dailyForecastList {
    _$dailyForecastListAtom.context.enforceReadPolicy(_$dailyForecastListAtom);
    _$dailyForecastListAtom.reportObserved();
    return super.dailyForecastList;
  }

  @override
  set dailyForecastList(ObservableList<DailyForecast> value) {
    _$dailyForecastListAtom.context.conditionallyRunInAction(() {
      super.dailyForecastList = value;
      _$dailyForecastListAtom.reportChanged();
    }, _$dailyForecastListAtom, name: '${_$dailyForecastListAtom.name}_set');
  }

  final _$updateWeatherAsyncAction = AsyncAction('updateWeather');

  @override
  Future<void> updateWeather(String cid) {
    return _$updateWeatherAsyncAction.run(() => super.updateWeather(cid));
  }

  final _$HomePageBaseActionController = ActionController(name: 'HomePageBase');

  @override
  void setNetworkStatus(bool value) {
    final _$actionInfo = _$HomePageBaseActionController.startAction();
    try {
      return super.setNetworkStatus(value);
    } finally {
      _$HomePageBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCid(String cid) {
    final _$actionInfo = _$HomePageBaseActionController.startAction();
    try {
      return super.setCid(cid);
    } finally {
      _$HomePageBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRealTimeWeather(RealTimeWeather value) {
    final _$actionInfo = _$HomePageBaseActionController.startAction();
    try {
      return super.setRealTimeWeather(value);
    } finally {
      _$HomePageBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addDailyForecast(DailyForecast value) {
    final _$actionInfo = _$HomePageBaseActionController.startAction();
    try {
      return super.addDailyForecast(value);
    } finally {
      _$HomePageBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearDailyForecast() {
    final _$actionInfo = _$HomePageBaseActionController.startAction();
    try {
      return super.clearDailyForecast();
    } finally {
      _$HomePageBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _setEmptyData(String title) {
    final _$actionInfo = _$HomePageBaseActionController.startAction();
    try {
      return super._setEmptyData(title);
    } finally {
      _$HomePageBaseActionController.endAction(_$actionInfo);
    }
  }
}
