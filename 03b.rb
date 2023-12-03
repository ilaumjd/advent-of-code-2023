arr = []
File.foreach('03in') do |line|
  arr << line.chars
end

def is_number?(char)
  char.match?(/[0-9]/)
end

def is_gear?(char)
  char == '*'
end

def check_number_around(x,y,arr)
  num1 = 0
  num2 = 0
  for i in x-1..x+1  
    if i >=0 && i<arr.count
      for j in y-1..y+1
        if j>=0 && j<arr[i].count-1
          if is_number?(arr[i][j])
            num = check_full_number_forward(i,get_first_num(j, arr[i]),arr).to_i
            if num1 == 0
              num1 = num
            else
              num2 = num
            end
          end
        end
      end
    end
  end
  return num1*num2
end

def get_first_num(y,arrx)
  if y-1 < 0 || !is_number?(arrx[y-1])
    return y
  end
  return get_first_num(y-1, arrx)
end

def check_full_number_forward(x,y,arr)
  temp = arr[x][y]
  arr[x][y] = '.'
  if y+1 == arr[x].count-1 || !is_number?(arr[x][y+1])
    return temp
  end
  next_number = check_full_number_forward(x,y+1,arr)
  return temp+next_number
end

total = 0
for i in 0..arr.count-1
  for j in 0..arr[0].count-2
    if is_gear?(arr[i][j])
       total += check_number_around(i,j,arr) 
    end
  end
end

puts total
