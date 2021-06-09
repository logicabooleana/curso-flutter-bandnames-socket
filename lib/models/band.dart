

class Band{
  String id="";
  String name ="";
  int botes = 0 ;

  Band({this.id="",this.name="",this.botes=0});

  factory Band.fromMap(Map<String,dynamic> obj ) => Band(
    id: obj["id"],
    name: obj["name"],
    botes: obj["botes"],
    );

}