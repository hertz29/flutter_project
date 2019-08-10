import 'package:flutter/material.dart';

import './player.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async' show Future;
import 'dart:convert';

class PlayersPool{

    String playersAsString = "[\r\n        {\r\n            \"id\": 117,\r\n            \"first_name\": \"Anthony\",\r\n            \"last_name\": \"Davis\",\r\n            \"position\": \"PF\",\r\n            \"team\": \"LAL\",\r\n            \"img\": \"https:\/\/d2cwpp38twqe55.cloudfront.net\/req\/201907151\/images\/players\/davisan02.jpg\"\r\n        },\r\n        {\r\n            \"id\": 118,\r\n            \"first_name\": \"Joel\",\r\n            \"last_name\": \"Embid\",\r\n            \"position\": \"C\",\r\n            \"team\": \"BKN\",\r\n            \"img\": \"https:\/\/d2cwpp38twqe55.cloudfront.net\/req\/201907151\/images\/players\/embiijo01.jpg\"\r\n        },{\r\n            \"id\": 109,\r\n            \"first_name\": \"Danny\",\r\n            \"last_name\": \"Green\",\r\n            \"position\": \"SG\",\r\n            \"team\": \"LAL\",\r\n            \"img\" : \"https:\/\/d2cwpp38twqe55.cloudfront.net\/req\/201907151\/images\/players\/greenda02.jpg\"\r\n        },{\r\n            \"id\": 110,\r\n            \"first_name\": \"Demian\",\r\n            \"last_name\": \"Lilard\",\r\n            \"position\": \"PG\",\r\n            \"team\": \"POR\",\r\n            \"img\" : \"https:\/\/d2cwpp38twqe55.cloudfront.net\/req\/201907151\/images\/players\/lillada01.jpg\"\r\n        },{\r\n            \"id\": 111,\r\n            \"first_name\": \"Nicola\",\r\n            \"last_name\": \"Jokic\",\r\n            \"position\": \"C\",\r\n            \"team\": \"DEN\",\r\n            \"img\" : \"https:\/\/d2cwpp38twqe55.cloudfront.net\/req\/201907151\/images\/players\/jokicni01.jpg\"\r\n        },{\r\n            \"id\": 237,\r\n            \"first_name\": \"LeBron\",\r\n            \"last_name\": \"James\",\r\n            \"position\": \"PF\",\r\n            \"team\":\"LAL\",\r\n            \"img\": \"https:\/\/d2cwpp38twqe55.cloudfront.net\/req\/201907151\/images\/players\/jamesle01.jpg\"\r\n        },{\r\n            \"id\": 230,\r\n            \"first_name\": \"Steph\",\r\n            \"last_name\": \"Curry\",\r\n            \"position\": \"PG\",\r\n            \"team\":\"GTW\",\r\n            \"img\" : \"https:\/\/d2cwpp38twqe55.cloudfront.net\/req\/201907151\/images\/players\/curryst01.jpg\"\r\n        },{\r\n            \"id\": 238,\r\n            \"first_name\": \"Kevin\",\r\n            \"last_name\": \"Durant\",\r\n            \"position\": \"SF\",\r\n            \"team\":\"BKN\",\r\n            \"img\" : \"https:\/\/d2cwpp38twqe55.cloudfront.net\/req\/201907151\/images\/players\/duranke01.jpg\"\r\n        },{\r\n            \"id\": 239,\r\n            \"first_name\": \"Jhon\",\r\n            \"last_name\": \"Wall\",\r\n            \"position\": \"PG\",\r\n            \"team\":\"WAS\",\r\n            \"img\" : \"http:\/\/ssref.net\/scripts\/image_resize.cgi?min=200&url=https:\/\/d2cwpp38twqe55.cloudfront.net\/req\/201907151\/images\/players\/walljo01.jpg\"\r\n        },{\r\n            \"id\": 240,\r\n            \"first_name\": \"Bredly\",\r\n            \"last_name\": \"Beel\",\r\n            \"position\": \"SG\",\r\n            \"team\":\"WAS\",\r\n            \"img\" : \"https:\/\/d2cwpp38twqe55.cloudfront.net\/req\/201907151\/images\/players\/bealbr01.jpg\"\r\n        },{\r\n            \"id\": 241,\r\n            \"first_name\": \"Kawai\",\r\n            \"last_name\": \"Lenoard\",\r\n            \"position\": \"SF\",\r\n            \"team\":\"LAC\",\r\n            \"img\" : \"https:\/\/d2cwpp38twqe55.cloudfront.net\/req\/201907151\/images\/players\/leonaka01.jpg\"\r\n        },{\r\n            \"id\": 243,\r\n            \"first_name\": \"James\",\r\n            \"last_name\": \"Harden\",\r\n            \"position\": \"SG\",\r\n            \"team\":\"HOU\",\r\n            \"img\" : \"https:\/\/d2cwpp38twqe55.cloudfront.net\/req\/201907151\/images\/players\/hardeja01.jpg\"\r\n        },{\r\n            \"id\": 244,\r\n            \"first_name\": \"Russel\",\r\n            \"last_name\": \"Westbrook\",\r\n            \"position\": \"PG\",\r\n            \"team\":\"HOU\",\r\n            \"img\" : \"https:\/\/d2cwpp38twqe55.cloudfront.net\/req\/201907151\/images\/players\/westbru01.jpg\"\r\n        },{\r\n            \"id\": 245,\r\n            \"first_name\": \"Ben\",\r\n            \"last_name\": \"Simmons\",\r\n            \"position\": \"PF\",\r\n            \"team\":\"PHI\",\r\n            \"img\" : \"https:\/\/d2cwpp38twqe55.cloudfront.net\/req\/201907151\/images\/players\/simmobe01.jpg\"\r\n        }\r\n    ]";
    List<Player> players;

    PlayersPool(){
        players = parseJosn();
    }

    List<Player> parseJosn() {
      final parsed = json.decode(playersAsString).cast<Map<String, dynamic>>();
      return parsed.map<Player>((json) => new Player.fromJson(json)).toList();
    }

    List<Player> get getPlayers{
      return players;
    }

    bool isEmpty(){
      return players.isEmpty;
    }

     bool isNotEmpty(){
      return players.isNotEmpty;
    }

  void removePlayer(Player player) {
    players.removeWhere((tmpPlayer){
            return tmpPlayer.id == player.id;
      });
  }

  void addPlayer(Player player) {
    players.add(player);
  }

}