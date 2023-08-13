part of 'internet_bloc.dart';

abstract class InternetState {}

class InternetInitial extends InternetState {}

class InternetLostState extends InternetState {}

class InternetGainState extends InternetState {}
