DECLARE	@SessionID RowPointerType

EXEC	[dbo].[InitSessionContextSp]
		@ContextName = NULL,
		@SessionID = @SessionID OUTPUT,
		@Site = 'SKP_Dev'

update fs_sro set 
Uf_OpenTime = format(open_date, 'HH:mm'), 
Uf_StartTime = format([start_date], 'HH:mm'),
Uf_CloseTime = format(close_date, 'HH:mm'),
Uf_EndTime = format(end_date, 'HH:mm'),
Uf_MainTime = format(maint_date, 'HH:mm');

update ln 
set
ln.Uf_TimeT1 = format(ln.Uf_ERPP_TimeT1, 'HH:mm'),
ln.Uf_TimeT2 = format(ln.Uf_ERPP_TimeT2, 'HH:mm'),
ln.Uf_TimeT3 = format(ln.Uf_ERPP_TimeT3, 'HH:mm'),
ln.Uf_TimeT4 = format(ln.Uf_ERPP_TimeT4, 'HH:mm'),
ln.Uf_TimeT5 = format(ln.Uf_ERPP_TimeT5, 'HH:mm'),
ln.Uf_TimeT6 = format(ln.Uf_ERPP_TimeT6, 'HH:mm')
from fs_sro_line ln 
    inner join fs_sro s on ln.sro_num = s.sro_num

update ln 
set
ln.Uf_DurationT1 = DATEDIFF(minute, s.open_date, ln.Uf_ERPP_TimeT1),
ln.Uf_DurationT2 = DATEDIFF(minute, ln.Uf_ERPP_TimeT1, ln.Uf_ERPP_TimeT2),
ln.Uf_DurationT3 = DATEDIFF(minute, ln.Uf_ERPP_TimeT2, ln.Uf_ERPP_TimeT3),
ln.Uf_DurationT4 = DATEDIFF(minute, ln.Uf_ERPP_TimeT3, ln.Uf_ERPP_TimeT4),
ln.Uf_DurationT5 = DATEDIFF(minute, ln.Uf_ERPP_TimeT4, ln.Uf_ERPP_TimeT5),
ln.Uf_DurationT6 = DATEDIFF(minute, ln.Uf_ERPP_TimeT5, ln.Uf_ERPP_TimeT6)
from fs_sro_line ln 
    inner join fs_sro s on ln.sro_num = s.sro_num
