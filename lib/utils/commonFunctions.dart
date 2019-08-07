class CommonFunctions{
  static String createPositionShortcut(position){
       switch(position.toString()){
          
          case 'PlayerPosition.PG':
            return 'PG';
          case 'PlayerPosition.SG':
            return 'SG';
          case 'PlayerPosition.SF':
            return 'SF';
          case 'PlayerPosition.PF':
            return 'PF';
          case 'PlayerPosition.C':
            return 'C';
        }
    }
}