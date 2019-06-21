require('./stringutils')

local function encrypt(text, key, vigenere_table, ntl, ltn)
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
    local x = ltn[text[i]]
    local y = ltn[rkey[i]]

    table.insert(result, vigenere_table[x][y])
  end

  return table.concat(result, '')
end

return encrypt
