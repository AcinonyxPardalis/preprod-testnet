cardano-node run \
--config ~/preprod/config\ files/config.json \
--database-path ~/preprod/db \
--socket-path ~/preprod/node.socket \
--port 3001 \
--topology ~/preprod/config\ files/topology.json +RTS -N2 -I0 -A16m -qg -qb --disable-delayed-os-memory-return -RTS
