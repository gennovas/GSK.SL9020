/*
ALTER TABLE fs_sro_mst
ADD Uf_OpenDateTime AS
(
    DATEADD(
        MINUTE,
        TRY_CONVERT(INT, LEFT(Uf_OpenTime, 2)) * 60
        + TRY_CONVERT(INT, RIGHT(Uf_OpenTime, 2)),
        CAST(Uf_OpenDate AS DATETIME)
    )
);
ALTER TABLE fs_sro_mst
ADD Uf_StartDateTime AS
(
    DATEADD(
        MINUTE,
        TRY_CONVERT(INT, LEFT(Uf_StartTime, 2)) * 60
        + TRY_CONVERT(INT, RIGHT(Uf_StartTime, 2)),
        CAST(Uf_StartDate AS DATETIME)
    )
);
ALTER TABLE fs_sro_mst
ADD Uf_CloseDateTime AS
(
    DATEADD(
        MINUTE,
        TRY_CONVERT(INT, LEFT(Uf_CloseTime, 2)) * 60
        + TRY_CONVERT(INT, RIGHT(Uf_CloseTime, 2)),
        CAST(Uf_CloseDate AS DATETIME)
    )
);
ALTER TABLE fs_sro_mst
ADD Uf_EndDateTime AS
(
    DATEADD(
        MINUTE,
        TRY_CONVERT(INT, LEFT(Uf_EndTime, 2)) * 60
        + TRY_CONVERT(INT, RIGHT(Uf_EndTime, 2)),
        CAST(Uf_EndDate AS DATETIME)
    )
);
ALTER TABLE fs_sro_mst
ADD Uf_MainDateTime AS
(
    DATEADD(
        MINUTE,
        TRY_CONVERT(INT, LEFT(Uf_MainTime, 2)) * 60
        + TRY_CONVERT(INT, RIGHT(Uf_MainTime, 2)),
        CAST(Uf_MainDate AS DATETIME)
    )
);
*/