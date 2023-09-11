import 'dart:convert';
import 'package:call_api/get_data/get_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

abstract class GetDataState {}

class GetDataInitState extends GetDataState {}

class GetDataLoadingState extends GetDataState {}

class GetDataLoadedState extends GetDataState {
  List<GetDataModel> datas;

  GetDataLoadedState({required this.datas});
}

class GetDataErrorState extends GetDataState {}

class GetDataBloc extends Cubit<GetDataState> {
  GetDataBloc(super.initialState);

  void clickGetData() async {
    emit(GetDataInitState());
    emit(GetDataLoadingState());
    try {
      final uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
      final response = await get(uri);

      final listStringData = response.body;

      final listJson = jsonDecode(listStringData);

      final listWelcome =
          (listJson as List).map((e) => GetDataModel.fromJson(e)).toList();

      emit(GetDataLoadedState(datas: listWelcome));
      print(response.statusCode);
    } catch (e) {
      emit(GetDataErrorState());
    }
  }
}
