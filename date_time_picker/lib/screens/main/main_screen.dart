import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MainScreen extends StatefulWidget
{
    const MainScreen({super.key});

    @override
    State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
{
    DateTime pickedDate = DateTime.now();
    DateTimeRange? pikedDateRange;
    TimeOfDay pickedTime = TimeOfDay.now();

    DateTime cupertinoDate = DateTime.now();

    DateTime? selectedDateTime;

    Future<void> _pickDateTime() async
    {
        // Step 1: Pick Date
        DateTime? date = await showDatePicker(
            context: context,
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
            initialDate: DateTime.now()
        );

        if (date == null) return;

        // Step 2: Pick Time
        TimeOfDay? time = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.now()
        );

        if (time == null) return;

        // Step 3: Combine Date + Time
        final dateTime = DateTime(
            date.year,
            date.month,
            date.day,
            time.hour,
            time.minute
        );

        setState(()
            {
                selectedDateTime = dateTime;
            }
        );
    }

    @override
    Widget build(BuildContext context)
    {
        return Scaffold(
            appBar: AppBar(
                title: Text('Date and Time Picker')
            ),
            body: Center(
                child: ListView(
                    padding: EdgeInsets.all(12.0),
                    children: [
                        Text(DateFormat('dd-MMM-yyyy').format(pickedDate)),
                        // Text(DateFormat(DateFormat.ABBR_MONTH_WEEKDAY_DAY).format(pickedDate)),
                        ElevatedButton(
                            onPressed: () async
                            {
                                DateTime? date = await showDatePicker(
                                    context: context,
                                    firstDate: DateTime.now().subtract(Duration(days: 365 * 100)),
                                    lastDate: DateTime.now().add(Duration(days: 365 * 10))
                                );
                                if (date != null)
                                {
                                    setState(()
                                        {
                                            pickedDate = date;
                                        }
                                    );
                                }
                            },
                            child: Text("Date Picker")
                        ),

                        Text(pickedTime.format(context).toString()),
                        ElevatedButton(
                            onPressed: () async
                            {
                                TimeOfDay? time = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now()
                                );
                                if (time != null)
                                {
                                    setState(()
                                        {
                                            pickedTime = time;
                                        }
                                    );
                                }
                            },
                            child: Text("Time Picker")
                        ),

                        pikedDateRange == null
                            ? const Text("No date range selected")
                            : Text(
                                "${DateFormat('dd-MMM-yyyy').format(pikedDateRange!.start)} - ${DateFormat('dd-MMM-yyyy').format(pikedDateRange!.end)}"
                            ),
                        ElevatedButton(
                            onPressed: () async
                            {
                                DateTimeRange? dateRange = await showDateRangePicker(
                                    context: context,
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime.now().add(Duration(days: 365 * 10))
                                );
                                if (dateRange != null)
                                {
                                    setState(()
                                        {
                                            pikedDateRange = dateRange;
                                        }
                                    );
                                }
                            },
                            child: Text("Date Range Picker")
                        ),

                        ElevatedButton(onPressed: ()
                            {
                                showCupertinoDialog(
                                    context: context,
                                    builder: (BuildContext context)
                                    {
                                        return CupertinoAlertDialog(
                                            title: Text('Dialog'),
                                            content: Text('This is a Cupertino alert dialog.'),
                                            actions: [
                                                CupertinoDialogAction(
                                                    child: Text('Cancel'),
                                                    onPressed: ()
                                                    {
                                                        Navigator.of(context).pop();
                                                    }
                                                ),
                                                CupertinoDialogAction(
                                                    child: Text('OK'),
                                                    onPressed: ()
                                                    {
                                                        Navigator.of(context).pop();
                                                    }
                                                )
                                            ]
                                        );
                                    }
                                );
                            },
                            child: Text("CupertinoAlertDialog")
                        ),

                        Text(DateFormat('dd-MM-yyyy hh:mm a').format(cupertinoDate)),
                        CupertinoButton(
                            color: CupertinoColors.systemIndigo,
                            onPressed: ()
                            {
                                showCupertinoModalPopup(
                                    context: context,
                                    builder: (BuildContext context)
                                    {
                                        return Container(
                                            height: 250,
                                            color: CupertinoColors.systemBackground.resolveFrom(context),
                                            child: CupertinoDatePicker(
                                                mode: CupertinoDatePickerMode.dateAndTime,
                                                initialDateTime: DateTime.now(),
                                                onDateTimeChanged: (newDate)
                                                {
                                                    setState(()
                                                        {
                                                            cupertinoDate = newDate;
                                                        }
                                                    );
                                                }
                                            )
                                        );
                                    }
                                );
                            },
                            child: const Text(
                                'Cupertino DatePicker',
                                style: TextStyle(color: CupertinoColors.white)
                            )
                        ),

                        selectedDateTime == null
                            ? const Text("No DateTime selected")
                            : Text(
                                DateFormat("dd-MMM-yyyy hh:mm a").format(selectedDateTime!),
                                style: const TextStyle(fontSize: 18)
                            ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                            onPressed: _pickDateTime,
                            child: const Text("Pick Date & Time")
                        ),

                    ]
                )
            )
        );
    }
}
