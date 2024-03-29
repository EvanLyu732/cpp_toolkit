macro(log)
    string(ASCII 27 Esc)
    set(Green "${Esc}[32m")
    set(Reset "${Esc}[m")
    string(REPLACE ";" " " CONTENT "${ARGV}")
    message(STATUS "${Green}${CONTENT}${Reset}")
endmacro()

macro(log_debug)
    string(ASCII 27 Esc)
    set(Yellow "${Esc}[33m")
    set(Reset "${Esc}[m")
    string(REPLACE ";" " " CONTENT "${ARGV}")
    message(STATUS "${Yellow}${CONTENT}${Reset}")
endmacro()
