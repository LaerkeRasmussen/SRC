Histogram histogram = new Histogram();
int selectedYear = 1995;
int stepYear = 0;
float scaleFactor = 1;


//
PImage Kvaeg1;
PImage Kvaeg2;
PImage Kvaeg3;
PImage Gris1;
PImage Gris2;
PImage Gris3;
PImage Fjerkrae1;
PImage Fjerkrae2;
PImage Fjerkrae3;
PImage Andre1;
PImage Andre2;
PImage Andre3;

PImage Gras;
PFont PopMedium;
PImage Oeko;

void setup() {

  size(1800, 800);
  Gras= loadImage("baggrund 2.png");
  image(Gras, 0, 0, 1800, 800);
  Oeko = loadImage("OEKO.png");
  image(Oeko, 712, 62, 40, 40);


  //loader Poppins Medium;
  PopMedium = createFont("Poppins-Medium.ttf", 50);

  //loader alle dyrene
  Kvaeg1    = loadImage("ko 1.png");
  Kvaeg2    = loadImage("ko 2.png");
  Kvaeg3    = loadImage("ko 3.png");
  Gris1     = loadImage("gris 1.png");
  Gris2     = loadImage("gris 2.png");
  Gris3     = loadImage("gris 3.png");
  Fjerkrae1 = loadImage("høne 1.png");
  Fjerkrae2 = loadImage("høne 2.png");
  Fjerkrae3 = loadImage("høne 3.png");
  Andre1    = loadImage("fisk.png");
  Andre2    = loadImage("Andet- kanin.png");
  Andre3    = loadImage("Andet- får.png");

  histogram.AArstalsLinje();
  histogram.loadData();
  histogram.display(selectedYear, scaleFactor);
}

void draw() {
}
void mouseReleased() {
  clear();
  image(Gras, 0, 0, 1800, 800);
  image(Oeko, 712, 62, 40, 40);
  histogram.AArstalsLinje();
  histogram.loadData();
  histogram.display(selectedYear, scaleFactor);
}

void keyPressed() {
  clear();
  image(Gras, 0, 0, 1800, 800);
  image(Oeko, 712, 62, 40, 40);
  histogram.AArstalsLinje();
  histogram.loadData();
  histogram.display(selectedYear, scaleFactor);
  if (key == '1') {
    stepYear = -1;
  } else if (key == '2') {
    stepYear = 0;
  } else if (key == '3') {
    stepYear = 1;
  }
  if (keyCode==RIGHT&&selectedYear!=2021) {
    selectedYear++;
  }
  if (keyCode==LEFT&&selectedYear!=1995) {
    selectedYear--;
  }
  if (keyCode==UP) {
    scaleFactor++;
  }
  if (keyCode==DOWN) {
    scaleFactor--;
  }
}
