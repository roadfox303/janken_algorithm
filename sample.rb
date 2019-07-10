require 'date'
class Player
  def hand
    # コンソールを入力待ち状態にし、プレイヤーがコンソールから打ち込んだ値を出力する処理のメソッドの処理をこの中に作成する
    puts("0~2の数字を入力してください")
    puts("0:グー    1:チョキ     2:パー")
    return gets.chomp
  end
end

class Enemy
  def hand
    # グー、チョキ、パーの値をランダムに出力するメソッドの処理をこの中に作成する
    rand = []
    shffle = Time.now.to_i % 100
    for i in 0..50 do
      rand[i] = rand(3)
    end
    rand.rotate(shffle * 2)
    return rand[0]
  end
end

class Janken
  def pon(player_hand, enemy_hand)
    # プレイヤーが打ち込んだ値と、Enemyがランダムに出した値でじゃんけんをさせ、その結果をコンソール上に出力するメソッドをこの中に作成する
    # その際、あいこもしくはグー、チョキ、パー以外の値入力時には、もう一度ジャンケンをする
    # 相手がグー、チョキ、パーのうち、何を出したのかも表示させる
    if player_hand == "0" || player_hand == "1" || player_hand == "2"
      player_hand = player_hand.to_i
    else
      restart()
      exit
    end
    result = (player_hand - enemy_hand + 3 )%3

    case result
    when 2
      puts ("勝ち！  【自分：#{shape(player_hand)} / 相手：#{shape(enemy_hand)}】")
    when 1
      puts ("負け…  【自分：#{shape(player_hand)} / 相手：#{shape(enemy_hand)}】")
    when 0
      puts ("あいこ  【自分：#{shape(player_hand)} / 相手：#{shape(enemy_hand)}】")
      restart()
    end
  end
  def shape(num)
    case num
    when 0 then
      num = "グー"
    when 1 then
      num = "チョキ"
    when 2 then
      num = "パー"
    end
    return num
  end
  def restart()
    player = Player.new
    enemy = Enemy.new
    janken = Janken.new
    janken.pon(player.hand, enemy.hand)
  end
end


player = Player.new
enemy = Enemy.new
janken = Janken.new

# 下記の記述で、ジャンケンメソッドが起動される
janken.pon(player.hand, enemy.hand)
