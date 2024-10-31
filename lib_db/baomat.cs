using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Text;

namespace lib_db
{
    public class baomat
    {
        public string cnstr;

        public string salt(string uid)
        {
            string json = "";
            {
                try
                {
                    using (SqlConnection conn = new SqlConnection(cnstr))
                    {
                        conn.Open();
                        using (SqlCommand cmd = conn.CreateCommand())
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.CommandText = "SP_baomat";
                            cmd.Parameters.Add("@action", SqlDbType.VarChar, 50).Value = "get_salt";
                            cmd.Parameters.Add("@uid", SqlDbType.VarChar, 50).Value = uid;
                            object result = cmd.ExecuteScalar();
                            json = (string)result;
                        }
                    }
                }
                catch (Exception ex)
                {
                    json = "{\"ok\":0,\"msg\":\"Lỗi rồi: " + ex.Message + "\"}";
                }
                return json;
            }
        }

        public string login(string uid, string pass , string salt)
        {
            string json = "";
            {
                try
                {
                    using (SqlConnection conn = new SqlConnection(cnstr))
                    {
                        conn.Open();
                        using (SqlCommand cmd = conn.CreateCommand())
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.CommandText = "SP_baomat";
                            cmd.Parameters.Add("@action", SqlDbType.VarChar, 50).Value = "login";
                            cmd.Parameters.Add("@uid", SqlDbType.VarChar, 50).Value = uid;
                            cmd.Parameters.Add("@passLogIn", SqlDbType.VarChar, 50).Value = pass;
                            cmd.Parameters.Add("@salt", SqlDbType.VarChar, 50).Value = salt;
                            object result = cmd.ExecuteScalar();
                            json = (string)result;
                        }
                    }
                }
                catch (Exception ex)
                {
                    json = "{\"ok\":0,\"msg\":\"Lỗi rồi: " + ex.Message + "\"}";
                }
                return json;
            }
        }

        public string dangky(string uid, string pwd, string name, string maso, string gmail, string dienthoai, string diachi)
        {
            string json = "";
            try
            {
                using (SqlConnection conn = new SqlConnection(cnstr))
                {
                    conn.Open();
                    using (SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "SP_baomat";
                        cmd.Parameters.Add("@action", SqlDbType.VarChar, 50).Value = "dangky";
                        cmd.Parameters.Add("@user", SqlDbType.VarChar, 50).Value = uid;
                        cmd.Parameters.Add("@pass", SqlDbType.VarChar, 50).Value = pwd;
                        cmd.Parameters.Add("@name", SqlDbType.VarChar, 100).Value = name;
                        cmd.Parameters.Add("@maso", SqlDbType.VarChar, 50).Value = maso;
                        cmd.Parameters.Add("@gmail", SqlDbType.VarChar, 100).Value = gmail;
                        cmd.Parameters.Add("@dienthoai", SqlDbType.VarChar, 20).Value = dienthoai;
                        cmd.Parameters.Add("@diachi", SqlDbType.VarChar, 200).Value = diachi;
                        object result = cmd.ExecuteScalar();
                        json = (string)result;
                    }
                }
            }
            catch (Exception ex)
            {
                json = "{\"ok\":0,\"msg\":\"Lỗi rồi: " + ex.Message + "\"}";
            }
            return json;
        }

    }
}