#!/usr/bin/php

<?php

$contents = '';
foreach (glob("src/*.sh") as $file) {
  $contents .= file_get_contents($file) . "\n";
}
file_put_contents('aliases', $contents);