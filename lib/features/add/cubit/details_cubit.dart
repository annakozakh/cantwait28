import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cantwait28/repositories/items_repository.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit(this._itemsRepository) : super(const DetailsState());

  final ItemsRepository _itemsRepository;

  Future<void> add(
    String title,
    String imageURL,
    DateTime releaseDate,
  ) async {
    try {
      await _itemsRepository.add(title, imageURL, releaseDate);
      emit(const DetailsState(saved: true));
    } catch (error) {
      emit(DetailsState(errorMessage: error.toString()));
    }
  }
}
