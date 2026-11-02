
-- Project 2: Riso print
require("L5")

-- These are the colors I picked for my lines.
-- I wanted a mix of pink, blue and yellow for riso print.
Mycolors = {
  {0, 120, 191},     -- blue
  {255, 72, 176},    -- pink
  {255, 232, 0}      -- yellow
}

-- I decided to have 8 main horizontal lines.
Linecount = 8

-- These tables store the positions, thicknesses and colors of my lines.
LineyY = {}
T = {}
Linecolor = {}

function setup()

  size(600, 800)

  windowTitle("Flowing Lines - RISO Print")
  describe("Colorful flowing lines for RISO print.")

  --" I wanted each horizontal line to have a different look,
  --So I gave them random positions, thicknesses and colors."
  for i = 1, Linecount, 1 do
    LineyY[i] = random(80, 720)
    T[i] = random(12, 25)
    Linecolor[i] = random(Mycolors)
  end
end

function draw()

  -- I placed my white background first so it stays behind everything.
  background(255)

  noFill()

  -- These are my vertical lines.
  -- I wanted them to go from the top to the bottom.
  for i = 1, 4, 1 do

    x1 = i * width / 5
    x2 = x1 + (i - 2) * 25

    stroke(0, 120, 191)
    strokeWeight(17)

    bezier(
      x1, 0,
      x1 - 80, height / 3,
      x2 + 80, height * 2 / 3,
      x2, height
    )

    stroke(255, 72, 176)
    strokeWeight(12)

    bezier(
      x1, 0,
      x1 - 80, height / 3,
      x2 + 80, height * 2 / 3,
      x2, height
    )

    -- I added highlight to give my lines a layered type of look
    stroke(255, 232, 0)
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

    stroke(255, 72, 176)
    strokeWeight(17)

    bezier(
      x1, y1,
      width / 3, y1 - 120,
      width * 2 / 3, y2 + 120,
      x2, y2
    )

    -- Blue center of the diagonal line.
    stroke(0, 120, 191)
    strokeWeight(12)

    bezier(
      x1, y1,
      width / 3, y1 - 120,
      width * 2 / 3, y2 + 120,
      x2, y2
    )

    -- Yellow highlight.
    stroke(255, 232, 0)
    strokeWeight(2)

    bezier(
      x1, y1,
      width / 3, y1 - 120,
      width * 2 / 3, y2 + 120,
      x2, y2
    )

  end

  -- "These are the main horizontal lines in my artwork.
  -- I wanted these to be thicker and more noticeable.""
  for i = 1, Linecount, 1 do

    -- I split each wave into three parts to make it flow across the canvas.
    for j = 1, 3, 1 do

      x1 = (j - 1) * width / 3
      x2 = j * width / 3

      -- I used noise to make the waves more organic.
      y1 = LineyY[i] + (j - 1) * 15
      y2 = LineyY[i] + j * 15

      -- outline
      stroke(0, 120, 191)
      strokeWeight(T[i] + 5)

      bezier(
        x1, y1,
        x1 + width / 9, y1 - 45,
        x2 - width / 9, y2 + 45,
        x2, y2
      )

      -- main color of horizontal line.
      stroke(Linecolor[i][1], Linecolor[i][2], Linecolor[i][3])
      strokeWeight(T[i])

      bezier(
        x1, y1,
        x1 + width / 9, y1 - 45,
        x2 - width / 9, y2 + 45,
        x2, y2
      )

      -- I added a thin white line on top to make the thicker "lines" stand out.
      stroke(255, 232, 0)
      strokeWeight(2)

      bezier(
        x1, y1,
        x1 + width / 9, y1 - 45,
        x2 - width / 9, y2 + 45,
        x2, y2
      )

    end
  end

  -- Pink border 
  noFill()
  stroke(255, 72, 176)
  strokeWeight(10)
  rect(5, 5, width - 10, height - 10)

  -- PNG
  if frameCount == 1 then
    save("Flowing-Lines-Print.png")
  end

end
