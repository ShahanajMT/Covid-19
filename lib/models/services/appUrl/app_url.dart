class AppUrl {
  //? this is our base class
  static const String baseUrl = 'https://disease.sh/v3/covid-19/';

  //? fetch all world covid states
  static const String worldStatesApi = baseUrl + 'all';
  static const String countriesList = baseUrl + 'countries';
}