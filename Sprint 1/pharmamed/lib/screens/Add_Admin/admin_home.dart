import 'package:flutter/material.dart';
import 'package:pharmamed/screens/Add_Admin/adding_admin_screen.dart';
import 'package:pharmamed/screens/Add_Admin/admin_ViewModel.dart';
import 'package:pharmamed/screens/Add_Admin/CustomButton.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Page'),
        elevation: 3.0,
      ),
      body: _buildContent(context),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildContent(context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            "Home",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          CustomButton(
            child: Text(
              'Add New Admin',
              style: TextStyle(
                color: Colors.red,
                fontSize: 22.0,
              ),
            ),
            color: Colors.white,
            borderRadius: 4.0,
            OnPressed: () {
              // Navigator.push(context, route)
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const Adding();
              }));
            },
          ),
          SizedBox(height: 8.0),
          CustomButton(
            child: Text(
              'Add Products',
              style: TextStyle(
                color: Colors.red,
                fontSize: 22.0,
              ),
            ),
            color: Colors.yellow,
            borderRadius: 4.0,
            OnPressed: () {},
          ),
          SizedBox(height: 8.0),
          CustomButton(
            child: Text(
              'Delete Products',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.0,
              ),
            ),
            color: Colors.green,
            borderRadius: 4.0,
            OnPressed: () {},
          ),
        ],
      ),
    );
  }
}
