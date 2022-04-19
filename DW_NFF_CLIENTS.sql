with client_Info as
  (
  select IdentificacionCliente
  ,[TIPOIDENTIFICACION]
  ,[FECHACONSENTIMIENTO]
  ,TIENECONSENTIMIENTO
  ,NOMBRE
  , PRIMERAPELLIDO
  , SEGUNDOAPELLIDO
  , email
  , FECHAORIGEN
  ,'LANDING' as Fuente
  , cast(FECHANACIMIENTO as date) as 'FECHANACIMIENTO'
  ,[IDPROVINCIA]
  ,[IDCANTON]
  ,[IDDISTRITO]
  ,[TELEFONOCELULAR]
  ,[TELEFONOCASA]
  ,[GENERO]
  ,case when [ESTADO] = 'AC' then 'Activo' else [ESTADO] 
  end as 'ESTADO'
  , null as 'CATEGORIACLIENTE'
  ,null as 'ESTADOCIVIL'
  ,null [SUCURSALDEFAULT]
  ,null [TIENEBENEFICIOS]
  ,null [ZONARIESGO]
  ,null [TIENEDOUBLEOPTIN]
  ,null [FECHADOUBLEOPTIN]
  ,null [ALIAS]
  ,[IPREGISTRO]
  ,null [OS_REGISTRO]
  ,null [PERMITEWA]
  ,[PERMITELLAMADA]
  ,[PERMITEEMAIL]
  ,[PERMITECOMUNICACIONES]
  ,null [PERMITESMS]
  ,null [TARJETALEALTAD]
  ,null [LOGIN]
  ,[FECHAINICIO]
  ,[FECHAFINAL]
  ,null [FECHAPRIMERACOMPRA]
  ,null [FECHAULTIMACOMPRA]
  ,null [FECHAREGISTRO]
  ,[PROCESOREGISTRO]
  ,null [FECHAUPDATE]
      ,null [PROCESOUPDATE]
      ,null [USUARIOUPDATE]
      ,[REGISTROACTUAL]
      ,[FECHAPROCESOSM]
      ,[ESTADOPROCESADOSM]
      ,[PROCESOSM]
      ,null [EVENTIDSM]
   from [STGNFF].[STG_NFF_LAN].[CLIENTES]
   union all
---------------------
    select IdentificacionCliente
	,case 
		when [TIPOIDENTIFICACION] = 1 then 'Nacional'
		when [TIPOIDENTIFICACION] = 2 then 'Extranjero'
		when [TIPOIDENTIFICACION] = 3 then '-'
		when [TIPOIDENTIFICACION] = 4 then 'Cedula Juridica'
		end as 'TIPOIDENTIFICACION'
		,[FECHACONSENTIMIENTO]
		,TIENECONSENTIMIENTO
		,NOMBRE
		,PRIMERAPELLIDO
		,SEGUNDOAPELLIDO
		,email
		,FECHAORIGEN
	,'CALL CENTER' as Fuente
	, cast(FECHANACIMIENTO as date)as 'FECHANACIMIENTO'
	,[IDPROVINCIA]
	,[IDCANTON]
	,[IDDISTRITO]
	,[TELEFONOCELULAR]
	,[TELEFONOCASA]
	,case when [GENERO] = 'Mujer' then 'F' 
		when [GENERO]= 'Hombre' then 'M' else [GENERO]end as 'GENERO'
	, [ESTADO]
	,[CATEGORIACLIENTE]
    ,[ESTADOCIVIL]
	,[SUCURSALDEFAULT]
    ,[TIENEBENEFICIOS]
    ,[ZONARIESGO]
	,[TIENEDOUBLEOPTIN]
    ,[FECHADOUBLEOPTIN]
    ,[ALIAS]
    ,[IPREGISTRO]
    ,[OS_REGISTRO]
    ,[PERMITEWA]
    ,[PERMITELLAMADA]
	 ,[PERMITEEMAIL]
    ,null [PERMITECOMUNICACIONES]
    , [PERMITESMS]
    ,[TARJETALEALTAD]
    ,[LOGIN]
    ,[FECHAINICIO]
    ,[FECHAFINAL]
    ,[FECHAPRIMERACOMPRA]
    ,[FECHAULTIMACOMPRA]
    ,[FECHAREGISTRO]
    ,[PROCESOREGISTRO]
    ,[FECHAUPDATE]
      ,[PROCESOUPDATE]
      ,[USUARIOUPDATE]
      ,[REGISTROACTUAL]
      ,[FECHAPROCESOSM]
      ,[ESTADOPROCESADOSM]
      ,[PROCESOSM]
      ,[EVENTIDSM]
   from [STGNFF].[STG_NFF_CALL].[CLIENTES] 
--------------------
   union all
    select IdentificacionCliente
	,[TIPOIDENTIFICACION]
	,[FECHACONSENTIMIENTO],
	case
   when TIENECONSENTIMIENTO= 'True' then 'Si' else TIENECONSENTIMIENTO 
   end as 'TIENECONSENTIMIENTO'
   ,NOMBRE
   , PRIMERAPELLIDO
   , SEGUNDOAPELLIDO
   , email
   , FECHAORIGEN
   ,'ECOMMERCE' as Fuente
   , cast(FECHANACIMIENTO as date)as 'FECHANACIMIENTO'
   ,[IDPROVINCIA]
   ,[IDCANTON]
   ,[IDDISTRITO]
   ,[TELEFONOCELULAR]
   ,[TELEFONOCASA]
   ,[GENERO]
   ,null as 'ESTADO'
   ,null as 'CATEGORIACLIENTE'
   ,null as 'ESTADOCIVIL'
   ,null [SUCURSALDEFAULT]
    ,null [TIENEBENEFICIOS]
    ,null [ZONARIESGO]
	,[TIENEDOUBLEOPTIN]
    ,[FECHADOUBLEOPTIN]
    ,[ALIAS]
    ,[IPREGISTRO]
    ,[OS_REGISTRO]
    ,[PERMITEWA]
    ,[PERMITELLAMADA]
	,[PERMITEEMAIL]
    ,null [PERMITECOMUNICACIONES]
	, [PERMITESMS]
    ,[TARJETALEALTAD]
    ,[LOGIN]
    ,[FECHAINICIO]
    ,[FECHAFINAL]
    ,null [FECHAPRIMERACOMPRA]
    ,null [FECHAULTIMACOMPRA]
    ,[FECHAREGISTRO]
    ,[PROCESOREGISTRO]
	,[FECHAUPDATE]
      ,[PROCESOUPDATE]
      ,[USUARIOUPDATE]
      ,[REGISTROACTUAL]
      ,[FECHAPROCESOSM]
      ,[ESTADOPROCESADOSM]
      ,[PROCESOSM]
      ,[EVENTIDSM]
   from [STGNFF].[STG_NFF_WEB].[CLIENTES]
   ---------------------------------------
   union all

   select 
    CEDULA
	,TipoCedula
	,null [FECHACONSENTIMIENTO],
	case
   when AceptacionConsentimiento= 'True' then 'Si' else AceptacionConsentimiento 
   end as 'TIENECONSENTIMIENTO'
   ,NOMBRE
   , Apellido1
   , Apellido2
   , CORREO
   , FechaCreacion
   ,'APP' as Fuente
   , cast(FECHANACIMIENTO as date)as 'FECHANACIMIENTO'
   ,[IDPROVINCIA]
   ,[IDCANTON]
   ,[IDDISTRITO]
   ,[TELEFONO]
   ,null [TELEFONOCASA]
   ,null [GENERO]
   ,null as 'ESTADO'
   ,null as 'CATEGORIACLIENTE'
   ,null as 'ESTADOCIVIL'
   ,null [SUCURSALDEFAULT]
    ,null [TIENEBENEFICIOS]
    ,null [ZONARIESGO]
	,null [TIENEDOUBLEOPTIN]
    ,null [FECHADOUBLEOPTIN]
    ,null [ALIAS]
    ,null [IPREGISTRO]
    ,null [OS_REGISTRO]
    ,null[PERMITEWA]
    ,null [PERMITELLAMADA]
	,null [PERMITEEMAIL]
    ,null [PERMITECOMUNICACIONES]
	,null [PERMITESMS]
    ,null [TARJETALEALTAD]
    ,null [LOGIN]
    ,[FECHAINICIO]
    ,[FECHAFINAL]
    ,[FECHAPRIMERACOMPRA]
    ,[FECHAULTIMACOMPRA]
    ,[FECHAREGISTRO]
    ,[PROCESOREGISTRO]
	,[FECHAUPDATE]
      ,[PROCESOUPDATE]
      ,null [USUARIOUPDATE]
      ,[REGISTROACTUAL]
      ,[FECHAPROCESOSM]
      ,[ESTADOPROCESADOSM]
      ,[PROCESOSM]
      ,null [EVENTIDSM]
  from [STGNFF].[STG_NFF_APP].[DL_Clientes_View]
   )
   select distinct *
   from (select *,row_number() over(
  partition by IdentificacionCliente
order by [FECHACONSENTIMIENTO] desc) as row_num from client_Info ) as tbl
where tbl.row_num = 1 and identificacioncliente is not null and FECHAREGISTRO > datediff(dd,1,getdate())
order by IDENTIFICACIONCLIENTE;
