/* 
Introducing the classic game of ping pong! 2 players can play at once. 
Player blue uses 'w' and 's' for controls while player red uses 'up' and 'down' keys
New game can be started by restarting the program
Sometimes the pieces may not move at the beginning, can be fixed by clicking pause/play again.
*/

/* 
The following link is a reference I used for multiple key pressing implementation
in the game: https://www.processing.org/discourse/beta/num_1139256015.html
*/


int rad = 40;        // Width of the shape
float xpos, ypos;    // Starting position of shape    
float xspeed = 2.0;  // Speed of the shape
float yspeed = 2.0;  // Speed of the shape
int xdirection = 1;  // Left or Right
int ydirection = 1;    // Starting position of shape    
boolean pause = true;
int left = 400; //left side square
int right = 500; //right
int top = 250; //top 
int bot = 350; //bottom
int sqx = 450;
int sqy = 350;
float dist; //for checking dist f


 
void setup() 
{
  size(900, 600);
  noStroke();
  frameRate(150);
  ellipseMode(RADIUS);
  // Set the starting position of the shape
  xpos = rad + 90;
  ypos = rad + 60;
  
  
   smooth();
   
}

void draw() 
{
 //formatting
  background(240,240,200);
  textSize(32);

  fill(100,100,100);
  
  //red and blue pieces and interface
  noStroke();
  fill(100, 100, 255); //fill ball
  ellipse(xpos, ypos, rad, rad); //draw ball
  
  fill(255, 100, 0);
  rect(400, 250, 100, 100);
  
   //update yleft and yright

      // Update ball position
  xpos = xpos - ( xspeed * xdirection );
  ypos = ypos - ( yspeed * ydirection );
  
  
  if ( (xpos - rad <= 0) || (xpos + rad >= width) ) 
  {
    xdirection *= -1;
  }
  
   if ( (ypos + rad >= height) || (ypos - rad <= 0) ) 
  {
    ydirection *= -1;
  }
    
   
  //collisions
 

 // left side
 else if ( (xpos < left) && (ypos > top) && (ypos < bot) )
  {
    if (xpos + rad >= left)
    {
      xdirection *= -1;
    }
  }
  
  
  // right side
  else if ( (xpos > right) && (ypos > top) && (ypos < bot) )
  {
    if (xpos - rad <= right)
    {
      xdirection *= -1;
    }
  }
  
  // top side
  else if ( (ypos < top) && (xpos > left) && (xpos < right) )
  {
    if (ypos + rad >= top)
    {
      ydirection *= -1;
    }
  }
  
  // bottom side
 else if ( (ypos > bot) && (xpos > left) && (xpos < right) )
  {
    if (ypos - rad <= bot) 
    {
      ydirection *= -1;
    }
  }
  
  //top left corner
 else if ( (xpos <= left) && (ypos <= top) ) 
  {
    if (dist(xpos, ypos, left, top) <= rad ) 
    {
      if (left - xpos > top - ypos)
      {
        xdirection *= -1;
      }
      else if (left - xpos < top - ypos)
      {
        ydirection *= -1;
      }
      else if (left - xpos == top - ypos) 
      {
        xdirection *= -1;
        ydirection *= -1;
      }
    }
  }
  
  //top right corner
  else if ( (xpos >= right) && (ypos <= top) ) 
  {
    if (dist(xpos, ypos, right, top) <= rad ) 
    {
      if (xpos - right > top - ypos)
      {
        xdirection *= -1;
      }
      else if (xpos - right < top - ypos)
      {
        ydirection *= -1;
      }
      else if (xpos - right == top - ypos) 
      {
        xdirection *= -1;
        ydirection *= -1;
      }
    }
  }
  
  //bottom left corner
 else if ( (xpos <= left) && (ypos >= bot) ) 
  {
    if (dist(xpos, ypos, left, bot) <= rad ) 
    {
      if (left - xpos > ypos - bot)
      {
        xdirection *= -1;
      }
      else if (left - xpos < ypos - bot)
      {
        ydirection *= -1;
      }
      else if (left - xpos == ypos - bot) 
      {
        xdirection *= -1;
        ydirection *= -1;
      }
    }
  }
  
  //bottom right corner
else if ( (xpos >= right) && (ypos >= bot) ) 
  {
    if (dist(xpos, ypos, right, bot) <= rad ) 
    {
      if (xpos - right > ypos - bot)
      {
        xdirection *= -1;
      }
      else if (xpos - right < ypos - bot)
      {
        ydirection *= -1;
      }
      else if (xpos - right == ypos - bot) 
      {
        xdirection *= -1;
        ydirection *= -1;
      }
    }
  }
}
        

void mousePressed() {
 if (pause == true) {
 if (mousePressed == true) // pause/play function
 {
   if (looping)
   {
     noLoop();
     noStroke();
     textSize(32);
     fill(150,150,150);
      text("Paused", width - 130, height - 20);
   }
   else loop();
 }
 }
}

    
  
  

  