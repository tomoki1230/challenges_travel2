# 旅行プランを表示
def disp_plans(plans)
  puts "旅行プランを選択して下さい。"
  plans.each.with_index(FIRST_PLAN_NUM) do |plan, i|
    puts "#{i}. #{plan[:place]}旅行 (#{plan[:price]}円)"
  end
end

# 旅行プランを選択
def choose_plan(plans)
  while true
    print "プランの番号を選択 > "
    select_plan_num = gets.to_i
    break if (FIRST_PLAN_NUM..LAST_PLAN_NUM).include?(select_plan_num)
    puts "#{FIRST_PLAN_NUM}〜#{LAST_PLAN_NUM}の番号を入力して下さい。"
  end
  chosen_plan_index = select_plan_num - FIRST_PLAN_NUM
  plans[chosen_plan_index]
end

# 人数を決定
def decide_number_of_people(chosen_plan)
  puts "#{chosen_plan[:place]}旅行ですね。\n何名で予約されますか？"
  while true
    print "人数を入力 > "
    reserve_number_of_people = gets.to_i
    break if reserve_number_of_people >= 1
    puts "1以上を入力して下さい。"
  end
  reserve_number_of_people
end

# 合計料金を計算
def calculate_charges(chosen_plan, reserve_number_of_people)
  puts "#{reserve_number_of_people}名ですね。"
  total_price = chosen_plan[:price] * reserve_number_of_people
  if reserve_number_of_people >= DISCOUNT_STANDARD_VALUE
    puts "#{DISCOUNT_STANDARD_VALUE}名以上ですので#{(DISCOUNT_RATE * 100).floor}％割引となります"
    total_price *= AFTER_DISCOUNT_RATE
  end
  puts "合計料金は#{total_price.floor}円になります。"
end
