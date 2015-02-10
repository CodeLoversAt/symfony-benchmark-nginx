#!/bin/bash

if [[ -z "$BENCHMARK_HOST" ]]; then echo "BENCHMARK_HOST is unset" && exit 1; fi

if [[ -z "$BENCHMARK_REQUESTS" ]]; then BENCHMARK_REQUESTS=1000; fi

if [[ -z "$BENCHMARK_USERS" ]]; then BENCHMARK_USERS=10; fi

if [[ -z "$BENCHMARK_TYPE" ]]; then BENCHMARK_TYPE='hhvm'; fi

case "$BENCHMARK_TYPE" in

'hhvm') PORT=8080
  ;;
'php54') PORT=8081
  ;;
'php55') PORT=8082
  ;;
esac

URL=http://$BENCHMARK_HOST:$PORT/api/icons?search=$BENCHMARK_SEARCH

# warm up cache

echo "warming up cache for $URL"
for i in {1..100}; do
echo "request $i of 100 warmup requests" && curl --silent -o /dev/null $URL
done

echo "benchmarking $BENCHMARK_TYPE with $BENCHMARK_USERS users and $BENCHMARK_REQUESTS requests"

CMD="ab -n $BENCHMARK_REQUESTS -c $BENCHMARK_USERS $URL"
echo $CMD
$CMD
