/* hosts table creation
 *
 * host descriptions, linked to a zone record. Records in this table
 * can describe host,subdomain delegation,plain mx entry,alias (cname),
 * printer, or glue records (for delegations). 
 *
 * $Id$
 */

CREATE TABLE hosts (
       id	   SERIAL, 
       zone	   INT4 NOT NULL,
       type	   INT4 DEFAULT 0, /* 0=misc,1=host,2=subdomain (delegation),
				      3=mx entry, 4=alias (cname), 5=printer,
  				      6=glue record, 7=alias (arec) */
       
       domain	   TEXT NOT NULL CHECK(domain <> ''),
       ttl	   INT4,          /* TTL for host records, default if NULL */
       class	   CHAR(2) DEFAULT 'IN',
       
       grp	   INT4 DEFAULT -1,  /* ptr to group */
       alias	   INT4 DEFAULT -1,  /* ptr to another rr record */
       cname_txt   TEXT,	     /* CNAME value for out-of-zone alias */
       hinfo_hw	   TEXT,	     /* HINFO hardware */
       hinfo_sw	   TEXT,	     /* HINFO software */
       loc	   TEXT,            
       wks	   INT4 DEFAULT -1, /* ptr to rr_wks table entry */
       mx	   INT4 DEFAULT -1, /* ptr to rr_mx table entry */
       rp_mbox	   TEXT DEFAULT '.',
       rp_txt	   TEXT DEFAULT '.',
       router      INT4 DEFAULT 0, /* router if > 0, also router priority
	                              (1 being highest priority) */
       prn         BOOL DEFAULT false,
		
       ether	   CHAR(12),   /* Ethernet address (MAC) */
       info	   TEXT,       /* Host info (appears as TXT record) */
       location	   TEXT,       /* Host location info */
       dept	   TEXT,       /* Department name */
       huser	   TEXT,       /* User info */

       model       TEXT,       /* host model info */
       serial	   TEXT,       /* serial number */
       misc	   TEXT,       /* misc info */
			       
       comment	   TEXT,

       CONSTRAINT  hosts_key PRIMARY KEY (domain,zone)
) INHERITS(pokemon);

