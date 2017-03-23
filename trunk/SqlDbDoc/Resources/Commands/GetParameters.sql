SELECT
	C.name							AS [name],
	TYPE_NAME(C.system_type_id)		AS [type],
	C.max_length					AS [length],
	C.precision						AS [precision], 
	C.scale							AS [scale], 
	C.has_default_value				AS [has_default_value], 
	C.default_value					AS [defalt_value], 
	C.is_output						AS [is_output], 
	P.value							AS [description]
FROM 
	sys.parameters AS C
	LEFT JOIN sys.extended_properties P ON P.class = 2 AND P.major_id = C.object_id AND P.minor_id  = C.parameter_id AND P.name = 'MS_Description'
WHERE C.object_id = @object_id
ORDER BY C.parameter_id