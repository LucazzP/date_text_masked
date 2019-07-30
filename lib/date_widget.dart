import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class DateTextFormField extends StatefulWidget {
  final Function(DateTime) onValidate;
  final String labelFail;
  final InputDecoration decoration;
  final bool Function(DateTime) validator;
  final String dateFormat;
  final String initialData;

  DateTextFormField(
      {@required this.onValidate,
      this.labelFail = 'Invalid date',
      this.decoration,
      @required this.validator,
      this.dateFormat = 'yyyy-dd-mm',
      this.initialData,
      Key key})
      : super(key: key);

  @override
  DateTextFormFieldState createState() => DateTextFormFieldState();
}

class DateTextFormFieldState extends State<DateTextFormField> {
  MaskedTextController _dateController;
  int _positionYear;
  int _positionMonth;
  int _positionDay;
  String _divider;

  String stringToMask(String dateFormat) {
    String date;
    date = dateFormat.replaceAll('d', '0');
    date = date.replaceAll('m', '0');
    date = date.replaceAll('y', '0');
    return date;
  }

  setDivider() {
    String dateFormat = widget.dateFormat;
    if (dateFormat.contains('/'))
      _divider = '/';
    else if (dateFormat.contains('-')) _divider = '-';
  }

  setPositions() {
    String dateFormat = widget.dateFormat;
    int i = 0;
    dateFormat.split(_divider).forEach((item) {
      if (item.contains('y'))
        _positionYear = i;
      else if (item.contains('m'))
        _positionMonth = i;
      else if (item.contains('d')) _positionDay = i;
      i++;
    });
  }

  @override
  void initState() {
    _dateController = MaskedTextController(
        mask: stringToMask(widget.dateFormat), text: widget.initialData);
    setDivider();
    setPositions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _dateController,
      keyboardType: TextInputType.datetime,
      validator: ((value) {
        if (value.isNotEmpty) {
          List _valueSplit = value.split(_divider);
          List<int> _dateList = List<int>();
          _valueSplit.forEach((v) {
            _dateList.add(int.parse(v));
          });
          if (_dateList[_positionYear] >= 1900 &&
              _dateList[_positionMonth] <= 12 &&
              _dateList[_positionDay] <= 31) {
            DateTime date = DateTime(_dateList[_positionYear],
                _dateList[_positionMonth], _dateList[_positionDay]);

            if (widget.validator(date)) {
              widget.onValidate(date);
              return null;
            } else {
              return widget.labelFail;
            }
          } else {
            return widget.labelFail;
          }
        } else {
          return widget.labelFail;
        }
      }),
      decoration: widget.decoration,
    );
  }
}
