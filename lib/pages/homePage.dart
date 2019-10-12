import 'package:flutter/material.dart';
import 'package:folder_structure_example/blocs/acceptedListBloc.dart';
import 'package:folder_structure_example/models/userModel.dart';
// import 'package:folder_structure_example/models/userModel.dart';
import 'package:folder_structure_example/widgets/customButton.dart';
import '../services/getUserHttp.dart';
import 'acceptedList.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// List<UserModel> allUsers = [];
final bloc = AccepedListBloc();

class _MyHomePageState extends State<MyHomePage> {
  GetUsersList getUsersList = new GetUsersList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample App"),
      ),
      body: StreamBuilder<List<UserModel>>(
          stream: bloc.acceptedListStream,
          builder: (context, snapshot) {
            return Container(
              child: Column(
                children: <Widget>[
                  FutureBuilder(
                    future: getUsersList.getUsers(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.data != null) {
                        return SizedBox(
                          height: (MediaQuery.of(context).size.height - 130),
                          child: ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                color: Colors.black,
                                child: SizedBox(
                                  height: 120,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    elevation: 4,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        ListTile(
                                          leading: CircleAvatar(
                                            radius: 30.0,
                                            backgroundImage: NetworkImage(
                                              snapshot.data[index].avatar,
                                            ),
                                          ),
                                          title: Center(
                                              child: Text(
                                            snapshot.data[index].name,
                                          )),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: <Widget>[
                                            CustomButton(
                                              // key: snapshot.data[index].id,
                                              title: "Accept",
                                              callbackAction: () {
                                                bloc.acceptedUserModelSink.add(snapshot.data[index]);
                                              },
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            CustomButton(
                                              title: "Reject",
                                              callbackAction: () {},
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      } else {
                        return Center(
                          child: Text("Loading..."),
                        );
                      }
                    },
                  )
                ],
              ),
            );
          }),
      bottomNavigationBar: Container(
        color: Colors.blueAccent,
        child: CustomButton(
          title: "Accepted List",
          callbackAction: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AcceptedList()),
            );
          },
        ),
      ),
    );
  }
}
