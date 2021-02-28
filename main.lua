function love.load()
	require("Cell") -- Подключаем класс клеток.

	black = { 0, 0, 0 }
	white = { 1, 1, 1 }

	size_cell = 16 -- Размер клетки поля.

	size_x = 14 * size_cell; -- Ширина поля.
	size_y = 28 * size_cell; -- Высота поля.

	size_next = 6 * size_cell; -- размер поля следующей фигуры.

	cell = Cell:new(size_cell)

	x, y = cell:get_coordinates(1, 2)
end

function love.draw()
	-- Зальём фон серым цветом.
	love.graphics.setBackgroundColor(0.8, 0.8, 0.8)

	-- Отрисуем рамки полей чёрным цветом.
	love.graphics.setColor(black)
	love.graphics.setLineWidth(2)
	love.graphics.rectangle("line", 20, 20, size_x, size_y)
	love.graphics.rectangle("line", 264, 20, size_next, size_next)

	-- Зальём поля белым цветом.
	love.graphics.setColor(white)
	love.graphics.rectangle("fill", 20, 20, size_x, size_y)
	love.graphics.rectangle("fill", 264, 20, size_next, size_next)

end