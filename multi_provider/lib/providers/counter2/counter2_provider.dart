import 'package:flutter/foundation.dart';

class Counter2Provider with ChangeNotifier
{
    int count = 0;

    void increment() 
    {
        count++;
        notifyListeners();
    }
}
