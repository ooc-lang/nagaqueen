#!/bin/bash
for i in $(find samples/ -name "*.ooc"); do ./nagaqueen < $i; done
