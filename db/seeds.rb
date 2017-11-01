#
# Games
#
Game.create!(
  title: 'Driving',
  description: 'なんとなくリアルなドライブシミュレータ',
  url: 'aaaa',
  img: '/uploads/tmp/game/img/00-52-29-429_640.jpg',
  category1: 1,
  category2: 2,
  category3: 3,
  star: 4,
  access: 50
)
Game.create!(
  title: 'Breakfast',
  description: 'なんでしょう',
  url: 'bbbbb',
  img: '/uploads/tmp/game/img/burger-827309_640.jpg',
  category1: 4,
  category2: 5,
  category3: 6,
  star: 2,
  access: 120
)
Game.create!(
  title: 'Camera Shooting',
  description: 'いろいろあります',
  url: 'aaaa',
  img: '/uploads/tmp/game/img/camera-813814_640.jpg',
  category1: 7,
  category2: 8,
  category3: 9,
  star: 5,
  access: 200
)
Game.create!(
  title: 'Hats',
  description: 'ぼうしすか',
  url: 'ddddd',
  img: '/uploads/tmp/game/img/hats-829509_640.jpg',
  category1: 5,
  category2: 7,
  category3: 9,
  star: 1,
  access: 10
)
Game.create!(
  title: 'Vegitables',
  description: 'ぷちぷち',
  url: 'aaaa',
  img: '/uploads/tmp/game/img/vegetables-790022_640.jpg',
  category1: 10,
  category2: 11,
  category3: 12,
  star: 2,
  access: 500
)
Game.create!(
  title: 'Honey',
  description: 'これははちみつゲームです',
  url: 'aaaa',
  img: '/uploads/tmp/game/img/honey-823614_640.jpg',
  category1: 2,
  category2: 3,
  category3: 4,
  star: 4,
  access: 33 
)
Game.create!(
  title: 'Morning',
  description: '朝早くにプレイするゲーム',
  url: 'aaaa',
  img: '/uploads/tmp/game/img/morning-819362_640.jpg',
  category1: 1,
  category2: 5,
  category3: 10,
  star: 5,
  access: 403 
)
Game.create!(
  title: 'Water-plant',
  description: 'なんだろうこれは！！',
  url: 'aaaa',
  img: '/uploads/tmp/game/img/water-plant-821293_640.jpg',
  category1: 3,
  category2: 11,
  category3: 12,
  star: 2,
  access: 700
)

#
# Users
#
User.create!(
  name: 'ngzm',
  full_name: 'Nao Ngzm',
  email: 'ngzm@g-link.com'
)
User.create!(
  name: 'test001',
  full_name: 'test taro',
  email: 'taro@test.com'
)
User.create!(
  name: 'sarusaru',
  full_name: 'Osaru Saruwatari',
  email: 'monkey@cats.com'
)

#
# Instructions
#
Instruction.create!(
  game_id: 1,
  inst: 'game1の使い方 - その1'
)
Instruction.create!(
  game_id: 1,
  inst: 'game1の使い方 - その2'
)
Instruction.create!(
  game_id: 1,
  inst: 'game1の使い方 - その3'
)

Instruction.create!(
  game_id: 2,
  inst: 'game2の使い方 - その1'
)
Instruction.create!(
  game_id: 2,
  inst: 'game2の使い方 - その2'
)
Instruction.create!(
  game_id: 2,
  inst: 'game2の使い方 - その3'
)

Instruction.create!(
  game_id: 3,
  inst: 'game3の使い方 - その1'
)
Instruction.create!(
  game_id: 3,
  inst: 'game3の使い方 - その2'
)
Instruction.create!(
  game_id: 3,
  inst: 'game3の使い方 - その3'
)
Instruction.create!(
  game_id: 3,
  inst: 'game3の使い方 - その4'
)
Instruction.create!(
  game_id: 3,
  inst: 'game3の使い方 - その5'
)

Instruction.create!(
  game_id: 4,
  inst: 'game4の使い方 - その1'
)
Instruction.create!(
  game_id: 4,
  inst: 'game4の使い方 - その2'
)
Instruction.create!(
  game_id: 4,
  inst: 'game4の使い方 - その3'
)
Instruction.create!(
  game_id: 4,
  inst: 'game4の使い方 - その4'
)

Instruction.create!(
  game_id: 5,
  inst: 'game5の使い方 - その1'
)
Instruction.create!(
  game_id: 5,
  inst: 'game5の使い方 - その2'
)
Instruction.create!(
  game_id: 5,
  inst: 'game5の使い方 - その3'
)
Instruction.create!(
  game_id: 5,
  inst: 'game5の使い方 - その4'
)
Instruction.create!(
  game_id: 5,
  inst: 'game5の使い方 - その5'
)

#
# Reviews
#
Review.create!(
  game_id: 1,
  user_id: 1,
  star: 5,
  comment: 'とっても楽しいです！'
)
Review.create!(
  game_id: 1,
  user_id: 2,
  star: 4,
  comment: 'これはいいですね'
)
Review.create!(
  game_id: 1,
  user_id: 3,
  star: 2,
  comment: 'すこし難しかったけど慣れたらハマりました'
)

Review.create!(
  game_id: 2,
  user_id: 1,
  star: 3,
  comment: '2は好きです！'
)
Review.create!(
  game_id: 2,
  user_id: 2,
  star: 1,
  comment: 'これは2ですね'
)

Review.create!(
  game_id: 3,
  user_id: 2,
  star: 1,
  comment: 'いろいろおかしい！'
)
Review.create!(
  game_id: 3,
  user_id: 3,
  star: 3,
  comment: '最初あれだけど慣れれば楽しい変なゲーム'
)
Review.create!(
  game_id: 3,
  user_id: 1,
  star: 2,
  comment: 'ちょっと難しいかも'
)
