# invoke SourceDir generated makefile for pwmled.pem4f
pwmled.pem4f: .libraries,pwmled.pem4f
.libraries,pwmled.pem4f: package/cfg/pwmled_pem4f.xdl
	$(MAKE) -f C:\Users\146676\workspace_v8\ex_PWM/src/makefile.libs

clean::
	$(MAKE) -f C:\Users\146676\workspace_v8\ex_PWM/src/makefile.libs clean

