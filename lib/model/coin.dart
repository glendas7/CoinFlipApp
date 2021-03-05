class Coin {
  String face;
  String imageURL;

  Coin({this.imageURL, this.face});
}

var faceList = [
  Coin(
    face: 'Heads',
    imageURL: 'images/Coin-front.png',
  ),
  Coin(
    face: 'Tails',
    imageURL: 'images/Coin-back.png',
  ),
];
