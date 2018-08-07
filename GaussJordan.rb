# https://en.wikipedia.org/wiki/Gaussian_elimination, a base knowledge if you wanna know more about it.

module GaussJordan
  def self.calc(a)

    a.length.times do |l|
      pivo = a[l][l]
      i = l

      i.upto(a[l].length - 1) do |c|
        a[l][c] /= pivo
      end

      puts ""
      escrever(a)

      a.length.times do |c|
        if (c != l)
          d = a[c][l]
          n = l
          n.upto(a[l].length - 1 ) do |m|
            a[c][m] -= d * a[l][m]
          end
        end
      end

      puts ""
      escrever(a)

    end
    a
  end

  def self.escrever(a)
    a.each do |i|
      puts i.join(' ')
    end
  end
end

a = []
a[0] = [3.0, 1.0, 3.0, 31.0]
a[1] = [1.0, 2.0, 2.0, 25.0]
a[2] = [4.0, 3.0, 1.0, 44.0]

puts "Original Matrix"
GaussJordan.escrever(a)

a = GaussJordan.calc(a)
puts "\nResult"
GaussJordan.escrever(a)

puts "\nx: #{a[0][3].round(2)}\ny: #{a[1][3].round(2)}\nz: #{a[2][3].round(2)}"
