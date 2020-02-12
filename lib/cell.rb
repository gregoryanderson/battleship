class Cell
    attr_reader :coordinate, :been_hit
    attr_accessor :ship
    #what are these two doing up here and whats the diff

    def initialize(coordinate)
        @coordinate = coordinate
        @ship = nil
        @been_hit = false
    end

    def empty?
        @ship == nil
        #is this essentially an if/else and does the ? make it so

        #also.. double equals vs single
    end

    def place_ship(ship)
        @ship = ship
    end

    def fired_upon?
        @been_hit
    end

    def fire_upon
        @been_hit = true
        @ship.hit unless empty?
        #tell me more about unless.. 
    end

    def render(reveal_ship=false)
        if fired_upon?
          if (empty? == false)
            if @ship.sunk?
              "X"
            else
              "H"
          end
          else
            "M"
          end
        elsif reveal_ship == true && empty? == false
          "S"
        else
          "."
        end
        #is this the proper line up for this ridiculous nested if
    end
end

