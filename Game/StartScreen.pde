public class StartScreen {
  public String playerOneName = "";
  public String playerTwoName = "";
  public boolean hasGameStarted = false;
  public ArrayList<TextBox> textBoxs = new ArrayList<TextBox>();
  public String PLAYER_ONE_INPUT_NAME = "PLAYER_ONE";
  public String PLAYER_TWO_INPUT_NAME = "PLAYER_TWO";
  public String START_BUTTON_NAME = "START";
  private int screenX = 0;
  private int screenY = 0;
  private int TEXT_BOX_WIDTH = 250;
  private int TEXT_BOX_HEIGHT = 30;
  private int TEXT_BOX_MARGIN = 60;
  private int START_BUTTON_WIDTH = 100;
  private int START_BUTTON_HEIGHT = 60;
  
  StartScreen(int screenX, int screenY) {
    this.screenX = screenX;
    this.screenY = screenY;
    setupScreen(screenX, screenY);
  }
  
  void DRAW() {
    createTexts();
    for (TextBox text : textBoxs) {
      text.DRAW();
    }
  }
  
  void setupScreen(int screenX, int screenY) {
    createNameInputs(screenX, screenY);
    createStartButton(screenX, screenY);
  }
  
  void createNameInputs(int screenX, int screenY) {
    int inputsX = (screenX / 2) - (TEXT_BOX_WIDTH / 2);
    int playerOneInputY = (screenY / 2) - (TEXT_BOX_MARGIN + TEXT_BOX_HEIGHT);
    int playerTwoInputY = (screenY / 2);
    
    createTextBox(inputsX, playerOneInputY, TEXT_BOX_WIDTH, TEXT_BOX_HEIGHT, PLAYER_ONE_INPUT_NAME, false, false);
    createTextBox(inputsX, playerTwoInputY, TEXT_BOX_WIDTH, TEXT_BOX_HEIGHT, PLAYER_TWO_INPUT_NAME, false, false);  
  }
  
  void createTexts() {
    int textsX = (screenX / 2) - (TEXT_BOX_WIDTH / 2);
    int textPlayerOneY = (screenY / 2) - (TEXT_BOX_MARGIN + TEXT_BOX_HEIGHT) - 5;
    int textPlayerTwoY = (screenY / 2) - 5;
    int textStartButtonX = screenX / 2 - 20;
    int textStartButtonY = screenY / 2 + TEXT_BOX_HEIGHT + 35 + (START_BUTTON_HEIGHT / 2);
    
    text("Nome Jogador Um:", textsX, textPlayerOneY);
    text("Nome Jogador Dois:", textsX, textPlayerTwoY);
    text("Start", textStartButtonX, textStartButtonY);
  }
  
  void createStartButton(int screenX, int screenY) {
    int buttonX = (screenX / 2) - (START_BUTTON_WIDTH / 2);
    int buttonY = (screenY / 2) + TEXT_BOX_HEIGHT + 30;
    
    createTextBox(buttonX, buttonY, START_BUTTON_WIDTH, START_BUTTON_HEIGHT, START_BUTTON_NAME, true, true);
  }
  
  void createTextBox(int x, int y, int w, int h, String name, boolean isButton, boolean isBorderEnable) {
    TextBox text = new TextBox();
    text.W = w;
    text.H = h;
    text.X = x;
    text.Y = y;
    text.BorderEnable = isBorderEnable;
    text.isButton = isButton;
    text.inputName = name;
    
    textBoxs.add(text);
  }
  
  String getTextValueByInputName(String name) {
    String value = "";
   
    for (TextBox text : textBoxs) {
      if (text.inputName == name) value = text.Text;
    }
   
    return value;
  }
  
  boolean getShouldStartGame() {
    String playerOneName = getTextValueByInputName(PLAYER_ONE_INPUT_NAME);
    String playerTwoName = getTextValueByInputName(PLAYER_TWO_INPUT_NAME);
    String playerOneNameWithoutSpaces = playerOneName.trim();
    String playerTwoNameWithoutSpaces = playerTwoName.trim();
    
    return !playerOneNameWithoutSpaces.isEmpty() && !playerTwoNameWithoutSpaces.isEmpty();
  }
}
