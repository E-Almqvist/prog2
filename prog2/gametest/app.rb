#!/usr/bin/ruby -w
require "gosu"

class Arch < Gosu::Image
	attr_accessor :xspeed, :yspeed, :xaccel, :yaccel, :ela, :x, :y
	attr_reader :width, :height
	def initialize(src, xspeed=0, yspeed=0, xaccel=0, yaccel=0.1, ela=-0.5, xpos=0, ypos=0)
		super src
		@x, @y = xpos, ypos
		@xspeed, @yspeed = xspeed, yspeed
		@xaccel, @yaccel = xaccel, yaccel
		@ela = ela
		@width, @height = 64, 64
	end
end

class Game < Gosu::Window
	attr_accessor :caption
	attr_reader :width, :height

	def initialize(width, height)
		super width, height
		@width, @height = width, height
		self.caption = "Test | #{width}x#{height}"

		@arch = Arch.new("arch.png", 0, 0, 0, 0.1, -0.8)
	end

	def update
		@arch.xspeed += @arch.xaccel
		@arch.yspeed += @arch.yaccel

		@arch.x += @arch.xspeed 
		@arch.y += @arch.yspeed 

		if( @arch.y > self.height - @arch.height ) then
			@arch.yspeed *= @arch.ela
		end

		if( @arch.x > self.width - @arch.width ) then
			@arch.x = self.width - @arch.width
		end
		puts("#{@arch.x}, #{@arch.y}")
	end

	def draw
		@arch.draw(@arch.x, @arch.y, 0)
	end
end

game = Game.new(640, 480)
game.show
