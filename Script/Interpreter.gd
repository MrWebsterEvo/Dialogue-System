extends Node2D

var STATE: int

enum {AWAITING_COMMAND, # ожидание команды
	READING_STRING, # считывание строки
	READING_COMMAND, # считывание команды
	BREAK # окончание работы интрерпретатора
	}

func read_line(text: String):
	var output_text := ['',''] # 0 - TEXT, 1 - TYPE_OF_COMMAND
	
	STATE = AWAITING_COMMAND
	
	for symbol in text:
		
		# Выполнение работы
		if STATE == AWAITING_COMMAND:
			STATE = define_current_state(symbol)
		
		if STATE == AWAITING_COMMAND:
			continue
		elif STATE == READING_STRING:
			output_text[0] = output_text[0] + reading_string(text)
			if not output_text[1]:
				output_text[1] = 'say'
		elif STATE == READING_COMMAND:
			output_text[0] = output_text[0] + reading_command(text)
			if not output_text[1]:
				output_text[1] = 'command'
		elif STATE == BREAK:
			break
		
	
	return output_text

func define_current_state(symbol: String):
	# Определение необходимости принятия команд
	if STATE == AWAITING_COMMAND:
		match symbol:
			char(34):
				STATE = READING_STRING
			char(32):
				STATE = AWAITING_COMMAND
			_:
				STATE = READING_COMMAND
	return STATE

func reading_string(text: String):
	return text

func reading_command(command: String):
	return command
