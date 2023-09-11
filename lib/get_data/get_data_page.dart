import 'package:call_api/get_data/get_data_bloc.dart';
import 'package:call_api/get_data/get_data_model.dart';
import 'package:call_api/get_data/get_data_page.dart';

import 'get_data_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetDataPage extends StatefulWidget {
  GetDataPage({super.key});

  @override
  State<GetDataPage> createState() => _GetDataPageState();
}

class _GetDataPageState extends State<GetDataPage> {
  final bloc = GetDataBloc(GetDataInitState());
  @override
  void initState() {
    super.initState();
    bloc.clickGetData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: Text("Get Data"),
      ),
      body: BlocProvider(
        create: (context) => bloc,
        child: BlocBuilder<GetDataBloc, GetDataState>(
          builder: (context, state) {
            if (state is GetDataInitState || state is GetDataLoadingState) {
              return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: CupertinoActivityIndicator());
            }
            if (state is GetDataLoadedState) {
              return getData(list: state.datas);
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget getData({required List<GetDataModel> list}) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: 100,
      itemBuilder: (context, index) {
        var item = list[index];
        return Column(
          children: [
            Text(item.userId.toString()),
            Text(item.id.toString()),
            Text(item.title ?? ""),
            Text(item.body ?? "")
          ],
        );
      },
    );
  }
}
