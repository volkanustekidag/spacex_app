import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_app/bloc/spacex_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SpacexBloc>(context).add(SpacexRequestEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: BlocBuilder<SpacexBloc, SpacexState>(
            builder: (context, state) {
              if (state is SpacexLoadingState) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              }
              if (state is SpacexSuccesState) {
                final latest = state.latest;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(latest.links.patch.small),
                    Text(
                      latest.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                    Text(latest.details,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                        )),
                  ],
                );
              }
              if (state is SpacexFailureState) {
                return Center(
                    child: Text("Something went wrong!",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                        )));
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
