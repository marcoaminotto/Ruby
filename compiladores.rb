
#Verifica se há comentario no meio da linha, assim retornando onde há. Senao
#retorna o tamanho normal do array.
def analisyArray(array)
  if array.include?("//")
    return (array.index("//") - 1)
  else
    return array.length
  end
end

array = Array.new

flag = 0
File.open("teste.txt").each do |line|
  save = ""
  word = line.rstrip.split(' ').map(&:downcase)

  if word[0] == "//"
    next
  end

  if word.include?("/*")
    @flag = 1
  end

  if @flag == 1
    if word.include?("*/")
      @flag = 0
    end
    next
  end

  contador = Array.new(word.length, 0)

  final = analisyArray(word)

  for i in 0..final
    for j in (i+1)..final
      if word[i] == word[j]
        contador[i] =+ 1
        word.delete_at(j)
        contador.delete_at(j)
      end
    end
    save <<  word[i].to_s + " "
  end
  array << save
end

puts array

f = File.new("answer.txt", "w")
array.each {|a| f.write(a + "\n")}
f.close
