require('./stringutils')

local function decrypt(text, key, vigenere_table, ntl, ltn)
  function repeat_key(text, key)
    local rkey = ''

    local ki = 1
    for ti=1,#text do
      if ki <= #key then
        rkey = rkey .. key[ki]
        ki = ki + 1
      else
        ki = 1
        rkey = rkey .. key[ki]
        ki = ki + 1
      end
    end

    return rkey
  end

  local rkey  = repeat_key(text, key)
  local result = {}

  for i=1,#text do
    local row = vigenere_table[ltn[rkey[i]]]

    for ri=1,#row do
      if row[ri] == text[i] then
        table.insert(result, ntl[ri])
      end
    end
  end

  return table.concat(result, '')
end

return decrypt
