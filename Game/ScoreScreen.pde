public class ScoreScreen {
  private int playerOneScore = 0;
  private int playerTwoScore = 0;
  private boolean isPlayerOneWinner = false;
  private String playerOneName = "";
  private String playerTwoName = "";
  private int screenX = 0;
  private int screenY = 0;
  
  void DRAW() {
    drawTexts();
  }
  
  void SETUP(int playerOneScore, int playerTwoScore, boolean isPlayerOneWinner, String playerOneName, String playerTwoName, int screenX, int screenY) {
    setPlayersInfo(playerOneScore, playerTwoScore, isPlayerOneWinner, playerOneName, playerTwoName);
    setScreenInfo(screenX, screenY);
  }
  
  void drawTexts() {
    drawWinner();
    drawFinalScore();
  }
  
  void drawWinner() {
    String winnerName = "";
    
    if (isPlayerOneWinner) winnerName = playerOneName;
    else winnerName = playerTwoName;
    
    String winnerText = "Vencedor da partida: " + winnerName;
    int textX = (screenX / 2) - 100;
    int textY = (screenY / 2) - 50;
    text(winnerText, textX, textY);    
  }
  
  void drawFinalScore() {
    String finalScore = playerOneName + " " + playerOneScore + " X " + playerTwoScore + " " + playerTwoName;
    int textX = (screenX / 2) - 100;
    int textY = screenY / 2;
    
    text(finalScore, textX, textY);
  }
  
  void setPlayersInfo(int playerOneScore, int playerTwoScore, boolean isPlayerOneWinner, String playerOneName, String playerTwoName) {
    this.playerOneScore =playerOneScore;
    this.playerTwoScore = playerTwoScore;
    this.isPlayerOneWinner = isPlayerOneWinner;
    this.playerOneName = playerOneName;
    this.playerTwoName = playerTwoName;
  }
  
  void setScreenInfo(int screenX, int screenY) {
    this.screenY = screenY;
    this.screenX = screenX;
  }
}
