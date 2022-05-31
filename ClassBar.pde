class Bar {
  int year;
  float KvaegAmount;
  float GrisAmount;
  float FjerkraeAmount;
  float AndreAmount;  



  Bar(int y, float K, float G, float F, float A) {
    year = y;
    KvaegAmount = K;
    GrisAmount = G;
    FjerkraeAmount = F;
    AndreAmount = A;
  }


  void display(float scaleFactor) {

    //cow maker: visere Kvaeg i tilfældig rækkefølge
    for (int i=1; i<35; i++) {
      int hmm = int(random(1, 4));
      if (hmm==1)image(Kvaeg1, i*50, 460, 50, 50);
      if (hmm==2)image(Kvaeg2, i*50, 460, 50, 50);
      if (hmm==3)image(Kvaeg3, i*50, 460, 50, 50);
    }
    //pig maker: viser Gris i tilfældig rækkefølge
    for (int i=1; i<35; i++) {
      int hmm = int(random(1, 4));
      if (hmm==1)image(Gris1, i*50, 540, 50, 50);
      if (hmm==2)image(Gris2, i*50, 540, 50, 50);
      if (hmm==3)image(Gris3, i*50, 540, 50, 50);
    }
    //hen maker: viser Fjerkrae i tilfældig rækkefølge
    for (int i=1; i<35; i++) {
      int hmm = int(random(1, 4));
      if (hmm==1)image(Fjerkrae1, i*50, 620, 50, 50);
      if (hmm==2)image(Fjerkrae2, i*50, 620, 50, 50);
      if (hmm==3)image(Fjerkrae3, i*50, 620, 50, 50);
    }
    //others maker: viser Andredyr i tilfældig rækkefølge
    for (int i=1; i<35; i++) {
      int hmm = int(random(1, 4));
      if (hmm==1)image(Andre1, i*50, 700, 50, 50);
      if (hmm==2)image(Andre2, i*50, 700, 50, 50);
      if (hmm==3)image(Andre3, i*50, 700, 50, 50);
    }

    // dette gør så at hvis FjerkraeAmount er over eller under visse værdier vil Bar blive scaleret tilsvarende
    // der bliver tilsvarende lavet en kasse hvor at skaleringen vises

    stroke(0);
    noFill();
    rect(55, 370, 200, 40);
    textSize(25);
    if (FjerkraeAmount<500000) {
      scaleFactor = 5;
      text("Skaleringen "+scaleFactor, 60, 400);
    } else if (FjerkraeAmount<2000000) {
      scaleFactor = 2;
      text("Skaleringen "+scaleFactor, 60, 400);
    } else if (FjerkraeAmount>3500000) {
      scaleFactor = 0.5;
      text("Skaleringen "+scaleFactor, 60, 400);
    } else {
      scaleFactor = 1;
      text("Skaleringen "+scaleFactor, 60, 400);
    }


    // de kasser der dækker for resten af dyrene
    // længden er udregnet som procent af det restareal der er tilbage efter Amount. 
    // Jeg lægger 50 til længden så der altid vil være et dyr vist i bjælken

    fill(51, 75, 53);
    noStroke();
    rect(width-50, 460, (-(1-(KvaegAmount/4200000.0*scaleFactor))*(width-100))+ 50, 50);   
    rect(width-50, 540, (-(1-(GrisAmount/4200000.0*scaleFactor))*(width-100))+ 50, 50);
    rect(width-50, 620, (-(1-(FjerkraeAmount/4200000.0*scaleFactor))*(width-100))+ 50, 50);
    rect(width-50, 700, (-(1-(AndreAmount/4200000.0)*scaleFactor)*(width-100))+ 50, 50);

    //hvide kanter
    fill(255);
    rect(40, 50, 5, height-90);
    rect(40, 760, 1700, 5);


    //Dyr-tekst venstre centreret
    textSize(25);
    textAlign(LEFT);
    text("Kvæg: "+KvaegAmount, (width-(1-(KvaegAmount/4200000.0*scaleFactor))*(width-100))-40+50, 490);
    text("Grise: "+GrisAmount, (width-(1-(GrisAmount/4200000.0*scaleFactor))*(width-100))-40+50, 570);
    text("Fjerkræ: "+FjerkraeAmount, (width-(1-(FjerkraeAmount/4200000.0*scaleFactor))*(width-100))-40+50, 650);
    text("Andre Dyr: "+AndreAmount, (width-(1-(AndreAmount/4200000.0*scaleFactor))*(width-100))-40+50, 730);


    //overskriften sætter vi ind i en push/pop matrix for at de CENTER align ikke påvirker andre text-stykker
    pushMatrix();
    textSize(50);
    textFont(PopMedium);
    textAlign(CENTER);
    text("Antallet af    ko Dyr i Dansk Landbrug", 900, 100);
    popMatrix();

    println(scaleFactor);
  }
}
