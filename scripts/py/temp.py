#!/usr/bin/env python
import sys

input = sys.argv[1]


def is_anomaly(input):
  return (input.strip().lower())[0:9] == 'anomalies'


print is_anomaly(input)
