local generate = require('./generate')
local encrypt = require('./encrypt')
local decrypt = require('./decrypt')

local vigenere_table, ntl, ltn = generate()

local function main()
	io.write('Text: ')
	local text = string.lower(io.read())
	
	io.write('Key: ')
	local key = string.lower(io.read())

	io.write('[E]ncrypt or [D]ecrypt? ')
	local func = io.read()

	local result = nil
	if string.lower(func) == 'e' then
		result = encrypt(text, key, vigenere_table, ntl, ltn)
	elseif string.lower(func) == 'd' then
		result = decrypt(text, key, vigenere_table, ntl, ltn)
	end

	if result == nil then return end

	print(result)
	print(string.upper(result))
end

main()
