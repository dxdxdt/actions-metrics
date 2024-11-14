all: README.md

.PHONY: clean

clean:
	rm -rf data/regions data/latency README.md tmp

data/regions: get-regions
	./get-regions > data/regions.tmp
	mv data/regions.tmp data/regions

data/latency: get-latency data/regions
	./get-latency < data/regions > data/latency.tmp
	mv data/latency.tmp data/latency

data/latency-avg: make-avg data/latency
	./make-avg data/latency-avg data/latency > data/latency-avg.tmp
	mv data/latency-avg.tmp data/latency-avg


tmp/firstplace: data/latency
	mkdir -p tmp
	awk '{print $$2 "\t" $$1}' < data/latency | sort -g | head -n1 | awk '{print $$2}' > tmp/firstplace

data/place: make-place data/latency tmp/firstplace
	./make-place tmp/firstplace < data/place > data/place.tmp
	mv data/place.tmp data/place

tmp/table.md: make-table data/latency-avg data/place
	mkdir -p tmp
	./make-table data/latency-avg data/place > tmp/table.md.tmp
	mv tmp/table.md.tmp tmp/table.md

README.md: make-readme README.skel.md tmp/table.md
	./make-readme tmp/table.md < README.skel.md > README.md.tmp
	mv README.md.tmp README.md
