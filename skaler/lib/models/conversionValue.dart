
class ConversionValue {
  double value = 0;
  Unit valueUnit = Unit.meters;

  ConversionValue({this.value: 0, this.valueUnit: Unit.meters});

  void shiftAddNumber(int num){
    value = value*10 + num;
  }

  void convertFrom(ConversionValue val, double f){
    setValueInMeter(val.getValueInMeter() * f);
  }

  double getValueInMeter(){
    return value * _getFactor(valueUnit);
  }
  
  void setValueInMeter(double val){
    value = val * 1/_getFactor(valueUnit);
  }

  //Private Functions

  double _getFactor(Unit u){
    switch(u){
      case Unit.kilometers: return 1000;
      case Unit.meters: return 1;
      case Unit.centimeters: return 1/1000;
      case Unit.millimeters: return 1/1000000;
    }
    return 1;
  }
}

enum Unit{
  kilometers,
  meters,
  centimeters,
  millimeters
}