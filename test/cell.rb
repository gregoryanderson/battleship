require 'minitest/autorun';
require 'minitest/pride';
require './lib/cell'
require './lib/ship'

class CellTest<Minitest::Test
    def setup 
        @cell = Cell.new('B4')
    end

    def test_it_exists
        assert_instance_of Cell, @cell
    end

    def test_it_has_attributes
        assert_equal "B4", @cell.coordinate
        assert_equal nil, @cell.ship
    end

    def test_method_empty_initial
        assert_equal true, @cell.empty?
    end

    def test_method_place_ship
        @cruiser = Ship.new('Cruiser', 3)
        @cell.place_ship(@cruiser)
        assert_equal @cruiser, @cell.ship
        assert_equal false, @cell.empty?
    end

    def test_method_fired_upon?
        @cruiser = Ship.new('Cruiser', 3)
        @cell.place_ship(@cruiser)
        assert_equal false, @cell.fired_upon?
        @cell.fire_upon
        assert_equal 2, @cell.ship.health
        assert_equal true, @cell.fired_upon?
    end

    def test_method_render
        @cruiser = Ship.new('Cruiser', 3)
        @cell.place_ship(@cruiser)
        assert_equal ".", @cell.render
        @cell.fire_upon
        assert_equal "H", @cell.render
        @cell.fire_upon
        @cell.fire_upon
        assert_equal "X", @cell.render
    end 

    def test_method_render_no_ship
        assert_equal ".", @cell.render
        @cell.fire_upon 
        assert_equal "M", @cell.render
    end

    def test_method_render_reveal
        @cruiser = Ship.new("Cruiser", 3)
        @cell.place_ship(@cruiser)
        assert_equal "S", @cell.render(true)
    end
end
