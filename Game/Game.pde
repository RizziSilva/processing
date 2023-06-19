
GameScreen gameScreen = new GameScreen();
ScoreScreen scoreScreen = new ScoreScreen();
int SCREEN_WIDTH = 900;
int SCREEN_HEIGHT = 900;
StartScreen startScreen = new StartScreen(SCREEN_WIDTH, SCREEN_HEIGHT);

void setup() {
  size(900, 900);
  gameScreen.SETUP(SCREEN_WIDTH, SCREEN_HEIGHT);
}

void draw() {
  drawScreen();
}

void drawScreen() {
  background(140);
  String playerOneName = startScreen.getTextValueByInputName(startScreen.PLAYER_ONE_INPUT_NAME);
  String playerTwoName = startScreen.getTextValueByInputName(startScreen.PLAYER_TWO_INPUT_NAME);
  
  if (startScreen.hasGameStarted && !gameScreen.hasGameFinished) {
    gameScreen.setPlayersName(playerOneName, playerTwoName);
    gameScreen.DRAW();
  } else if (gameScreen.hasGameFinished) {
    scoreScreen.SETUP(gameScreen.scorePlayerOne, gameScreen.scorePlayerTwo, gameScreen.isPlayerOneWinner, playerOneName, playerTwoName, SCREEN_WIDTH, SCREEN_HEIGHT);
    
    scoreScreen.DRAW();
  } else {
    startScreen.DRAW();
  }
}

void handleInputsStartScreen() {
  for (TextBox text : startScreen.textBoxs) {
    text.KEYPRESSED(key, keyCode);
  }
}

void mousePressed() {
  for (TextBox text : startScreen.textBoxs) {
    boolean isClicked = text.PRESSED(mouseX, mouseY);
    
    if (isClicked && text.inputName == startScreen.START_BUTTON_NAME) {
      boolean shouldStartGame = startScreen.getShouldStartGame();
      
      startScreen.hasGameStarted = shouldStartGame;
    }
  }
}
  
void keyPressed() {
  if (startScreen.hasGameStarted) {
    gameScreen.handleKeyPressed();
  } else {
    handleInputsStartScreen();
    
    if (keyCode == ENTER) {
      boolean shouldStartGame = startScreen.getShouldStartGame();
      
      startScreen.hasGameStarted = shouldStartGame;
    }
  }
}

void keyReleased() {
  if (startScreen.hasGameStarted) {
    gameScreen.handleKeyReleased();
  }
}
