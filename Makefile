ffigen: 
	dart run ffigen --config ffigen.yaml
clean:
	cd example
	flutter clean
get: 
	cd example
	flutter pub get
reget: clean get