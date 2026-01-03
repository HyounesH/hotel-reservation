import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

const d_green = Color(0xFF54D3C2);

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  bool _isFlexible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CalendarAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),

        child: Column(
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2000, 1, 1),
              lastDay: DateTime.utc(2100, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: d_green,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: d_green,
                  shape: BoxShape.circle,
                ),
              ),
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlexDateCheckBox(
                  label: 'Flexible with dates',
                  value: _isFlexible,
                  onChanged: (newValue) {
                    setState(() {
                      _isFlexible = newValue!; 
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
            OverflowBar(
              alignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: d_green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text(
                      'Done',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FlexDateCheckBox extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool?> onChanged;

  const FlexDateCheckBox({
    required this.label,
    required this.value,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          fillColor: MaterialStateProperty.all(d_green),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
      ],
    );
  }
}

class CalendarAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CalendarAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.grey[800]),
        iconSize: 20,
        onPressed: null,
      ),
      title: const Text(
        'Calendar',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      backgroundColor: Colors.white,
      actions: [
        IconButton(
          icon: Icon(Icons.favorite_outline_rounded, color: Colors.grey[800]),
          iconSize: 20,
          onPressed: null,
        ),
        IconButton(
          icon: Icon(Icons.place, color: Colors.grey[800]),
          iconSize: 20,
          onPressed: null,
        ),
      ],
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
