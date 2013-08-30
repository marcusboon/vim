<?php

$match = array();

$blameout = `git blame {$argv[1]} |grep -m1 {$argv[2]}`;
preg_match('/\((.*?)\)/',$blameout, $matches);
$hash = substr($blameout,0,9);

$comment = `git show --oneline $hash|head -n 1`;
echo "{$matches[0]} $comment\n";
