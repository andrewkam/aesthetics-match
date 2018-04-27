import os
import sys
import psycopg2 as pg
import pandas as pd
import pandas.io.sql as psql

try:
  conn = pg.connect("dbname='irokefea' user='irokefea' host='elmer.db.elephantsql.com' password='ed3f37N-Jv6XTE_xQcYLm3G9jLb6HLzo'")
    
  if len(sys.argv) != 2:
    print("Must supply name of one artist:")
    artists = pd.read_sql('select name, genre from artist order by genre, name;', conn)
    print(artists.to_string(index=False))
    sys.exit()

  artistName = str(sys.argv[1])
  artistCount = pd.read_sql('select count(*) as count from artist where name = %s', conn, params=(artistName,))

  if artistCount['count'][0] != 1:
    print "Must supply name of one of the following artists:\n"
    artists = pd.read_sql('select name, genre from artist order by genre, name;', conn)
    print(artists.to_string(index=False))
    sys.exit()

  sql_recommend = """ SELECT a2.name as artist, a2.genre as genre,
                      SUM(ao1.value*ao2.value) AS object_score,
                      (100 - abs(AVG(ac1.value) - AVG(ac2.value))) AS color_score,
                      SUM(ao1.value*ao2.value) + (100 - abs(AVG(ac1.value) - AVG(ac2.value))) AS total_score
                      FROM artist a1,
                      artist a2,
                      artist_object_score ao1,
                      artist_object_score ao2,
                      artist_color_score ac1,
                      artist_color_score ac2,
                      object o
                      WHERE a1.id = ao1.artistid
                      AND a1.id = ac1.artistid
                      AND a2.id = ao2.artistid
                      AND a2.id = ac2.artistid
                      AND o.id = ao1.objectid
                      AND ao1.objectid = ao2.objectid
                      AND ac1.value != 0
                      AND ac2.value != 0
                      AND a1.name = %s  
                      AND a1.name != a2.name
                      GROUP BY a1.name, a2.name, a2.genre
                      ORDER BY total_score DESC
                      LIMIT 5"""

  table = pd.read_sql(sql_recommend, conn, params=(artistName,))
  print "Top 5 artists matched with:", artistName, "\n"
  print(table.to_string(index=False))
  # cur.close()
  conn.close()

except (Exception, pg.DatabaseError) as error:
  print(error)

finally:
  if conn is not None:
        conn.close()