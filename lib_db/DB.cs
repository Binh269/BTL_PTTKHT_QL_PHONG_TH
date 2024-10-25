using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Text;

namespace lib_db
{
    public class DB
    {
        public string cnstr;
        public string get_status()
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
                        cmd.CommandText = "SP_Phong_TB";
                        cmd.Parameters.Add("@action", SqlDbType.VarChar, 50).Value = "get_infor";
                        object result = cmd.ExecuteScalar();
                        json = (string)result;
                    }
                }
            }
            catch
            {
                json = "{\"ok\":0,\"msg\":\"Lỗi rồi\"}";
            }

            return json;
        }

        public string update_tb(string matb, string maphong, string tentb, int tttbi)
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
                        cmd.CommandText = "SP_Phong_TB";
                        cmd.Parameters.Add("@action", SqlDbType.VarChar, 50).Value = "update_tb";
                        cmd.Parameters.Add("@matb", SqlDbType.NVarChar).Value = matb;
                        cmd.Parameters.Add("@maphong", SqlDbType.NVarChar).Value = maphong;
                        cmd.Parameters.Add("@tentb", SqlDbType.NVarChar).Value = tentb;
                        cmd.Parameters.Add("@tttbi", SqlDbType.Int).Value = tttbi;
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


        
        public string add_tb(string matb, string maphong, string tentb , int tttbi)
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
                        cmd.CommandText = "SP_Phong_TB";
                        cmd.Parameters.Add("@action", SqlDbType.VarChar, 50).Value = "add_tb";
                        cmd.Parameters.Add("@matb", SqlDbType.NVarChar).Value = matb;
                        cmd.Parameters.Add("@maphong", SqlDbType.NVarChar).Value = maphong;
                        cmd.Parameters.Add("@tentb", SqlDbType.NVarChar).Value = tentb;
                        cmd.Parameters.Add("@tttbi", SqlDbType.Int).Value = tttbi;
                        object result = cmd.ExecuteScalar();
                        json = (string)result;
                    }
                }
            }
            catch
            {
                json = "{\"ok\":0,\"msg\":\"Lỗi rồi\"}";
            }
            return json;
        }
        public string add_phong( string maphong, string tenphong, int ttphong)
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
                        cmd.CommandText = "SP_Phong_TB";
                        cmd.Parameters.Add("@action", SqlDbType.VarChar, 50).Value = "add_phong";
                        cmd.Parameters.Add("@maphong", SqlDbType.NVarChar).Value = maphong;
                        cmd.Parameters.Add("@tenphong", SqlDbType.NVarChar).Value = tenphong;
                        cmd.Parameters.Add("@ttphong", SqlDbType.Int).Value = ttphong;
                        object result = cmd.ExecuteScalar();
                        json = (string)result;
                    }
                }
            }
            catch
            {
                json = "{\"ok\":0,\"msg\":\"Lỗi rồi\"}";
            }
            return json;
        }

        public string update_phong(string maphong, string tenphong, int ttphong)
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
                        cmd.CommandText = "SP_Phong_TB";
                        cmd.Parameters.Add("@action", SqlDbType.VarChar, 50).Value = "update_phong";
                        cmd.Parameters.Add("@maphong", SqlDbType.NVarChar).Value = maphong;
                        cmd.Parameters.Add("@tenphong", SqlDbType.NVarChar).Value = tenphong;
                        cmd.Parameters.Add("@ttphong", SqlDbType.Int).Value = ttphong;
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

        public string delete_phong(string maphong)
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
                        cmd.CommandText = "SP_Phong_TB";
                        cmd.Parameters.Add("@action", SqlDbType.VarChar, 50).Value = "delete_phong";
                        cmd.Parameters.Add("@maphong", SqlDbType.VarChar, 50).Value = maphong;
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

        public string delete_tb(string matb)
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
                        cmd.CommandText = "SP_Phong_TB";
                        cmd.Parameters.Add("@action", SqlDbType.VarChar, 50).Value = "delete_tb";
                        cmd.Parameters.Add("@matb", SqlDbType.VarChar, 50).Value = matb;
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
