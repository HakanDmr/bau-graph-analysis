// CALLED Relationships
MATCH 
    (a:PERSON),
    (b:PERSON),
    (cdr:CDR)
WHERE cdr.caller_msisdn = a.phone_no AND cdr.callee_msisdn = b.phone_no
CREATE (a)-[r:CALLED]->(b)
RETURN type(r)

// CDR Relationships
MATCH
    (a:PERSON),
    (cdr:CDR)
WHERE a.phone_no = cdr.callee_msisdn OR a.phone_no = cdr.caller_msisdn
CREATE (a)-[r:CDR_RECORD]->(cdr)
RETURN type(r)

// IPDR_RECORD Relationshipts
MATCH 
    (a:PERSON),
    (ipdr:IPDR)
WHERE a.phone_no = ipdr.msisdn
CREATE (a)-[r:IPDR_RECORD]->(ipdr)
RETURN type(r)

// Cell Tower Relationships for CDR
MATCH 
    (cdr:CDR),
    (ct:CELL_TOWER)
WHERE cdr.caller_loc_cell = ct.loc_cell OR cdr.callee_loc_cell = ct.loc_cell
CREATE (cdr)-[r:CALL_LOC]->(ct)
RETURN type(r)

// Cell Tower Relationships for IPDR
MATCH 
    (ipdr:IPDR),
    (ct:CELL_TOWER)
WHERE ipdr.loc_cell = ct.loc_cell OR ipdr.loc_cell = ct.loc_cell
CREATE (ipdr)-[r:DATA_LOC]->(ct)
RETURN type(r)

// Cell Tower Relationships
MATCH (ct:CELL_TOWER), (p:PERSON)
WHERE ct.msisdn = p.phone_no
CREATE (ct)-[r:PERSON_LOC]->(p)
RETURN type(r)

// APP Relationships for IPDR
MATCH 
    (ipdr:IPDR),
    (app:APP)
WHERE ipdr.destionation_port = app.destionation_port
CREATE (ipdr)-[r:DETECTED_APP]->(app)
RETURN type(r)
