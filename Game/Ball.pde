public class Ball {
  public int ballSize = 20;
  public int ballX = 450;
  public int ballY = 450;
  private String MOVE_UP_KEY = "u";
  private String MOVE_DOWN_KEY = "d";
  public String MOVE_LEFT_KEY = "l";
  public String MOVE_RIGHT_KEY = "r";
  public String MOVE_STRAIGHT_KEY = "n";
  public int BALL_INITIAL_X = 450;
  public int BALL_INITIAL_Y = 450;
  public int BALL_INITIAL_SPEED = 5;
  public int BALL_ADITIONAL_SPEED = 2;
  private int ballSpeed = BALL_INITIAL_SPEED;
  public String directionY = "u";
  public String directionX = "n";
  private int screenX = 0;
  private int screenY = 0;
  
  Ball() {}
  
  void DRAW() {
    moveBallY();
    moveBallX();
    circle(ballX, ballY, ballSize);
  }
  
  void SETUP(int screenWidth, int screenHeight) {
    screenX = screenWidth;
    screenY = screenHeight;
  }
  
  void moveBallY() {
    if (directionY == MOVE_UP_KEY) {
      int newPosition = ballY - ballSpeed;
      
      if (newPosition > 0) {
        ballY = newPosition;
      } else {
        directionY = MOVE_DOWN_KEY;
      }
    }
    
    if (directionY == MOVE_DOWN_KEY) {
      int newPosition = ballY + ballSpeed;
      
      if (newPosition < screenY) {
        ballY = newPosition;
      } else {
        directionY = MOVE_UP_KEY;
      }
    }
  }
  
  void moveBallX() {
    if (directionX != MOVE_STRAIGHT_KEY) {
      if (directionX == MOVE_LEFT_KEY) {
        int newPosition = ballX - ballSpeed;
        
        if (newPosition > 10) {
          ballX = newPosition;
        } else {
          directionX = MOVE_RIGHT_KEY;
        }
      }
      
      if (directionX == MOVE_RIGHT_KEY) {
        int newPosition = ballX + ballSpeed;
        
        if (newPosition < (screenX - 10)) {
          ballX = ballX + ballSpeed;
        } else {
          directionX = MOVE_LEFT_KEY;
        }
      }
    }
  }
  
  void invertBallY() {
    if (directionY == MOVE_DOWN_KEY) {
      directionY = MOVE_UP_KEY;
    } else {
      directionY = MOVE_DOWN_KEY;
    }
  }
  
  void resetBall(boolean isPlayerOneScore) {
    ballX = BALL_INITIAL_X;
    ballY = BALL_INITIAL_Y;
    directionX = MOVE_STRAIGHT_KEY;
    ballSpeed = BALL_INITIAL_SPEED;
    
    if (isPlayerOneScore) {
      directionY = MOVE_DOWN_KEY;
    } else {
      directionY = MOVE_UP_KEY;
    }
  }
  
  void handleSpeedBall() {
    ballSpeed += BALL_ADITIONAL_SPEED; 
  }
}
