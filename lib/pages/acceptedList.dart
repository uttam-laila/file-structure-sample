import 'package:flutter/material.dart';
import 'package:folder_structure_example/blocs/acceptedListBloc.dart';
import 'package:logger/logger.dart';

final bloc = AccepedListBloc();
Logger logger = new Logger();

class AcceptedList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.acceptedListStream,
      builder: (context, snapshot) {
        logger.e(snapshot);
        if (snapshot.data != null) {
          return SizedBox(
            height: (MediaQuery.of(context).size.height - 80),
            child: ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                logger.e(snapshot.data[index]);
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
                        mainAxisAlignment: MainAxisAlignment.center,
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
    );
  }
}
