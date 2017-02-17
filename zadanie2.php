<?php

$arr = [4, 5, 8, 9, 1, 7, 2];

echo json_encode($arr); echo '<br>';


foreach($arr AS $k => $v){
	array_swap($arr, 2);
}

echo json_encode($arr); echo '<br>';

function array_swap(&$arr, $num){
	$temp = $arr[0];
	$arr[0] = $arr[$num];
	$arr[$num] = $temp;
}