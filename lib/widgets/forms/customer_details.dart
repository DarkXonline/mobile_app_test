// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:wedlock/models/wedding.dart';
import 'package:wedlock/views/paymentdetails.dart';
//import 'package:wedlock/views/paymentdetails.dart';

// Create a Form widget.
class CustomerDetailsForm extends StatefulWidget {
  final Wedding wedding;
  const CustomerDetailsForm({super.key, required this.wedding});

  @override
  CustomerDetailsFormState createState() {
    return CustomerDetailsFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class CustomerDetailsFormState extends State<CustomerDetailsForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<CustomerDetailsFormState>.
  final _formKey = GlobalKey<FormState>();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  DateTime dateTime = DateTime.now();
  DateTime bookDateTime = DateTime.now();
  TimeOfDay timeOfDay = TimeOfDay.now();
  int duration = 3;
  bool value = false;
  bool liveBandValue = false;
  bool wifiValue = false;
  bool photoBoothValue = false;
  TextEditingController _custName = TextEditingController();
  TextEditingController _contact = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _email = TextEditingController();

  //TextEditingController _liveBand = TextEditingController();
  //TextEditingController _photoBooth = TextEditingController();
  //TextEditingController _wifi = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _custName,
            // The validator receives the text that the user has entered.
            decoration: const InputDecoration(filled: false, labelText: 'Name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please Specify';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _contact,
            keyboardType: TextInputType.number,
            // The validator receives the text that the user has entered.
            decoration: const InputDecoration(
              filled: false,
              labelText: 'Conctact No.',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please Specify';
              }
              return null;
            },
          ),

          TextFormField(
            controller: _email,
            // The validator receives the text that the user has entered.
            decoration: const InputDecoration(
              filled: false,
              labelText: 'E-mail',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please Specify';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _address,
            // The validator receives the text that the user has entered.
            decoration: const InputDecoration(
              filled: false,
              labelText: 'Address',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please Specify';
              }
              return null;
            },
          ),
          // ignore: prefer_const_constructors
          Text(''),
          TextFormField(
            controller: _dateController,
            // ignore: prefer_const_constructors
            decoration: InputDecoration(
                labelText: 'Select Event Date',
                filled: true,
                prefixIcon: const Icon(Icons.calendar_today),
                enabledBorder:
                    const OutlineInputBorder(borderSide: BorderSide.none),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey))),
            readOnly: true,
            onTap: () {
              selectedDate();
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please Specify';
              }
              return null;
            },
          ),
          // ignore: prefer_const_constructors
          Text(''),
          TextFormField(
            controller: _timeController,
            // ignore: prefer_const_constructors
            decoration: InputDecoration(
                labelText: 'Select Event Time',
                filled: true,
                iconColor: Colors.blueGrey,
                prefixIcon: const Icon(Icons.access_time_filled),
                enabledBorder:
                    const OutlineInputBorder(borderSide: BorderSide.none),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey))),
            readOnly: true,
            onTap: () {
              _selectTime();
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please Specify';
              }
              return null;
            },
          ),
          const Text(''),
          CupertinoButton(
              color: Colors.blueGrey,
              child: Text('Event Duration : $duration hour'),
              onPressed: () => showCupertinoModalPopup(
                  context: context,
                  builder: (_) => SizedBox(
                        width: double.infinity,
                        height: 200,
                        child: CupertinoPicker(
                          backgroundColor: Colors.blueGrey,
                          itemExtent: 30,
                          scrollController:
                              FixedExtentScrollController(initialItem: 0),
                          children: const [
                            Text('3'),
                            Text('4'),
                            Text('5'),
                            Text('6'),
                            Text('7'),
                            Text('8'),
                          ],
                          onSelectedItemChanged: (int value) {
                            setState(() {
                              duration = value + 3;
                            });
                          },
                        ),
                      ))),
          const Text(''),
          const Text(
            'Additional Service',
            style: TextStyle(fontSize: 18, color: Colors.blueGrey),
          ),
          CheckboxListTile(
              title: const Text('Live Band'),
              value: liveBandValue,
              onChanged: (bool? value) {
                setState(() {
                  liveBandValue = value!;
                });
              }),
          CheckboxListTile(
              title: const Text('PhotoBooth'),
              value: photoBoothValue,
              onChanged: (bool? value) {
                setState(() {
                  photoBoothValue = value!;
                });
              }),
          CheckboxListTile(
              title: const Text('Wifi'),
              value: wifiValue,
              onChanged: (bool? value) {
                setState(() {
                  wifiValue = value!;
                });
              }),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
              ),
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            title: const Text('Booking Details Confirmation'),
                            content: Text(
                                'Name: ${_custName.text}\nContact Num: ${_contact.text}\nEmail: ${_email.text}\nAddress: ${_address.text}\n\nEvent Date: ${_dateController.text}\nEvent Time: ${_timeController.text}\nEvent Duration: $duration hours\n\nAdditional Service\nLive Band: $liveBandValue\nPhoto Booth: $photoBoothValue\nWifi: $wifiValue'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => PaymentDetails(
                                              wedding: widget.wedding,
                                              duration: duration,
                                              liveBandValue: liveBandValue,
                                              photoBoothValue: photoBoothValue,
                                              wifiValue: wifiValue,
                                            ))),
                                child: const Text('Confirm'),
                              ),
                            ],
                          ));
                }
              },
              child: const Text(
                'Submit',
                style: TextStyle(
                  color: Colors
                      .white, // Change this color to your desired text color
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> selectedDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2030));
    if (pickedDate != null) {
      setState(() {
        _dateController.text = pickedDate.toString().split(" ")[0];
      });
    }
  }

  Future<void> _selectTime() async {
    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time != null) {
      _timeController.text = '${time.hour}:${time.minute}';
    }
  }
}
