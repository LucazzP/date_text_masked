import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class DateBloc extends BlocBase {
  final String divider;
  final int _positionYear;

  DateBloc(this.divider, this._positionYear);

  BehaviorSubject<String> date = BehaviorSubject<String>.seeded('');
  Sink<String> get dateIn => date.sink;
  Stream<String> get dateOut => date.map((_date) {
        String _formated =
            _date.endsWith('!') ? _date.replaceAll('!', '') : _date;
        if (!date.value.endsWith(divider) && !_date.endsWith('!')) {
          if (date.value.length == (_positionYear == 0 ? 4 : 2) ||
              date.value.length == (_positionYear == 0 ? 7 : 5)) {
            _formated = _date.toString() + divider;
            dateIn.add(_formated);
          }
        }
        return _formated;
      });

  @override
  void dispose() {
    date.close();
    super.dispose();
  }
}
