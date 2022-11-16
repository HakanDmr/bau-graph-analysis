// Shortest Path Search Query
MATCH (source:CDR), (target:PERSON),
	sp = shortestPath((source)-[*]-(target))
WHERE length(sp) > 1
RETURN sp

// Shortest Path Query with Dijkstra
MATCH (source:CDR)
MATCH (target:PERSON)
CALL apoc.algo.dijkstra(source, target, 'CDR_RECORD', 'duration') YIELD path, weight
RETURN path, weight

// Cell Tower - Person Location Detection
MATCH (ct:CELL_TOWER), (p:PERSON)
WHERE ct.msisdn = p.phone_no
RETURN ct,p