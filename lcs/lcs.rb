def suffices str
  str = str.each_char.to_a
  results = []
  len = str.length

  for i in (len-1).downto(0)
    results << str[i..(len-1)]
  end

  results.map{|suffix|suffix.join}.sort
end

def prefix_lcs str1, str2
   result = []
   len1 = str1.length
   len2 = str2.length

   len = (len1 >= len2)?len1 : len2

   for i in (0...len)
     if str1[i] == str2[i]
       result << str1[i]
     else
       break
     end
   end

   result.join
end

def lcs str1, str2
  suffices = suffices str1+str2
  len = str1.length

  lcs = []
  for i in (0...(len-1))
      comp = prefix_lcs(suffices[i], suffices[i+1])
      if comp != ""
        lcs << comp
      end
  end

  lcs.reduce({}){|memo,i|memo.merge({i=>i.length})}
     .max_by{|key,value|value}[0]
end

