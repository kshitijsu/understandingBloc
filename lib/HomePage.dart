import 'package:flutter/material.dart';
import 'Employee.dart';
import 'EmployeeBloc.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final EmployeeBloc _employeeBloc = EmployeeBloc();
  @override
  void dispose(){
    super.dispose();

    _employeeBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee App'),
      ),
      body: Conatiner(
        child: StreamBuilder<List<Employee>>(
          stream: _employeeBloc.employeeListStream,
          builder: (BuilContext context, AsynSnapshot<List<Employee>> snapshot){
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder:(context, index){
                return Card(
                  elevation: 5.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(20.0),
                        child:Text(
                          '${snapshot.data[index].id}'
                        )
                      ),
                      Container(
                        padding:EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:<Widget>[
                        Text(
                          '${snapshot.data[index].name}',
                          style:TextStyle(fontSize:18.0),
                        ),Text(
                          'Rs. ${snapshot.data[index].salary}',
                          style:TextStyle(fontSize:16.0),
                        ),]
                        )
                      )
                    ]
                  )
                )
              }
            );
          },
        )
      ),
    );
  }
}
 