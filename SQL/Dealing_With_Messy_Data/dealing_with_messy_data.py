############################################################################### 
# dealing_with_messy_data.py
#
# Description: Read the accompanying README for a detailed description of the 
#              problem
#
# Author: Joshua Fagan
#
# Date: July 17, 2021
############################################################################### 

from google.cloud import bigquery


client      = bigquery.Client()

# Fill in with appropriate information when available
dataset_ref = client.dataset()
table_ref   = dataset_ref.table()

dataset     = client.get_dataset(dataset_ref)
table       = client.get_table(table_ref)

query = """
        WITH
          first_name_first AS (
            SELECT
              LOWER(TRIM(SPLIT_PART(full_name, ' ', 1))) AS first_name,
              LOWER(TRIM(SPLIT_PART(full_name, ' ', 2))) AS last_name,
              credit_limit
            FROM prospects
            WHERE NOT full_name LIKE '%, %'
          ),
          last_name_first AS (
            SELECT
              LOWER(TRIM(SPLIT_PART(full_name, ', ', 2))) AS first_name,
              LOWER(TRIM(SPLIT_PART(full_name, ', ', 1))) AS last_name,
              credit_limit
            FROM prospects
            WHERE full_name LIKE '%, %'
          )
        
        SELECT * from prospects
        WHERE full_name LIKE '%,%'
        --  c.first_name,
        --  c.last_name,
        --  c.credit_limit AS old_limit,
        --  MAX(GREATEST(fnf.credit_limit, lnf.credit_limit)) AS new_limit
        --FROM customers AS c
        --  INNER JOIN first_name_first AS fnf
        --    ON LOWER(c.first_name) = fnf.first_name AND
        --       LOWER(c.last_name)  = fnf.last_name
        --  INNER JOIN last_name_first AS lnf
        --    ON LOWER(c.first_name) = lnf.first_name AND
        --       LOWER(c.last_name)  = lnf.last_name
        --WHERE GREATEST(fnf.credit_limit, lnf.credit_limit) > c.credit_limit
        --GROUP BY
        --  c.first_name,
        --  c.last_name,
        --  c.credit_limit
        --ORDER BY
        --  c.first_name ASC,
        --  c.last_name ASC
        """

query_job = client.query(query)
results   = query_job.to_dataframe()
