import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _favorites =
        prefs.getStringList('ff_favorites')?.map(int.parse)?.toList() ?? [];
  }

  SharedPreferences prefs;

  List<int> _favorites = [];
  List<int> get favorites => _favorites;
  set favorites(List<int> _value) {
    _favorites = _value;
    prefs.setStringList(
        'ff_favorites', _value.map((x) => x.toString()).toList());
  }

  void addToFavorites(int _value) {
    _favorites.add(_value);
    prefs.setStringList(
        'ff_favorites', _favorites.map((x) => x.toString()).toList());
  }

  void removeFromFavorites(int _value) {
    _favorites.remove(_value);
    prefs.setStringList(
        'ff_favorites', _favorites.map((x) => x.toString()).toList());
  }
}

LatLng _latLngFromString(String val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
