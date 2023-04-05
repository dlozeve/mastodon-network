.PHONY: all
all: instances.png instances.svg

toots.csv:
	steampipe query --output csv "select server, reblog_server from mastodon_toot_home" > $@

instances.dot: toots.csv instancegraph.awk
	awk -f instancegraph.awk $< > $@

%.png: %.dot
	dot -Tpng -o $@ $<

%.svg: %.dot
	dot -Tsvg -o $@ $<
