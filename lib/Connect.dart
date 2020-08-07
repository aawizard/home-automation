import 'networking.dart';
import 'package:flutter/material.dart';

String apiKey=""; //Enter your apiKey from BoltCloud
String deviceId="";                      //Change it to your devide id
String boltURL="https://cloud.boltiot.com/remote";
class BoltIOT {
  Future<dynamic> digitalRead(String pin) async {
    NetworkingHelper networkHelper = NetworkingHelper(url: '$boltURL/$apiKey/digitalRead?pin=$pin&deviceName=$deviceId');
    var response = await networkHelper.getData();
    return response;
  }
  Future<dynamic> digitalWrite(String pin, String state) async {
    NetworkingHelper networkHelper = NetworkingHelper(url: '$boltURL/$apiKey/digitalWrite?pin=$pin&state=$state&deviceName=$deviceId');
    var response = await networkHelper.getData();
    return response;
  }
  Future<dynamic> analogRead(String pin) async {
    NetworkingHelper networkHelper = NetworkingHelper(url: '$boltURL/$apiKey/analogRead?pin=$pin&deviceName=$deviceId');
    var response = await networkHelper.getData();
    return response;
  }
  Future<dynamic> analogWrite(String pin, String value) async {
    NetworkingHelper networkHelper = NetworkingHelper(url: '$boltURL/$apiKey/analogWrite?pin=$pin&value=$value&deviceName=$deviceId');
    var response = await networkHelper.getData();
    return response;
  }
  Future<dynamic> deviceStatue() async {
    NetworkingHelper networkHelper = NetworkingHelper(url: '$boltURL/$apiKey/isOnline?&deviceName=$deviceId');
    var response = await networkHelper.getData();
    return response;
  }
  Future<dynamic> restart() async {
    NetworkingHelper networkHelper = NetworkingHelper(url: '$boltURL/$apiKey/restart?&deviceName=$deviceId');
    var response = await networkHelper.getData();
    return response;
  }

}
