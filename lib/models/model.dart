// 基础信息
class Basic {
  String cid; // 地区/城市ID
  String location; // 地区/城市名称
  String parentCity; // 该地区/城市的上级城市
  String adminArea; // 该地区/城市所属行政区域
  String cnty; // 该地区/城市所属国家名称
  String lat; // 地区/城市纬度
  String lon; // 地区/城市经度
  String tz; // 该地区/城市所在时区

  Basic({
    this.cid,
    this.location,
    this.parentCity,
    this.adminArea,
    this.cnty,
    this.lat,
    this.lon,
    this.tz,
  });

  Basic.fromJson(Map<String, dynamic> json)
      : cid = json['cid'],
        location = json['location'],
        parentCity = json['parent_city'],
        adminArea = json['admin_area'],
        cnty = json['cnty'],
        lat = json['lat'],
        lon = json['lon'],
        tz = json['tz'];
}

// 接口更新时间
class Update {
  String loc; // 当地时间，24小时制，格式yyyy-MM-dd HH:mm
  String utc; // UTC时间，24小时制，格式yyyy-MM-dd HH:mm

  Update({this.loc, this.utc});

  Update.fromJson(Map<String, dynamic> json)
      : loc = json['loc'],
        utc = json['utc'];
}

// 实况天气
class Now {
  String cloud; // 云量
  String condCode; // 实况天气状况代码
  String condTxt; // 实况天气状况描述
  String fl; // 体感温度，默认单位：摄氏度
  String hum; // 相对湿度
  String pcpn; // 降水量
  String pres; // 大气压强
  String tmp; // 温度，默认单位：摄氏度
  String vis; // 能见度，默认单位：公里
  String windDeg; // 风向360角度
  String windDir; // 风向
  String windSc; // 风力
  String windSpd; // 风速，公里/小时

  Now({
    this.cloud,
    this.condCode,
    this.condTxt,
    this.fl,
    this.hum,
    this.pcpn,
    this.pres,
    this.tmp,
    this.vis,
    this.windDeg,
    this.windDir,
    this.windSc,
    this.windSpd,
  });

  Now.fromJson(Map<String, dynamic> json)
      : cloud = json['cloud'],
        condCode = json['cond_code'],
        condTxt = json['cond_txt'],
        fl = json['fl'],
        hum = json['hum'],
        pcpn = json['pcpn'],
        pres = json['pres'],
        tmp = json['tmp'],
        vis = json['vis'],
        windDeg = json['wind_deg'],
        windDir = json['wind_dir'],
        windSc = json['wind_sc'],
        windSpd = json['wind_spd'];
}

// 每日预测
class DailyForecast {
  String condCodeD;
  String condCodeN;
  String condTxtD; // 白天天气状况描述
  String condTxtN; // 夜间天气状况描述
  String date;
  String hum;
  String mr;
  String ms;
  String pcpn;
  String pop;
  String pres;
  String sr;
  String ss;
  String tmpMax; // 最高温度
  String tmpMin; // 最低温度
  String uvIndex;
  String vis;
  String windDeg;
  String windDir;
  String windSc;
  String windSpd;

  DailyForecast({
    this.condCodeD,
    this.condCodeN,
    this.condTxtD,
    this.condTxtN,
    this.date,
    this.hum,
    this.mr,
    this.ms,
    this.pcpn,
    this.pop,
    this.pres,
    this.sr,
    this.ss,
    this.tmpMax,
    this.tmpMin,
    this.uvIndex,
    this.vis,
    this.windDeg,
    this.windDir,
    this.windSc,
    this.windSpd,
  });

  DailyForecast.fromJson(Map<String, dynamic> json)
      : condCodeD = json['cond_code_d'],
        condCodeN = json['cond_code_n'],
        condTxtD = json['cond_txt_d'],
        condTxtN = json['cond_txt_n'],
        date = json['date'],
        hum = json['hum'],
        mr = json['mr'],
        ms = json['ms'],
        pcpn = json['pcpn'],
        pop = json['pop'],
        pres = json['pres'],
        sr = json['sr'],
        ss = json['ss'],
        tmpMax = json['tmp_max'],
        tmpMin = json['tmp_min'],
        uvIndex = json['uv_index'],
        vis = json['vis'],
        windDeg = json['wind_deg'],
        windDir = json['wind_dir'],
        windSc = json['wind_sc'],
        windSpd = json['wind_spd'];
}

// 生活指数
class LifeStyle {
  String type; // 生活指数类型
  String brf; // 生活指数简介
  String txt; // 生活指数详细描述

  LifeStyle({this.type, this.brf, this.txt});

  LifeStyle.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        brf = json['brf'],
        txt = json['txt'];
}

// 空气质量
class AirQuality {
  String aqi; // 空气质量指数
  String qlty; //空气质量
  String main; // 主要污染物
  String pm25;
  String pm10;
  String no2;
  String so2;
  String co;
  String o3;
  String pubTime;

  AirQuality({
    this.aqi,
    this.qlty,
    this.main,
    this.pm25,
    this.pm10,
    this.no2,
    this.so2,
    this.co,
    this.o3,
    this.pubTime,
  });

  AirQuality.fromJson(Map<String, dynamic> json)
      : aqi = json['aqi'],
        qlty = json['qlty'],
        main = json['main'],
        pm25 = json['pm25'],
        pm10 = json['pm10'],
        no2 = json['no2'],
        so2 = json['so2'],
        co = json['co'],
        o3 = json['o3'],
        pubTime = json['pub_time'];
}
