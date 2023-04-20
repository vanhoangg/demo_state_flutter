import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/rest_api/bloc/demo_api_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/user_repository.dart';

class DemoApiScreen extends StatefulWidget {
  const DemoApiScreen({super.key});

  @override
  State<DemoApiScreen> createState() => _DemoApiScreenState();
}

class _DemoApiScreenState extends State<DemoApiScreen> {
  UserRepository userRepository = UserRepository();

  late DemoApiBloc _bloc;

  @override
  void initState() {
    _bloc = DemoApiBloc(userRepository: userRepository)..add(LoadDataEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider<DemoApiBloc>(
        create: (context) => _bloc,
        child: BlocBuilder<DemoApiBloc, DemoApiState>(
          builder: (context, state) {
            if (state is DemoApiLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is DemoApiSuccess) {
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 5,
                  physics: const ClampingScrollPhysics(),
                  padding: const EdgeInsets.all(8.0),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(6)),
                      margin: const EdgeInsets.all(8.0),
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${state.users[index].name}",
                            style: const TextStyle(fontSize: 36),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            "Username: ${state.users[index].username}",
                            style: const TextStyle(fontSize: 24),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            "Street : ${state.users[index].address?.street}",
                            style: const TextStyle(fontSize: 16),
                          ),
                          Text(
                            "City : ${state.users[index].address?.city}",
                            style: const TextStyle(fontSize: 16),
                          ),
                          Text(
                            "Phone : ${state.users[index].phone}",
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    );
                  });
            }
            if (state is DemoApiError) {
              return Center(
                  child: Text("Error: ${state.messageError}",
                      style: const TextStyle(fontSize: 24)));
            }
            return const Center(
              child: Text("No Data", style: TextStyle(fontSize: 24)),
            );
          },
        ),
      ),
    );
  }
}
