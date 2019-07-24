import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class DateTextFormField extends StatefulWidget {

  final Function(DateTime) onValidate;
  final String labelFail;
  final InputDecoration decoration;
  final bool Function(DateTime) validator;

  DateTextFormField({
    @required this.onValidate, 
    this.labelFail = 'Invalid date', 
    this.decoration,
    @required this.validator,
    Key key
  }) : super(key: key);

  @override
  _DateTextFormFieldState createState() => _DateTextFormFieldState();
}

class _DateTextFormFieldState extends State<DateTextFormField> {
  MaskedTextController _dateController;

  @override
  void initState() {
    _dateController = MaskedTextController(mask: '00/00/0000');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _dateController,
      keyboardType: TextInputType.datetime,
      validator: ((value) {
        if(value.isNotEmpty){
          List _valueSplit = value.split('/');
          List<int> _dateList = List<int>();
          _valueSplit.forEach((v){
            _dateList.add(int.parse(v));
          });
          if(_dateList[2] >= 1900 && _dateList[1] <= 12 && _dateList[0] <= 31){

            DateTime date = DateTime(_dateList[2], _dateList[1], _dateList[0]);
          
            if(widget.validator(date)){
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