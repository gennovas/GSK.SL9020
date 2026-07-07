using Mongoose.IDO;
using System;
using System.Data;

namespace GSK.IDOExtensionClasses
{
    [IDOExtensionClass("GSK_ERPP_LossTimes")]
    public class GSK_ERPP_LossTimes : ExtensionClassBase
    {
        [IDOMethod(MethodFlags.None, "Infobar")]
        public int GSK_GetJobtranInfoSp(decimal? JobtranTransNum,
                              ref string JobtranJob,
                              ref int? JobtranSuffix,
                              ref int? JobtranOperNum,
                              ref DateTime? JobtranTransDate,
                              ref string Infobar)
        {
            int severity = 0;

            using (var appDb = CreateAppDB())
            {
                IDbCommand cmd = appDb.CreateCommand();
                cmd.CommandText = @"
                        SELECT job, suffix, oper_num, trans_date, trans_num, posted
                        FROM jobtran
                        WHERE trans_num = @JobtranTransNum";

                IDbDataParameter p = cmd.CreateParameter();
                p.ParameterName = "@JobtranTransNum";
                p.DbType = DbType.Decimal;
                p.Value = JobtranTransNum ?? (object)DBNull.Value;

                cmd.Parameters.Add(p);

                using (IDataReader dr = cmd.ExecuteReader())
                {
                    if (!dr.Read())
                    {
                        severity = 16;
                        Infobar = $"Jobtran [{JobtranTransNum}] not found.";
                        return severity;
                    }

                    string dbJob = dr["job"].ToString();
                    int dbSuffix = Convert.ToInt32(dr["suffix"]);
                    int dbOperNum = Convert.ToInt32(dr["oper_num"]);
                    JobtranTransDate = Convert.ToDateTime(dr["trans_date"]);

                    // Validate
                    if (JobtranSuffix.HasValue && JobtranSuffix.Value != dbSuffix)
                    {
                        severity = 16;
                        Infobar = $"Jobtran suffix mismatch. Expected {dbSuffix}, input {JobtranSuffix}.";
                        return severity;
                    }

                    if (!string.IsNullOrWhiteSpace(JobtranJob) &&
                        !string.Equals(dbJob, JobtranJob, StringComparison.OrdinalIgnoreCase))
                    {
                        severity = 16;
                        Infobar = $"Jobtran job mismatch. Expected {dbJob}, input {JobtranJob}.";
                        return severity;
                    }

                    if (JobtranOperNum.HasValue && JobtranOperNum.Value != dbOperNum)
                    {
                        severity = 16;
                        Infobar = $"Jobtran operation mismatch. Expected {dbOperNum}, input {JobtranOperNum}.";
                        return severity;
                    }


                    JobtranJob = dbJob;
                    JobtranSuffix = dbSuffix;
                    JobtranOperNum = dbOperNum;
                }
            }

            return severity;
        }
    }
}