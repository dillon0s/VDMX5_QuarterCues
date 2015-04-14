class UIbox
{
  
  int xMultiplier;
  int yMultiplier;
  String function;
  String keyboard;
  
  int pulseFill = 0;
  
  UIbox(int tempXmult, int tempYmult, String tempFunction, String tempKeyboard)
  {
    
    xMultiplier = tempXmult;
    yMultiplier = tempYmult;
    function = tempFunction;
    keyboard = tempKeyboard;
    
  }
  
  void draw()
  {
    
    fill(pulseFill);
    rect(width*xMultiplier/5,height*yMultiplier/3,50,50);
    noFill();
    rect(width*xMultiplier/5,height*yMultiplier/3,50,50);
    fill (255);
    text(function,width*xMultiplier/5,height*yMultiplier/3);
    text(keyboard,width*xMultiplier/5,(height*yMultiplier/3)+15);
    
    if (pulseFill > 0)
    {
      pulseFill -= 5;
    }
    
  }
  void pulse()
  {
    
    pulseFill = 150;
    
  }
}
