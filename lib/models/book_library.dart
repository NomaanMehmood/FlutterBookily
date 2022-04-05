class BookLibraryModel{
  static List<Books>books_library=
  [
    Books(
    id:1,
    title: "Kite runner",
    Description:"...",
    Image:"assets/images/Tkrunner.png",
    audio_file:"",

),
    Books(
      id:2,
      title: "Dune",
      Description:"...",
      Image:"assets/images/dune.png",
      audio_file:"",

    ),
    Books(
      id:3,
      title: "Harry Potter",
      Description:"..",
      Image:"assets/images/harrypotter.png",
      audio_file:"",

    ),
    Books(
      id:4,
      title: "Lost Girl",
      Description:"...",
      Image:"assets/images/lostGirl.png",
      audio_file:"",

    ),
    Books(
      id:5,
      title: "Sea Prayer",
      Description:".. ",
      Image:"assets/images/SeaPrayer.png",
      audio_file:"",

    ),
    Books(
      id:6,
      title: "Alchemist",
      Description:"..",
      Image:"assets/images/alchemist.png",
      audio_file:"",

    ),



  ];

}
class Books{
  static String tblBook="books";
  final int id;
  final String title;
  final String Description;
  final String Image;
  final String audio_file;

  Books({required this.id, required this.title,  required this.Description, required this.Image, required this.audio_file});
  factory Books.fromMap(Map<String,dynamic> map){
    return Books(
      id: map["id"],
      title: map["title"],
      Description: map["Description"],
      Image: map["Image"],
      audio_file: map["audio_file"],

    );
  }
  toMap()=>{
    "id":id,
    "title":title,
    "Description": Description,
    "Image":Image,
    "audio_file": audio_file,

  };


}
