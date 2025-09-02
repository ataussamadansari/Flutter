import 'package:flutter/foundation.dart';

class Counter3Provider with ChangeNotifier
{
    int count = 0;

    void increment() 
    {
        count += 2;
        notifyListeners();
    }
}
