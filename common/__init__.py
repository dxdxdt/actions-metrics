import math

def load_data_from_file (path: str, mask_noent = True):
	try:
		with open(path) as f:
			return load_data(f.readline)
	except FileNotFoundError as e:
		if not mask_noent:
			raise e

	return dict()

def load_data (read_f):
	ret = dict()

	while True:
		l = read_f()
		if not l:
			break

		tpl = l.strip().split()
		v = float(tpl[1])
		if math.isfinite(v):
			ret[tpl[0]] = v

	return ret
