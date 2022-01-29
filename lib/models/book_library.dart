class BookLibraryModel{
  static final library=[Books(
    id:1,
    title: "Kite runner",
    Description:"kite runner",
    Image:"assets/images/Tkrunner.png",

),
    Books(
      id:2,
      title: "Dune",
      Description:"Dune Novel",
      Image:"assets/images/dune.png",

    ),
    Books(
      id:3,
      title: "Harry Potter",
      Description:"Harry Potter series",
      Image:"assets/images/harrypotter.png",

    ),
    Books(
      id:4,
      title: "Lost Girl",
      Description:"The Lost Girl",
      Image:"assets/images/lostGirl.png",

    ),
    Books(
      id:5,
      title: "Sea Prayer",
      Description:"Sea Prayer now published",
      Image:"assets/images/SeaPrayer.png",

    ),
    Books(
      id:6,
      title: "Alchemist",
      Description:"The Alchemist",
      Image:"assets/images/alchemist.png",

    ),



  ];

}
class Books{
  final int id;
  final String title;
  final String Description;
  final String Image;

  Books({required this.id, required this.title,  required this.Description, required this.Image});


}
