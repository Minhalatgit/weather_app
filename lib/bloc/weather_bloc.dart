import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_event.dart';
import 'package:weather_app/bloc/weather_state.dart';
import 'package:weather_app/data/repositories/weather_repository.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc(this.weatherRepository) : super(WeatherInitial()) {
    on<WeatherFetched>(_getCurrentWeather);
  }

  void _getCurrentWeather(
    WeatherFetched event,
    Emitter<WeatherState> emit,
  ) async {
    try {
      emit(WeatherLoading());
      final weather = await weatherRepository.getCurrentWeather(event.cityName ?? "");
      emit(WeatherSuccess(weather));
    } catch (e) {
      emit(WeatherFailure(e.toString()));
    }
  }
}
