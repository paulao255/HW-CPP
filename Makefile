PROGRAM_NAME = Executable

all:
	@if [ ! -d "build" ]; then mkdir -p build; fi
	cd build && cmake .. -G Ninja && ninja

run: all
ifeq ($(OS),Windows_NT)
	.\build\bin\$(PROGRAM_NAME).exe
else
	./build/bin/$(PROGRAM_NAME)
endif

install: all
ifeq ($(OS),Windows_NT)
	@if not exist "C:\Program Files\PFC" mkdir "C:\Program Files\PFC"
	copy build\bin\$(PROGRAM_NAME).exe "C:\Program Files\PFC\$(PROGRAM_NAME).exe"
	powershell -Command "$$s=(New-Object -COM WScript.Shell).CreateShortcut([Environment]::GetFolderPath('Desktop')+'\$(PROGRAM_NAME).lnk');$$s.TargetPath='C:\Program Files\PFC\$(PROGRAM_NAME).exe';$$s.Save()"
else
	sudo cp build/bin/$(PROGRAM_NAME) /usr/local/bin/$(PROGRAM_NAME)
endif

uninstall:
ifeq ($(OS),Windows_NT)
	@if exist "C:\Program Files\PFC\$(PROGRAM_NAME).exe" del "C:\Program Files\PFC\$(PROGRAM_NAME).exe" && rmdir "C:\Program Files\PFC"
	@if exist "C:\Users\%USERNAME%\Desktop\$(PROGRAM_NAME).lnk" del "C:\Users\%USERNAME%\Desktop\$(PROGRAM_NAME).lnk"
else
	sudo rm -f /usr/local/bin/$(PROGRAM_NAME)
endif

clean:
ifeq ($(OS),Windows_NT)
	@if exist build rmdir /s /q build
else
	rm -rf build
endif
