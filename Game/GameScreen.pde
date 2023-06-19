public class GameScreen {
  public boolean isPlayerOneWinner = false;
  public boolean hasGameFinished = false;
  public int scorePlayerOne = 0;
  public int scorePlayerTwo = 0;
  private int screenX = 0;
  private int screenY = 0;
  private int playerOneX = 325;
  private int playerTwoX = 325;
  private int playerTwoY = 620;
  private boolean isMovingRightPlayerOne = false;
  private boolean isMovingLeftPlayerOne = false;
  private boolean isMovingRightPlayerTwo = false;
  private boolean isMovingLeftPlayerTwo = false;
  private int PLAYER_HEIGHT = 30;
  private int PLAYER_WIDTH = 250;
  private int PLAYER_ONE_Y = 50;
  private int PLAYER_TWO_Y_OFF = 80;
  private int BALL_HITS_TO_SPEED = 3;
  private int PLAYER_SPEED = 10;
  private Ball ball = new Ball();
  private String playerOneName = "";
  private String playerTwoName = "";
  private int playerHits = 0;
  private boolean isFirstPlayerLastHit = false;
  
  GameScreen() {}
  
  void DRAW() {
    handleMovePlayer();
    hadlePlayerBallHit();
    handleScorePoint();
    drawPlayersObject();
    handleFinishGame();
    drawPlayersScore();
    ball.DRAW();
  }
  
  void SETUP(int screenWidth, int screenHeight) {
    screenX = screenWidth;
    screenY = screenHeight;
    playerTwoY = screenHeight - PLAYER_TWO_Y_OFF;
    ball.SETUP(screenWidth, screenHeight);
  }
  
  void drawPlayersObject() {
    drawPlayerOne();
    drawPlayerTwo();
  }
  
  void drawPlayerOne() {
    drawPlayer(playerOneX, PLAYER_ONE_Y);
  }
  
  void drawPlayerTwo() {
    drawPlayer(playerTwoX, playerTwoY);
  }
  
  void drawPlayer(int x, int y) {
    rect(x, y, PLAYER_WIDTH, PLAYER_HEIGHT);
  }
  
  void drawPlayersScore() {
    String score = playerOneName + " " + scorePlayerOne + " X " + scorePlayerTwo + " " + playerTwoName;
    
    text(score, 25, 25);
  }
  
  void setPlayersName(String playerOneName, String playerTwoName) {
    this.playerOneName = playerOneName;
    this.playerTwoName = playerTwoName;
  }
  
  void handleMovePlayer() {
    if (isMovingLeftPlayerTwo) {
      int newPosition = playerTwoX - PLAYER_SPEED;
      
      if (newPosition >= 0) {
        playerTwoX = newPosition;
      }
    }
    
    if (isMovingRightPlayerTwo) {
      int newPosition = playerTwoX + PLAYER_SPEED;
      int positionWithSize = newPosition + PLAYER_WIDTH;
      
      if (positionWithSize <= screenX) {
        playerTwoX = newPosition;
      }
    }
    
    if (isMovingLeftPlayerOne) {
      int newPosition = playerOneX - PLAYER_SPEED;
      
      if (newPosition >= 0) {
        playerOneX = newPosition;
      } 
    }
    
    if (isMovingRightPlayerOne) {
      int newPosition = playerOneX + PLAYER_SPEED;
      int positionWithSize = newPosition + PLAYER_WIDTH;
      
      if (positionWithSize <= screenX) {
        playerOneX = newPosition;
      }
    }
  }
  
  void handleChangeBallXDirection(boolean isPlayerOneHit) {
    if (isPlayerOneHit) {
      if (isMovingRightPlayerOne) {
        if (ball.directionX == ball.MOVE_STRAIGHT_KEY) {
          ball.directionX = ball.MOVE_RIGHT_KEY; 
        }
      }
      
      if (isMovingLeftPlayerOne) {
        if (ball.directionX == ball.MOVE_STRAIGHT_KEY) {
          ball.directionX = ball.MOVE_LEFT_KEY; 
        }
      }
    } else {
      if (isMovingRightPlayerTwo) {
        if (ball.directionX == ball.MOVE_STRAIGHT_KEY) {
          ball.directionX = ball.MOVE_RIGHT_KEY; 
        }
      }
      
      if (isMovingLeftPlayerTwo) {
        if (ball.directionX == ball.MOVE_STRAIGHT_KEY) {
          ball.directionX = ball.MOVE_LEFT_KEY; 
        }
      }
    }
  }
  
  void hadlePlayerBallHit() {
    int ballUpPositionX = ball.ballX;
    int ballUpPositionY = ball.ballY - (ball.ballSize / 2);
    int ballDownPositionX = ball.ballX;
    int ballDownPositionY = ball.ballY + (ball.ballSize / 2); 
    int playerOneFinal = playerOneX + PLAYER_WIDTH;
    int playerOneInitial = playerOneX;
    int playerTwoFinal = playerTwoX + PLAYER_WIDTH;
    int playerTwoInitial = playerTwoX;
    
    boolean isOnPlayerOneX = ballUpPositionX >= playerOneInitial && ballUpPositionX <= playerOneFinal;
    boolean isOnPlayerOneY = ballUpPositionY <= (PLAYER_ONE_Y + PLAYER_HEIGHT) && ballUpPositionY >= PLAYER_ONE_Y;
    boolean isOnPlayerTwoX = ballDownPositionX >= playerTwoInitial && ballDownPositionX <= playerTwoFinal;
    boolean isOnPlayerTwoY = ballDownPositionY >= playerTwoY && ballDownPositionY <= (playerTwoY + PLAYER_HEIGHT);
    
    boolean hasPlayerOneHit = (isOnPlayerOneX && isOnPlayerOneY) && !isFirstPlayerLastHit;
    boolean hasPlayerTwoHit = (isOnPlayerTwoX && isOnPlayerTwoY) && isFirstPlayerLastHit;
    
    if (hasPlayerOneHit || hasPlayerTwoHit) {
      ball.invertBallY();
      playerHits += 1;
    }
    
    if (hasPlayerOneHit) {
      handleChangeBallXDirection(true);
      isFirstPlayerLastHit = true;
    } else if (hasPlayerTwoHit) {
      handleChangeBallXDirection(false);
      isFirstPlayerLastHit = false;
    }
    
    if (playerHits == BALL_HITS_TO_SPEED) {
      ball.handleSpeedBall();
      playerHits = 0;
    }
  }
  
  void handleFinishGame() {
    boolean playerOneHasMaximumScore = scorePlayerOne == 3;
    boolean playerTwoHasMaximumScore = scorePlayerTwo == 3;
    
    if (playerOneHasMaximumScore) {
      isPlayerOneWinner = true; //<>//
      hasGameFinished = true;
    } 
    
    if (playerTwoHasMaximumScore) {
      isPlayerOneWinner = false; //<>//
      hasGameFinished = true;
    }
  }
  
  void handleScorePoint() {
    int ballUpPositionY = ball.ballY - (ball.ballSize / 2);
    int ballDownPositionY = ball.ballY + (ball.ballSize / 2); 
    
    if (ballDownPositionY <= PLAYER_ONE_Y) {
      scorePlayerTwo = scorePlayerTwo + 1;
      ball.resetBall(false);
      isFirstPlayerLastHit = false;
    } else if (ballUpPositionY >= (playerTwoY + PLAYER_HEIGHT)) {
      scorePlayerOne = scorePlayerOne + 1;
      ball.resetBall(true);
      isFirstPlayerLastHit = true;
    }
  }
  
  void handleKeyPressed() {
    if (keyCode == LEFT) {
      isMovingRightPlayerTwo = false;
      isMovingLeftPlayerTwo = true;
    }
    
    if (keyCode == RIGHT) {
      isMovingLeftPlayerTwo = false;
      isMovingRightPlayerTwo = true;
    }
    
    if (key == 'a' || key == 'A') {
      isMovingRightPlayerOne = false;
      isMovingLeftPlayerOne = true;
    }
    
    if (key == 'd' || key == 'D') {
      isMovingRightPlayerOne = true;
      isMovingLeftPlayerOne = false;
    }
  }
  
  void handleKeyReleased() {
    if (keyCode == LEFT) {
      isMovingLeftPlayerTwo = false;
    }
    
    if (keyCode == RIGHT) {
      isMovingRightPlayerTwo = false;
    }
    
    if (key == 'a' || key == 'A') {
      isMovingLeftPlayerOne = false;
    }
    
    if (key == 'd' || key == 'D') {
      isMovingRightPlayerOne = false;
    }
  }
}
