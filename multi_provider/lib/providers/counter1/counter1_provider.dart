import 'package:flutter/foundation.dart';

class Counter1Provider with ChangeNotifier
{
    int count = 0;

    void increment() 
    {
        count++;
        notifyListeners();
    }
}
