using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Text;
using System.Globalization;

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

        public string thietbi_hong()
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
                        cmd.Parameters.Add("@action", SqlDbType.VarChar, 50).Value = "thietbi_hong";
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
        public string thietbi_dangdung()
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
                        cmd.Parameters.Add("@action", SqlDbType.VarChar, 50).Value = "thietbi_dangdung";
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
        public string thietbi_khongdung()
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
                        cmd.Parameters.Add("@action", SqlDbType.VarChar, 50).Value = "thietbi_khongdung";
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

        public string get_tkb()
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
                        cmd.Parameters.Add("@action", SqlDbType.VarChar, 50).Value = "get_tkb";
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
      

        public string add_tkb(string id, DateTime date, TimeSpan time, string maphong, string magv, string malop)
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
                        cmd.Parameters.Add("@action", SqlDbType.VarChar, 50).Value = "add_tkb";
                        cmd.Parameters.Add("@id", SqlDbType.NVarChar, 50).Value = id;
                        cmd.Parameters.Add("@date", SqlDbType.Date).Value = date;
                        cmd.Parameters.Add("@time", SqlDbType.Time).Value = time;
                        cmd.Parameters.Add("@maphong", SqlDbType.NVarChar, 50).Value = maphong;
                        cmd.Parameters.Add("@magv", SqlDbType.NVarChar, 50).Value = magv;
                        cmd.Parameters.Add("@malop", SqlDbType.NVarChar, 50).Value = malop;

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

        public string update_tkb(string id, DateTime date, TimeSpan time, string maphong, string magv, string malop)
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
                        cmd.Parameters.Add("@action", SqlDbType.VarChar, 50).Value = "update_tkb";
                        cmd.Parameters.Add("@id", SqlDbType.NVarChar, 50).Value = id;
                        cmd.Parameters.Add("@date", SqlDbType.Date).Value = date;
                        cmd.Parameters.Add("@time", SqlDbType.Time).Value = time;
                        cmd.Parameters.Add("@maphong", SqlDbType.NVarChar, 50).Value = maphong;
                        cmd.Parameters.Add("@magv", SqlDbType.NVarChar, 50).Value = magv;
                        cmd.Parameters.Add("@malop", SqlDbType.NVarChar, 50).Value = malop;

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

        public string delete_tkb(string id)
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
                        cmd.Parameters.Add("@action", SqlDbType.VarChar, 50).Value = "delete_tkb";
                        cmd.Parameters.Add("@id", SqlDbType.NVarChar, 50).Value = id;

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

        public string thongtin()
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
                        cmd.Parameters.Add("@action", SqlDbType.VarChar, 50).Value = "thongtin";
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
        public string search(string timkiem)
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
                        cmd.Parameters.Add("@action", SqlDbType.VarChar, 50).Value = "search";
                        cmd.Parameters.Add("@timkiem", SqlDbType.NVarChar, 255).Value = timkiem;
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
        public string timkiem_tkb(string timkiem)
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
                        cmd.Parameters.Add("@action", SqlDbType.VarChar, 50).Value = "timkiem_tkb";
                        cmd.Parameters.Add("@timkiem", SqlDbType.NVarChar, 255).Value = timkiem;
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
    }
}
