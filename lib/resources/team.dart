import '../modules/player.dart';
class PlayerStubs{
final List<Player> _playerList = [
    Player(
        id: 1,
        positions: [PlayerPosition.PG],
        name: 'Sthepn Curry',
        price: 5000,
        team: 'Golden State Worriors'
        ),
    Player(
        id: 2,
        positions: [PlayerPosition.PF],
        name: 'Kevin Durant',
        price: 5000,
        team: 'Golden State Worriors'
      ),
    Player(
        id: 3,
        positions: [PlayerPosition.C],
        name: 'Nicola Jukic',
        price: 5000,
        team: 'Denver Nuggets'
      ),
  ];
}