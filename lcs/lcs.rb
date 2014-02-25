def suffices str
  results = []
  len = str.chars.length
  (len - 1).downto(0) {|i| results << str[i..(len - 1)]}
  results.sort
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
  suffices = suffices str1 + str2

  lcs = []
  for i in (0...(suffices.length - 1))
      lcs << prefix_lcs(suffices[i], suffices[i+1])
  end

  lcs.reduce({}){|memo,i|memo.merge({i=>i.length})}
     .max_by{|key,value|value}[0]
end

