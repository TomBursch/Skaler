class Unit{
  static const int kilometers = 0;
  static const int meters = 1;
  static const int centimeters = 2;
  static const int millimeters = 3;

  static const int inches = 4;
  static const int feet = 5;
  static const int yard = 6;
  static const int mile = 7;

  static const List<int> values = [kilometers, meters, centimeters, millimeters, inches, feet, yard, mile];

  static const List<int> metricValues = [kilometers, meters, centimeters, millimeters];
  static const List<int> imperialValues = [inches, feet, yard, mile];

  static String getString(int unit){
    switch(unit){
      case 0: return "kilometers";
      break;
      case 1: return "meters";
      break;
      case 2: return "centimeters";
      break;
      case 3: return "millimeters";
      break;

      case 4: return "inches";
      break;
      case 5: return "feet";
      break;
      case 6: return "yard";
      break;
      case 7: return "mile";
      break;
    }
    return "";
  }
}