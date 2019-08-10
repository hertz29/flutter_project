import '../modules/player.dart';

class CommonFunctions{
  static String createPositionShortcut(position){
       switch(position){
          case PlayerPosition.PG:
            return 'PG';
          case PlayerPosition.SG:
            return 'SG';
          case PlayerPosition.SF:
            return 'SF';
          case PlayerPosition.PF:
            return 'PF';
          case PlayerPosition.C:
            return 'C';
        }
    }

    static getPositionByKey(int key){
       switch (key) {
         case 0:
           return createPositionShortcut(PlayerPosition.PG);
         case 1:
           return createPositionShortcut(PlayerPosition.SG);
         case 2:
           return createPositionShortcut(PlayerPosition.SF);
         case 0:
           return createPositionShortcut(PlayerPosition.PF);  
         default:
           return createPositionShortcut(PlayerPosition.C);  
       }
    }

    static PlayerPosition createPlayerPosition(dynamic json){
      switch (json['position']) {
        case 'PG':
          return PlayerPosition.PG;
        case 'SG':
          return PlayerPosition.SG;
        case 'SF':
          return PlayerPosition.SF;
        case 'PF':
          return PlayerPosition.PF;
        default:
          return PlayerPosition.C;
      }
    }
}