import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_fetch_with_cubit/core/network/api_result.dart';
import 'package:user_fetch_with_cubit/features/home/data/repos/home_repo.dart';
import 'package:user_fetch_with_cubit/features/home/data/models/users_model.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _repo;
  HomeCubit(this._repo) : super(HomeInitial());

  Future<void> getUsers() async {
    emit(HomeLoading());
    final result = await _repo.fetchUsers();
    switch (result) {
      case ApiSuccess(:final data):
        emit(HomeSuccess(data));
      case ApiFailure(:final message):
        emit(HomeFailure(message));
    }
  }
}
