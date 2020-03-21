// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomePageStore on HomePageBase, Store {
  final _$basicAtom = Atom(name: 'HomePageBase.basic');

  @override
  Basic get basic {
    _$basicAtom.context.enforceReadPolicy(_$basicAtom);
    _$basicAtom.reportObserved();
    return super.basic;
  }

  @override
  set basic(Basic value) {
    _$basicAtom.context.conditionallyRunInAction(() {
      super.basic = value;
      _$basicAtom.reportChanged();
    }, _$basicAtom, name: '${_$basicAtom.name}_set');
  }

  final _$updateAtom = Atom(name: 'HomePageBase.update');

  @override
  Update get update {
    _$updateAtom.context.enforceReadPolicy(_$updateAtom);
    _$updateAtom.reportObserved();
    return super.update;
  }

  @override
  set update(Update value) {
    _$updateAtom.context.conditionallyRunInAction(() {
      super.update = value;
      _$updateAtom.reportChanged();
    }, _$updateAtom, name: '${_$updateAtom.name}_set');
  }

  final _$nowAtom = Atom(name: 'HomePageBase.now');

  @override
  Now get now {
    _$nowAtom.context.enforceReadPolicy(_$nowAtom);
    _$nowAtom.reportObserved();
    return super.now;
  }

  @override
  set now(Now value) {
    _$nowAtom.context.conditionallyRunInAction(() {
      super.now = value;
      _$nowAtom.reportChanged();
    }, _$nowAtom, name: '${_$nowAtom.name}_set');
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

  final _$lifeStyleListAtom = Atom(name: 'HomePageBase.lifeStyleList');

  @override
  ObservableList<LifeStyle> get lifeStyleList {
    _$lifeStyleListAtom.context.enforceReadPolicy(_$lifeStyleListAtom);
    _$lifeStyleListAtom.reportObserved();
    return super.lifeStyleList;
  }

  @override
  set lifeStyleList(ObservableList<LifeStyle> value) {
    _$lifeStyleListAtom.context.conditionallyRunInAction(() {
      super.lifeStyleList = value;
      _$lifeStyleListAtom.reportChanged();
    }, _$lifeStyleListAtom, name: '${_$lifeStyleListAtom.name}_set');
  }

  final _$airQualityAtom = Atom(name: 'HomePageBase.airQuality');

  @override
  AirQuality get airQuality {
    _$airQualityAtom.context.enforceReadPolicy(_$airQualityAtom);
    _$airQualityAtom.reportObserved();
    return super.airQuality;
  }

  @override
  set airQuality(AirQuality value) {
    _$airQualityAtom.context.conditionallyRunInAction(() {
      super.airQuality = value;
      _$airQualityAtom.reportChanged();
    }, _$airQualityAtom, name: '${_$airQualityAtom.name}_set');
  }

  final _$getWeatherAsyncAction = AsyncAction('getWeather');

  @override
  Future<bool> getWeather() {
    return _$getWeatherAsyncAction.run(() => super.getWeather());
  }
}
