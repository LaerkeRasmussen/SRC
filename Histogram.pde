class Histogram {

  HashMap<String, Bar> dataList  = new HashMap<String, Bar>();



  void loadData() {
    Table table = loadTable("OekoDyrData.csv", "header");


    // her køre det forloop der indlæser de forsekllige data der er under "HEADER" og tildeler dem en variable
    for (TableRow r : table.rows()) {
      int year            = r.getInt("Year");
      int KvaegAmount     = r.getInt("Kvaeg");
      int GrisAmount      = r.getInt("Gris");
      int FjerkraeAmount  = r.getInt("Fjerkrae");
      int AndreAmount     = r.getInt("AndreDyr");
      String listeKey     =  ""+year;
      Bar b               = dataList.get(listeKey);

      // hvis Bar er null laves der nye Bar
      if (b== null) {
        dataList.put(listeKey, new Bar(year, KvaegAmount, GrisAmount, FjerkraeAmount, AndreAmount));
      }
    }

    // her køre der det forloop der indlæser det samlede bruttoudbytte ind under headeren og tildeler den variablen BruttoUdbytte
    // når year2 er det samme som selectedYear bliver bruttoudbyttet udskrevet
    // er year2 ikke det samme vises der på skærmen "der er ikke data for dette år"
    Table table2 = loadTable("Bruttoudbytte.csv", "header");
    boolean t = false;
    for (TableRow r2 : table2.rows()) {
      int year2           = r2.getInt("year");
      float BruttoUdbytte = r2.getFloat("SamletBruttoUdbytte"); 

      if (year2 == selectedYear) {
        t = true;
        fill(108, 157, 112);
        rect(1450, 370, 335, 85);
        fill(255);
        textSize(20);
        text("Bruttoudbyttet for dette år er: ", 1460, 400);
        text(BruttoUdbytte*1000 + " kroner", 1460, 430);
        println(BruttoUdbytte);
        break;
      } else if (year2 == 0) {
        t = false;
      }
    }
    if (t == false) {
      fill(108, 157, 112);
      rect(1450, 370, 335, 85);
      textSize(20);
      fill(225);
      text("Der er ikke data for dette år", 1460, 400);
    }
  }


  // Laver en headline vi kan kalde i OekoDyrProgram for at vise histogrammet
  void display (int selectedYear, float scaleFactor) {

    //translate(80,50);
    for (String k : dataList.keySet()) {
      Bar b = dataList.get(k);
      if (b.year == selectedYear)
        b.display(scaleFactor);
    }
  }
  //AArstalsLinje viser rækken af årstal hvor man kan trykke og vælge hvilket år der skal vises data fra 
  // der bliver lavet kasser ud fra aar
  void AArstalsLinje() {
    for (int aar = 1; aar<28; aar ++) {
      fill(108, 157, 112); 

      float W = 51.8; // Breden af en årstals-kasse 
      if (mouseX>aar*W+165 && mouseX <aar*W+165+51.8 && mouseY>200 && mouseY<200+30) {
        selectedYear = 1995+aar-1;
        println(selectedYear);
        fill(255, 22, 32);
      }
      stroke(0);
      rect(aar*W+165, 200, 51.8, 30);

      fill(255);
      textAlign(LEFT);
      textSize(18);
      text(1995+aar-1, W*aar+168, 222);
    }
  }
}
