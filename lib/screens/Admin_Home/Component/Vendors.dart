import 'package:flutter/material.dart';
import 'package:event/constants.dart';

class Vendors extends StatefulWidget {
  const Vendors({super.key});

  @override
  State<Vendors> createState() => _VendorsState();
}

class _VendorsState extends State<Vendors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            children: [
              SizedBox(height: 60),
              Container(
                child: Container(
                  padding: EdgeInsets.only(left: 15),
                  child: Text("List of Vendors", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900, color: kPrimaryColor),),
                ),
              ),
              SizedBox(height: 30,),
              Container(
                width: 400,
                child: DataTable(
                  columns: [
                    DataColumn(label: Text('Job', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),)),
                    DataColumn(label: Text('Ph No', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(Text('Audio')),
                      DataCell(Text('555-555-5555')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Caterers')),
                      DataCell(Text('555-123-4567')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Clean up')),
                      DataCell(Text('555-987-6543')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Check in services')),
                      DataCell(Text('555-555-5555')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Decorator')),
                      DataCell(Text('555-123-4567')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Designers')),
                      DataCell(Text('555-987-6543')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Entertainment')),
                      DataCell(Text('555-555-5555')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Event Registrations')),
                      DataCell(Text('555-123-4567')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Florist')),
                      DataCell(Text('555-987-6543')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('First Aid')),
                      DataCell(Text('555-555-5555')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Gifts Collaboration')),
                      DataCell(Text('555-123-4567')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Marketing')),
                      DataCell(Text('555-987-6543')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Print Material')),
                      DataCell(Text('555-555-5555')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Public Relation')),
                      DataCell(Text('555-123-4567')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Visuals')),
                      DataCell(Text('555-987-6543')),
                    ]),

                  ],
                ),
              ),
            ]
        ),
      ),
    );
  }
}
