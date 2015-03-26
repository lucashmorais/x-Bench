import subprocess, sys

testes = ["update/testDirectUpdate","l10n","functional","endurance","addons/ide@seleniumhq.org"]
if(len(sys.argv) >= 2):
	testes = sys.argv[1:]

tempo = 0


for teste in testes:
	tempo_tes = tempo
	if sys.platform == "linux" or sys.platform == "linux2":
		process = subprocess.Popen(['./linux/run', 'mozmill -m ./msys/firefox/tests/'+teste+'/manifest.ini -b /usr/bin/firefox '], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
	elif sys.platform == "darwin":
		sys.exit()
	elif sys.platform == "win32":
		process = subprocess.Popen('run.cmd mozmill -m /firefox/tests/'+teste+'/manifest.ini -b "C:\\Program Files\\Mozilla Firefox\\firefox.exe"', stdout=subprocess.PIPE, stderr=subprocess.PIPE)

	res = process.communicate()
	out = res[0].split("\n")
	for i in out:
		if("TEST-END" in i):
			tempo+=int(i[i.index("finished in ")+len("finished in "):][:-2])
	if(tempo-tempo_tes == 0):
		print teste,str(tempo-tempo_tes), "ms"

print tempo

