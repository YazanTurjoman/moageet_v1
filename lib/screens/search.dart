import 'package:flutter/material.dart';
import '../components/battom_bar.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List multipleSelected = [];
  List multipleSelectedTime = [];
  List checkListItems = [
    {
      "id": 0,
      "value": false,
      "title": "Hair-cutting",
    },
    {
      "id": 1,
      "value": false,
      "title": "Nail treatments",
    },
    {
      "id": 2,
      "value": false,
      "title": "Make up",
    },
    {
      "id": 3,
      "value": false,
      "title": "Tanning",
    },
    {
      "id": 4,
      "value": false,
      "title": "Skin care",
    },
    {
      "id": 5,
      "value": false,
      "title": "Hair styling",
    },
    {
      "id": 6,
      "value": false,
      "title": "facials care",
    },
    {
      "id": 7,
      "value": false,
      "title": "Massages",
    },
    {
      "id": 8,
      "value": false,
      "title": "Spa",
    },
  ];
  List multipleSelectedm = [];
  List m = [
    {
      "id": 0,
      "value": false,
      "title": '09:00 AM',
    },
    {
      "id": 1,
      "value": false,
      "title": '09:30 AM',
    },
    {
      "id": 2,
      "value": false,
      "title": '10:00 AM',
    },
    {
      "id": 3,
      "value": false,
      "title": '10:30 AM',
    },
    {
      "id": 4,
      "value": false,
      "title": '11:00 AM',
    },
    {
      "id": 5,
      "value": false,
      "title": '11:30 AM',
    },
    {
      "id": 6,
      "value": false,
      "title": '12:00 PM',
    },
    {
      "id": 7,
      "value": false,
      "title": '12:30 PM',
    },
    {
      "id": 8,
      "value": false,
      "title": '01:00 PM',
    },
    {
      "id": 9,
      "value": false,
      "title": '01:30 PM',
    },
    {
      "id": 10,
      "value": false,
      "title": '02:00 PM',
    },
    {
      "id": 11,
      "value": false,
      "title": '02:30 PM',
    },
    {
      "id": 12,
      "value": false,
      "title": '03:00 PM',
    },
    {
      "id": 13,
      "value": false,
      "title": '03:30 PM',
    },
    {
      "id": 14,
      "value": false,
      "title": '04:00 PM',
    },
    {
      "id": 15,
      "value": false,
      "title": '04:30 AM',
    },
  ];
  // Initial Selected Value
  String dropdownvalue = 'Riyadh';

  // List of items in our dropdown menu
  var items = ['Riyadh', 'Jeddah', 'Mecca', 'Medina', 'Ad Dammām'];
  DateTime selected = DateTime.now();
  _selectDate(BuildContext context) async {
    DateTime? s = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xff14586E), // <-- SEE HERE
              onPrimary: Color(0xffffffff), // <-- SEE HERE
              onSurface: Color(0xff14586E), // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Color(0xff14586E),
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    setState(() {
      selected = s!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: MediaQuery.of(context).size.height / 7,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30))),
        backgroundColor: const Color(0xff14586E),
        title: const Text(
          'Search',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'City:',
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Color(0xff14586E),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: DropdownButton(
                  isExpanded: true,
                  value: dropdownvalue,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Center(
                        child: Text(
                          items,
                          style: const TextStyle(
                              color: Color(0xff6B6B6B),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                    });
                  },
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                ' Services:',
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Color(0xff14586E),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: checkListItems.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 5,
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    activeColor: const Color(0xff14586E),
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      checkListItems[index]["title"],
                      style: const TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff14586E),
                      ),
                    ),
                    value: checkListItems[index]["value"],
                    onChanged: (value) {
                      setState(() {
                        checkListItems[index]["value"] = value;
                        if (multipleSelected.contains(checkListItems[index])) {
                          multipleSelected.remove(checkListItems[index]);
                        } else {
                          multipleSelected.add(checkListItems[index]);
                        }
                      });
                    },
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Date:',
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Color(0xff14586E),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff14586E),
                  ),
                  onPressed: () => _selectDate(context),
                  child: Text(
                    "${selected.day}-${selected.month}-${selected.year}",
                    style: const TextStyle(fontSize: 18),
                  )),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Time:',
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Color(0xff14586E),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0, left: 16),
              child: Wrap(
                children: List.generate(
                  m.length,
                  (int index) {
                    return Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: ChoiceChip(
                        label: Text(m[index]['title']),
                        selectedColor: const Color(0xff14586E),
                        selected: m[index]["value"],
                        onSelected: (value) {
                          setState(() {
                            m[index]["value"] = value;
                            if (multipleSelectedTime.contains(m[index])) {
                              multipleSelected.remove(m[index]);
                            } else {
                              multipleSelected.add(m[index]);
                            }
                          });
                        },
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              color: Colors.white,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color(0xFF14586E),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Confirm',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
      bottomNavigationBar: BottomBar(currentIndex: 1),
    );
  }
}
