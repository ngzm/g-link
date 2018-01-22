module Admin::AdvertisesHelper
  def hashed_adtypes
    {
      1 => 'Home',
      2 => 'Ranking'
    }
  end
  def hashed_priorities
    {
      1 => '1番目',
      2 => '2番目',
      3 => '3番目',
      4 => '4番目',
      5 => '5番目',
      6 => '6番目',
      7 => '7番目',
      8 => '8番目',
      99 => '番外'
    }
  end
end
