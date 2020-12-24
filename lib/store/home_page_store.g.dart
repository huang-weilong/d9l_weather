// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomePageStore on HomePageBase, Store {
  final _$basicAtom = Atom(name: 'HomePageBase.basic');

  @override
  Basic get basic {
    _$basicAtom.reportRead();
    return super.basic;
  }

  @override
  set basic(Basic value) {
    _$basicAtom.reportWrite(value, super.basic, () {
      super.basic = value;
    });
  }

  final _$updateAtom = Atom(name: 'HomePageBase.update');

  @override
  Update get update {
    _$updateAtom.reportRead();
    return super.update;
  }

  @override
  set update(Update value) {
    _$updateAtom.reportWrite(value, super.update, () {
      super.update = value;
    });
  }

  final _$nowAtom = Atom(name: 'HomePageBase.now');

  @override
  Now get now {
    _$nowAtom.reportRead();
    return super.now;
  }

  @override
  set now(Now value) {
    _$nowAtom.reportWrite(value, super.now, () {
      super.now = value;
    });
  }

  final _$dailyForecastListAtom = Atom(name: 'HomePageBase.dailyForecastList');

  @override
  ObservableList<DailyForecast> get dailyForecastList {
    _$dailyForecastListAtom.reportRead();
    return super.dailyForecastList;
  }

  @override
  set dailyForecastList(ObservableList<DailyForecast> value) {
    _$dailyForecastListAtom.reportWrite(value, super.dailyForecastList, () {
      super.dailyForecastList = value;
    });
  }

  final _$lifeStyleListAtom = Atom(name: 'HomePageBase.lifeStyleList');

  @override
  ObservableList<LifeStyle> get lifeStyleList {
    _$lifeStyleListAtom.reportRead();
    return super.lifeStyleList;
  }

  @override
  set lifeStyleList(ObservableList<LifeStyle> value) {
    _$lifeStyleListAtom.reportWrite(value, super.lifeStyleList, () {
      super.lifeStyleList = value;
    });
  }

  final _$airQualityAtom = Atom(name: 'HomePageBase.airQuality');

  @override
  AirQuality get airQuality {
    _$airQualityAtom.reportRead();
    return super.airQuality;
  }

  @override
  set airQuality(AirQuality value) {
    _$airQualityAtom.reportWrite(value, super.airQuality, () {
      super.airQuality = value;
    });
  }

  final _$getWeatherAsyncAction = AsyncAction('HomePageBase.getWeather');

  @override
  Future<bool> getWeather() {
    return _$getWeatherAsyncAction.run(() => super.getWeather());
  }

  @override
  String toString() {
    return '''
basic: ${basic},
update: ${update},
now: ${now},
dailyForecastList: ${dailyForecastList},
lifeStyleList: ${lifeStyleList},
airQuality: ${airQuality}
    ''';
  }
}
