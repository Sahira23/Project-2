-- Project 2: Flowing Lines
-- For this project I wanted to create colorful and flowy lines that change over a party picture.
-- I tried with different directions so the lines could overlap and create fun and flowy patterns.

require("L5")

--  This is where i will load my party picture
partyypic = nil

-- These are the colors I picked for my lines.
-- I wanted a mix of pink, purple, yellow and orange to create that cool party vibe.
Mycolors = {
  {255, 72, 176},   -- pink
  {180, 70, 220},   -- purple
  {255, 232, 0},    -- yellow
  {255, 120, 40},   -- orange
  {255, 160, 210}   -- light pink
}

-- I decided to have 8 main horizontal lines.
Linecount = 8

-- These tables store the positions, thicknesses and colors of my lines.
LineyY = {}
T = {}
Linecolor = {}

-- I used this value to slowly change the waves over time.
WaveMovement = 0

function setup()

  size(600, 800)
  frameRate(60)

  windowTitle("Flowing Lines")
  describe("Colorful flowing lines over a party photograph.")

  -- This is the photograph I choose from my assets folder.
  partyypic = loadImage("assets/party.jpg")

  --" I wanted each horizontal line to have a different look,
  --So I gave them random positions, thicknesses and colors."
  for i = 1, Linecount, 1 do
    LineyY[i] = random(80, 720)
    T[i] = random(12, 25)
    Linecolor[i] = random(Mycolors)
  end
end

function draw()

  -- I placed my picture first so it stays behind everything.
  background(0)
  image(partyypic, 0, 0, width, height)

  noFill()

  -- These are my vertical lines.
  -- I wanted them to move from the top to the bottom.
  for i = 1, 4, 1 do

    x1 = i * width / 5

    -- I used noise to make the lines bend a little.
    x2 = x1 + (noise(WaveMovement + i, 10) - 0.5) * 100

    stroke(15, 5, 25, 160)
    strokeWeight(17)

    bezier(
      x1, 0,
      x1 - 80, height / 3,
      x2 + 80, height * 2 / 3,
      x2, height
    )

    stroke(255, 72, 176, 150)
    strokeWeight(12)

    bezier(
      x1, 0,
      x1 - 80, height / 3,
      x2 + 80, height * 2 / 3,
      x2, height
    )

    -- I added highlight to give my lines a layered type of look
    stroke(255, 180)
    strokeWeight(2)

    bezier(
      x1, 0,
      x1 - 80, height / 3,
      x2 + 80, height * 2 / 3,
      x2, height
    )

  end

  -- I also wanted some diagonal lines to cross the picture to make it chaotic.
  -- These go from the left side to the right side.
  for i = 1, 4, 1 do

    x1 = 0
    x2 = width

    y1 = 100 + i * 130
    y2 = y1 - 250

    stroke(15, 5, 25, 160)
    strokeWeight(17)

    bezier(
      x1, y1,
      width / 3, y1 - 120,
      width * 2 / 3, y2 + 120,
      x2, y2
    )

    -- Purple center of the diagonal line.
    stroke(180, 70, 220, 150)
    strokeWeight(12)

    bezier(
      x1, y1,
      width / 3, y1 - 120,
      width * 2 / 3, y2 + 120,
      x2, y2
    )

    --white highlight.
    stroke(255, 180)
    strokeWeight(2)

    bezier(
      x1, y1,
      width / 3, y1 - 120,
      width * 2 / 3, y2 + 120,
      x2, y2
    )

  end

  -- "These are the main horizontal lines in my artwork.
  -- I wanted these to be thicker and more noticeable."
  for i = 1, Linecount, 1 do

    -- I split each wave into three parts to make it flow across the canvas.
    for j = 1, 3, 1 do

      x1 = (j - 1) * width / 3
      x2 = j * width / 3

      -- I used noise to make the waves more organic.
      y1 = LineyY[i] + (noise(WaveMovement + i, j) - 0.5) * 100
      y2 = LineyY[i] + (noise(WaveMovement + i, j + 1) - 0.5) * 100

      -- outline
      stroke(15, 5, 25, 180)
      strokeWeight(T[i] + 5)

      bezier(
        x1, y1,
        x1 + width / 9, y1 - 45,
        x2 - width / 9, y2 + 45,
        x2, y2
      )

      -- main color of horizontal line.
      stroke(Linecolor[i][1], Linecolor[i][2], Linecolor[i][3], 190)
      strokeWeight(T[i])

      bezier(
        x1, y1,
        x1 + width / 9, y1 - 45,
        x2 - width / 9, y2 + 45,
        x2, y2
      )

      -- I added a thin white line on top to make the thicker "lines" stand out.
      stroke(255, 220)
      strokeWeight(2)

      bezier(
        x1, y1,
        x1 + width / 9, y1 - 45,
        x2 - width / 9, y2 + 45,
        x2, y2
      )

    end
  end

  -- This increases this little by little to keep the lines moving.
  WaveMovement = WaveMovement + 0.003

end

-- This is for when i click the mouse I get new arrangemnts 
function mousePressed()

  for i = 1, Linecount, 1 do

    -- Everytime the mouse is clicked it gives the horizontal lines new positions and colors.
    LineyY[i] = random(80, 720)
    T[i] = random(12, 25)
    Linecolor[i] = random(Mycolors)

  end

end
