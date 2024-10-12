Dice bob;
int diceNum;
int sum;
int counter = 1;
int previousTime = second();
int currentTime = 0;
boolean runOnce = true;
int countSecs = 3;
int[] bgColor = {255, 236, 194};
boolean runFinished = false;
int colorSwitch = (int)(Math.random()*2);

void setup() {
  size(400, 400);
  background(bgColor[0], bgColor[1], bgColor[2]);
  textAlign(CENTER, CENTER);
}
void draw() {
  if (runOnce == true) {
    sum = 0;
    for (int y = 10; y < 301; y+= 62) {
      for (int x = 20; x < 361; x+= 62) {
        Dice bob = new Dice(x, y);
        bob.show();
        bob.showFace();
      }
    }
    //System.out.println("Sum: " + sum);
    fill(0);
    runOnce = false;
  }
  //System.out.println("Current time in sec: " + second());
  currentTime = second();
  if (currentTime != previousTime) {
      currentTime = second();
      //System.out.println("A second has passed!");
      previousTime = second();
      //System.out.println("Reveal in: " + countSecs + " secs!");
      noStroke();
      fill(bgColor[0], bgColor[1], bgColor[2]);
      textSize(40);
      rect(20, 320, 400, 100);
      fill(0);
      text(countSecs, 200, 350);
      countSecs--;

    textSize(25);
    if (countSecs < 0) {
      runFinished = true;
      //System.out.println("You got a sum of " + sum + "!");
      fill(bgColor[0], bgColor[1], bgColor[2]);
      rect(20, 320, 400, 100);
      fill(0);
      text("You got a sum of: " + sum, 200, 330);
      if (sum == 180) {
        text("Now THAT'S a high score!! ", 200, 360);
        counter++;
      } else if (sum > 130) {
      } else if (sum > 110) {
        text("Wow, that's pretty good!", 200, 360);
        counter++;
      } else {
        textSize(19);
        text("That's kinda high ? (maybe try again..)!", 200, 360);
        counter++;
      }
    }
  }
}

// roll again if they click the mouse
void mousePressed() {
  if(runFinished == true) {
      runOnce = true;
      previousTime = second();
      countSecs = 3;
      fill(bgColor[0], bgColor[1], bgColor[2]);
      rect(20, 320, 400, 100);
      stroke(0);
      colorSwitch = (int)(Math.random()*2);
  redraw();
  
  }
}

//void mouseReleased() {
//  noLoop();
//}


boolean keyClicked = false;

//void keyPressed() {
//  if(!keyClicked) {
//    System.out.println("You clicked a key!");
//    if(sum >= 130) {
//      System.out.println("You will win the jackpot !");
//    } else {
//      System.out.println("You did not win the jackpot ;( !");
//    }
//    keyClicked = true; // key is clicked
//  }
//}
//void keyReleased() {
//  keyClicked = false; // reset when key is released
//}

class Dice {
  // member variables
  int face, myX, myY;
  Dice(int x, int y) {
    roll();
    myX = x;
    myY = y;
  }

  // member functions
  void roll() {
    face = (int)(Math.random() * 6 + 1);
  }

  void show() {
    if(colorSwitch == 0) {
      fill(255);
    } else {
      fill(24, 173, 171);
    }
    rect(myX, myY, 50, 50, 8, 8, 8, 8);
  }

  void showFace() {
    // faces of each die
    if(colorSwitch == 0) {
      fill(24, 173, 171);
    } else {
      fill(255);
    }
    if (face == 6) {
      sum+= 6;
      for (int y = 1; y < 4; y++) {
        for (int x = 1; x < 3; x++) {
          if (x % 2 == 0) {
            ellipse(myX + 15, myY + 13*y, 8, 8);
          } else {
            ellipse(myX + 35, myY + 13*y, 8, 8);
          }
        }
      }
    } else if (face == 5) {
      sum += 5;
      ellipse(myX + 12, myY +12, 8, 8);
      ellipse(myX + 50 - 12, myY + 12, 8, 8);
      ellipse(myX + 12, myY + 50 - 12, 8, 8);
      ellipse(myX + 50 - 12, myY + 50 - 12, 8, 8);
      ellipse(myX + 25, myY + 25, 8, 8);
    } else if (face == 4) {
      sum += 4;
      ellipse(myX + 12, myY +12, 8, 8);
      ellipse(myX + 50 - 12, myY + 12, 8, 8);
      ellipse(myX + 12, myY + 50 - 12, 8, 8);
      ellipse(myX + 50 - 12, myY + 50 - 12, 8, 8);
    } else if (face == 3) {
      sum += 3;
      ellipse(myX + 25, myY + 25, 8, 8);
      ellipse(myX + 12, myY +12, 8, 8);
      ellipse(myX + 50 - 12, myY + 50 - 12, 8, 8);
    } else if (face == 2) {
      sum+= 2;
      ellipse(myX + 12, myY +12, 8, 8);
      ellipse(myX + 50 - 12, myY + 50 - 12, 8, 8);
    } else {// if face == 1..
      sum += 1;
      ellipse(myX + 25, myY + 25, 8, 8);
    }
  }
}
