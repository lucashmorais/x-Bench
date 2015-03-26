BEGIN{
	OFS=", " 
	num_res=split(res, result, " ");

	total_line="var total = "total";"

	result_string=result[1]
	for (i = 2; i < num_res; i++)
		result_string=sprintf("%s, %s", result_string, result[i])

	result_line="var pontuacao = [" result_string "];"
}
{
	if ($0 ~ /var pontuacao/)
		print result_line
	else if ($0 ~ /var total/)
		print total_line
	else
		print $0
}
