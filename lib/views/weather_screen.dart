import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/bloc/weather_event.dart';
import 'package:weather_app/bloc/weather_state.dart';
import 'package:weather_app/utils/field_validation_util.dart';
import 'package:weather_app/views/widgets/custom_button.dart';
import 'package:weather_app/views/widgets/custom_textfield.dart';
import 'package:weather_app/views/widgets/horizontal_text.dart';

class WeatherScreen extends StatelessWidget {
  WeatherScreen({super.key});

  final TextEditingController _cityController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Column(
                children: [
                  CustomTextField(
                    controller: _cityController,
                    hintText: "Enter city name",
                    validator: (value) {
                      return FieldValidationUtil.validateValue(value!, "City Name");
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomButton(
                    width: double.maxFinite,
                    label: "Search",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<WeatherBloc>().add(WeatherFetched(cityName: _cityController.text.trim()));
                      }
                    },
                  ),
                ],
              ),
              Expanded(
                child: BlocBuilder<WeatherBloc, WeatherState>(
                  builder: (context, state) {
                    if (state is WeatherLoading) {
                      return const Center(child: CircularProgressIndicator.adaptive());
                    }

                    if (state is WeatherFailure) {
                      return Center(child: Text(state.error.toString()));
                    }

                    if (state is WeatherSuccess) {
                      final data = (state).weatherModel;

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          HorizontalText(
                            title: 'City Name',
                            value: data.city?.name ?? "",
                          ),
                          HorizontalText(
                            title: 'Current Temperature',
                            value: "${data.list?.first.main?.temp ?? ""}°C",
                          ),
                          HorizontalText(
                            title: 'Weather Description',
                            value: data.list?.first.weather?.first.description?.toUpperCase() ?? "",
                            // value: data.city?.name ?? "",
                          ),
                          HorizontalText(
                            title: 'Weather icon',
                            value: data.city?.name ?? "",
                            widget: Image.network("https://openweathermap.org/img/wn/${data.list?.first.weather?.first.icon}.png"),
                          ),
                        ],
                      );
                    }

                    return const Center(
                      child: Text(
                        "Search with correct city name to check Weather detail",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
