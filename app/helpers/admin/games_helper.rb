module Admin::GamesHelper
  def hashed_categories
    {
      1 => 'Action',
      2 => 'Adventure',
      3 => 'Battle',
      4 => 'Shooting',
      5 => 'Racing',
      6 => 'Sports',
      7 => 'Fancy',
      8 => 'Jewels',
      9 => 'Puzzle',
      10 => 'Brain',
      11 => 'Table',
      12 => 'Variety'
    }
  end
  def hashed_game_type
    {
      1 => 'HTML5',
      2 => 'Flash',
      99 => 'ETC'
    }
  end
end
