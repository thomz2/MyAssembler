from array import array

memory = array("L", [0]) * (1024*1024//4) #1 MByte
                                          #262.144 words
                                          #1 word = 32 bits
                                          #ou 4 bytes

def read_word(end):
	end = end & 0b111111111111111111 # limite
	return memory[end] # retorna word no endereço
	
def write_word(end, val):
	end = end & 0b111111111111111111
	val = val & 0xFFFFFFFF
	memory[end] = val
	
def read_byte(end):
	end = end & 0b11111111111111111111 # 2^20 bytes
	end_word = end >> 2 # divide por 4
	val_word = memory[end_word] # acessa a palavra (4 bytes)
	
	end_byte = end & 0b11 # pega o resto da divisão por 4
	val_byte = val_word >> (end_byte << 3) # deslocar bytes (deslocar 8 bits por vez)
	# byte escolhido está na posição do byte 0, pois foi deslocado
	val_byte = val_byte & 0xFF # retirando os bytes da esquerda do escolhido com
							   # e logico (valor & 0b11111111)
	return val_byte
	
def write_byte(end, val):
	val = val & 0xFF

	end = end & 0b11111111111111111111
	end_word = end >> 2
	val_word = memory[end_word]
	
	end_byte = end & 0b11
	
	mask = ~(0xFF << (end_byte << 3))
	val_word = val_word & mask
	
	val = val << (end_byte << 3)
	
	val_word = val_word | val
	
	memory[end_word] = val_word
	