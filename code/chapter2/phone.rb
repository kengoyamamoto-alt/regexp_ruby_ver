require 'csv'

CSV.foreach("./phone.csv") do |data|
  name = data[0]
  phone_number = data[1]

  match_phone_number = phone_number.match(/[０-９0-9]{2,4}[-ー]?[０-９0-9]{2,4}-?[０-９0-9]{4}/)
  new_data = []

  if(match_phone_number)
    phone_number_new = phone_number.tr('０-９ａ-ｚＡ-Ｚー','0-9a-zA-Z-')
    if(!match_phone_number[0].include?("-"))
      inserted = match_phone_number[0].insert(3,"-")
      result = inserted.insert(7, "-")
      new_data.push([name, result, "OK"])
    else
      new_data.push([name, phone_number_new, "OK"])
    end
  else
    new_data.push([name, phone_number, "NG"])
  end

  CSV.open('phone_new.csv', 'a') do |f|
    p new_data
    new_data.each do |data|
      f << data
    end
  end
end

# [０-９0-9]{2,4}[-ー]?[０-９0-9]{2,4}-?[０-９0-9]{4}