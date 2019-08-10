import './player.dart';

class Team{
  List<Player> playersList = [];
  Map<int,Player> playersMap =  {};
  Map<PlayerPosition,List<Player>> positionMap = {};

  void addPlayer(Player player){
    int id = player.id;
    if(playersMap[id] != null){
      print('player exists');
      return;
    }

    playersMap[id] = player;
    playersList.add(player);
    if(positionMap[player.positions] == null){
      positionMap[player.positions]=[player];
    }else{
      positionMap[player.positions].add(player);
    }
  }

  void removePlayer(int id){
      Player player = playersMap[id];
      playersMap.remove(id);

      List<Player> playerByPosition = positionMap[player.positions];
      playerByPosition.removeWhere((p){
        return p.id == player.id;
      });
      positionMap[player.positions] = playerByPosition;

      playersList.removeWhere((p){
        return p.id == player.id;
      });
  }


}