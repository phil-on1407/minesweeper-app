15.times do |index|
  Board.create(
    name: "Sample Board #{index + 1}",
    email: "sample#{index + 1}@example.com",
    width: rand(8..12),
    height: rand(8..12),
    mines: rand(5..20),
    data: MinesweeperGeneratorService.new(rand(8..12), rand(8..12), rand(5..20)).call
  )
end
