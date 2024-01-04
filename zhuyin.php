<?php
$lines = explode("\r\n", file_get_contents('zhuyin.txt'));
$no = 1;
foreach ($lines as $line) {
  echo "[$no]='".explode(' ', $line)[1]."',";
  $no += 1;
}
