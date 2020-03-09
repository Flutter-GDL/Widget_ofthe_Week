import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodayNotification extends Notification {
  final String time;

  const TodayNotification({this.time});
}

class Today extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      child: Text("Hoy es..."),
      onPressed: () {
        final time = DateTime.now();
        var formatter = DateFormat('EEEE, MMMM d yyyy');
        String formatted = formatter.format(time);
        // esto: enviar la notification al objeto 
        // no solamente se trata de poblar
        // la variable
        //
        // esto sirve para comunicarse con el objeto notifiactionListener
        TodayNotification(time: formatted)..dispatch(context);
      },
    );
  }
}
