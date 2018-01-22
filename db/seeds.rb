Game.create!([
  {
    title: "Snow Queen 5",
    description: "アナ雪みたいな3つ並べ宝石ゲー",
    url: "https://www.htmlgames.com/game/Snow+Queen+5",
    img: open("#{Rails.root}/public/uploads/game/img/1/mac_wallpaper_2560x1440_00472.jpg"),
    category1: 8, category2: 9, category3: 7,
    access: 6, star: 0.0, gtype: 1
  },
  {
    title: "Disc Pool 2 Player",
    description: "ビリヤードで対決しよう",
    url: "https://www.htmlgames.com/game/Disc+Pool+2+Player",
    img: open("#{Rails.root}/public/uploads/game/img/2/00-52-29-429_640.jpg"),
    category1: 6, category2: 1, category3: 12,
    access: 6, star: 0.0, gtype: 1
  },
  {
    title: "TURBO TASTIC",
    description: "だんだん速くなるドライビングゲーム",
    url: "http://games.cdn.famobi.com/html5games/t/turbotastic/9-edc26b/?fg_domain=play.famobi.com&fg_aid=A1000-1&fg_uid=bc6a49d5-5482-4db5-95c7-af6db7e778cf&fg_pid=4638e320-4444-4514-81c4-d80a8c662371&fg_beat=589#_ga=2.181641831.1581586243.1516626205-73476572.1504926925",
    img: open("#{Rails.root}/public/uploads/game/img/4/hats-829509_640.jpg"),
    category1: 5, category2: 1, category3: 6,
    access: 4, star: 0.0, gtype: 1
  },
  {
    title: "Cleopatra",
    description: "クレオパトラの3宝石並べ",
    url: "https://www.htmlgames.com/game/Cleopatra",
    img: open("#{Rails.root}/public/uploads/game/img/3/camera-813814_640.jpg"),
    category1: 8, category2: 9, category3: 7,
    access: 2, star: 0.0, gtype: 1
  }
])
Instruction.create!([
  {explanation: "同じ色の宝石を3つ並べましょう", step: 1, game_id: 1},
  {explanation: "マウスで宝石を移動します", step: 2, game_id: 1},
  {explanation: "手玉の位置をマウスで変更", step: 1, game_id: 2},
  {explanation: "打つ方向と強さをドラッグ", step: 2, game_id: 2},
  {explanation: "矢印キーで運転", step: 1, game_id: 3},
  {explanation: "マウスでも操作できます", step: 2, game_id: 3},
  {explanation: "だんだん速くなるよ", step: 3, game_id: 3},
  {explanation: "いろんなアイテムも取ろう", step: 4, game_id: 3},
  {explanation: "ガンガン並べてアイティムを落とそう", step: 1, game_id: 4},
  {explanation: "時間内に全アイテムを落とせばクリア", step: 2, game_id: 4},
  {explanation: "ハンマが貯まったらうまく使おう", step: 3, game_id: 4}
])
