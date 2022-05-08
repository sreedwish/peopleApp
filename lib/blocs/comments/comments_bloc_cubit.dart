import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:people_app/models/bean_comments.dart';
import 'package:people_app/rest/apiClient.dart';
import 'package:dio/dio.dart';
import 'package:people_app/storage/repository.dart';
part 'comments_bloc_state.dart';

class CommentsBlocCubit extends Cubit<CommentsBlocState> {
  CommentsBlocCubit() : super(CommentsBlocInitial());

  Repository _repository = Repository();

  void getComments(int postId) async {
    emit(CommentsBlocLoad());

    try {
      final List<BeanComment> list = await _repository.getComments(postId);

      emit(CommentsBlocGet(list));
    } catch (e) {
      emit(CommentsBlocException(e as Exception));
    }
  }
}
