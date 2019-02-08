class Scale{
  final int scaler;
  final bool fromMetric;
  final bool toMetric; 

  Scale(this.scaler,{this.fromMetric: true, this.toMetric: true});

  Scale.fromJson(Map<String,dynamic> j):scaler = j["scaler"] as int, fromMetric = j["fromMetric"] as bool, toMetric = j["toMetric"] as bool;

  Map<String,dynamic> toJson() => {
    "scaler": scaler,
    "fromMetric": fromMetric,
    "toMetric": toMetric,
  };
}