require('./stringutils')

local function generate()
	-- Number to Letter table
  local ntl = {}
  for i=1,26 do
    table.insert(ntl, string.char(string.byte('a')+i-1))
  end

	-- Letter to Number table
  local ltn = {}
  for i=1,26 do
    ltn[ntl[i]] = i
  end

  function generate_alphabet(start)
    local alphabet = {}

    for i=start,26 do
      table.insert(alphabet, ntl[i])
    end

    for i=1,start-1 do
      table.insert(alphabet, ntl[i])
    end

    return alphabet
  end

  local vigenere_table = {}
  for i=1,26 do
    table.insert(vigenere_table, generate_alphabet(i))
  end

  return vigenere_table, ntl, ltn
end

return generate
