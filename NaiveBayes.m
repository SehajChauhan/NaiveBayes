load("play_tennis_training.txt");

%classAttribute
  classes = play_tennis_training(:,5);
  class0 = (classes == 0);
  class1 = (classes == 1);
  class0count = sum(class0);
  class1count = sum(class1);
  P0 = class0count./length(class0);
  P1 = class1count./length(class1);


%featureAttributes

  %outlook
    outlook = play_tennis_training(:,1);
    overcast = (outlook == 0);
    rainy = (outlook == 1);
    sunny = (outlook == 2);
    overcastCount = sum(overcast);
    rainyCount = sum(rainy);
    sunnyCount = sum(sunny);
    Povercast = overcastCount./length(overcast);
    Prainy = rainyCount./length(rainy);
    Psunny = sunnyCount./length(sunny);

    overcastYes = ((outlook==0)&(classes==1));
    overcastNo = ((outlook==0)&(classes==0));
    PovercastYes = sum(overcastYes)./class1count;
    PovercastNo = sum(overcastNo)./class0count;

    rainyYes = ((outlook==1)&(classes==1));
    rainyNo = ((outlook==1)&(classes==0));
    PrainyYes = sum(rainyYes)./class1count;
    PrainyNo = sum(rainyNo)./class0count;

    sunnyYes = ((outlook==2)&(classes==1));
    sunnyNo = ((outlook==2)&(classes==0));
    PsunnyYes = sum(sunnyYes)./class1count;
    PsunnyNo = sum(sunnyNo)./class0count;


  %temperature
    temperature = play_tennis_training(:,2);
    cool = (temperature == 0);
    mild = (temperature == 1);
    hot = (temperature == 2);
    coolCount = sum(cool);
    mildCount = sum(mild);
    hotCount = sum(hot);
    Pcool = coolCount./length(cool);
    Pmild = mildCount./length(mild);
    Phot = hotCount./length(hot);

    coolYes = ((temperature==0)&(classes==1));
    coolNo = ((temperature==0)&(classes==0));
    PcoolYes = sum(coolYes)./class1count;
    PcoolNo = sum(coolNo)./class0count;

    mildYes = ((temperature==1)&(classes==1));
    mildNo = ((temperature==1)&(classes==0));
    PmildYes = sum(mildYes)./class1count;
    PmildNo = sum(mildNo)./class0count;

    hotYes = ((temperature==2)&(classes==1));
    hotNo = ((temperature==2)&(classes==0));
    PhotYes = sum(hotYes)./class1count;
    PhotNo = sum(hotNo)./class0count;


  %Humidity
    humidity = play_tennis_training(:,3);
    normal = (humidity == 0);
    high = (humidity == 1);
    normalCount = sum(normal);
    highCount = sum(high);
    Pnormal = normalCount./length(normal);
    Phigh = highCount./length(high);

    normalYes = ((humidity==0)&(classes==1));
    normalNo = ((humidity==0)&(classes==0));
    PnormalYes = sum(normalYes)./class1count;
    PnormalNo = sum(normalNo)./class0count;

    highYes = ((humidity==1)&(classes==1));
    highNo = ((humidity==1)&(classes==0));
    PhighYes = sum(highYes)./class1count;
    PhighNo = sum(highNo)./class0count;


  %Wind
    wind = play_tennis_training(:,4);
    weak = (wind == 0);
    strong = (wind == 1);
    weakCount = sum(weak);
    strongCount = sum(strong);
    Pweak = weakCount./length(weak);
    Pstrong = strongCount./length(strong);


    weakYes = ((wind==0)&(classes==1));
    weakNo = ((wind==0)&(classes==0));
    PweakYes = sum(weakYes)./class1count;
    PweakNo = sum(weakNo)./class0count;

    strongYes = ((wind==1)&(classes==1));
    strongNo = ((wind==1)&(classes==0));
    PstrongYes = sum(strongYes)./class1count;
    PstrongNo = sum(strongNo)./class0count;

%Prompt user for instance input
  promptO = 'Enter Outlook number: ';
    O = input(promptO);
  promptT = 'Enter Temperature number: ';
    T = input(promptT);
  promptH = 'Enter Humidity number: ';
    H = input(promptH);
  promptW = 'Enter Wind number: ';
    W = input(promptW);


%For Overcast No
  switch O
      case 0
          A = PovercastNo;
          A1 = Povercast;
      case 1
          A = PrainyNo;
          A1 = Prainy;
      case 2
          A = PsunnyNo;
          A1 = Psunny;
  end
%For Overcast Yes
  switch O
      case 0
          B = PovercastYes;
      case 1
          B = PrainyYes;
      case 2
          B = PsunnyYes;
  end

%For Temperature No
  switch T
      case 0
          C = PcoolNo;
          C1 = Pcool;
      case 1
          C = PmildNo;
          C1 = Pmild;
      case 2
          C = PhotNo;
          C1 = Phot;
  end
%For Temperature Yes
  switch T
      case 0
          D = PcoolYes;
      case 1
          D = PmildYes;
      case 2
          D = PhotYes;
  end

%For Humidity No
  switch H
      case 0
          E = PnormalNo;
          E1 = Pnormal;
      case 1
          E = PhighNo;
          E1 = Phigh;
  end
%For Humidity Yes
  switch H
      case 0
          F = PnormalYes;
      case 1
          F = PhighYes;
  end

%For Wind No
  switch W
      case 0
          G = PweakNo;
          G1 = Pweak;
      case 1
          G = PstrongNo;
          G1 = Pstrong;
  end
%For Wind Yes
  switch W
      case 0
          K = PweakYes;
      case 1
          K = PstrongYes;
  end

%Showing the final classification of user provided instance
  disp("yesTotal= "+class1count)
  disp("noTotal= "+class0count)

  condProbOnNo = [A, C, E, G]
  condProbOnYes = [B, D, F, K]

  theprobYesis = B*D*F*K*P1;
  theprobNois = A*C*E*G*P0;
  PX = A1*C1*E1*G1;
  Pplay = theprobYesis./PX;
  Pnoplay = theprobNois./PX;

  disp("the prob No is: "+theprobNois)
  disp("the prob Yes is: "+theprobYesis)

  if (Pplay>Pnoplay)
      disp("Answer: Yes")
  else
      disp("Answer: No")
  end
