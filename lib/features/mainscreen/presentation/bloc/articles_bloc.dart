import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'articles_event.dart';
part 'articles_state.dart';

class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {
  final String sectionName;
  ArticlesBloc(this.sectionName)
      : super(ArticlesInitial(section: sectionName)) {
    on<ArticlesEvent>((event, emit) async {
      emit(ArticlesInitial(section: sectionName));
      emit(ArticlesLoading());
      emit(ArticlesSuccess());
    });
  }
}
