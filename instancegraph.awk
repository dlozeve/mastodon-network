BEGIN {
  FS=",";
}

NR > 1 {
  if ($6 != "<null>") {
    edges[sprintf("\"%s\" -> \"%s\";", $1, $2)]++;
  } else {
    edges[sprintf("\"%s\";", $1)]++;
  }
}

END {
  print "digraph {";
  print "rankdir = \"LR\";"
  print "node[shape=box, fontname=\"Iosevka Fixed\"];"
  print "edge[arrowhead=normal, arrowsize=0.6, fontname=\"Iosevka Fixed\"];"
  print "bgcolor = \"black\";"
  print "node[color=white, fontcolor=white];"
  print "edge[color=white, fontcolor=white];"
  for (i in edges) {
    print i;
  }
  print "}"
}
