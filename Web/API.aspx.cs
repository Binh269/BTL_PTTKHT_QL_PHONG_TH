using System;
using System.Collections.Generic;
using Newtonsoft.Json;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web
{
    public partial class API : System.Web.UI.Page
    {
        private static int loginAttempts = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            string action = this.Request["action"];

            switch (action)
            {
                case "get_infor":
                    get_status();
                    break;
                case "add_phong":
                    add_phong();
                    break;
                case "delete_phong":
                    delete_phong();
                    break;
               case "update_phong":
                    update_phong();
                    break;
               case "add_tb":
                    add_tb();
                    break;
                case "delete_tb":
                    delete_tb();
                    break;
               case "update_tb":
                    update_tb();
                    break;
               
                default:
                    thong_bao_loi();
                    break;
            }
        }

       
        void add_tb()
        {
            string matb = this.Request["matb"];
            string maphong = this.Request["maphong"];
            string tentb = this.Request["tentb"];
            int tttbi = int.Parse(this.Request["tttbi"]);

            lib_db.DB db = get_db();
            string json = db.add_tb(matb, maphong, tentb,tttbi);
            this.Response.Write(json);
        }


        void delete_tb()
        {
            string matb = this.Request["matb"];
            if (string.IsNullOrEmpty(matb))
            {
                thong_bao_loi();  
                return;
            }

            lib_db.DB db = get_db();  
            string json = db.delete_tb(matb);  
            this.Response.Write(json); 
        }


        void update_tb()
        {
            string matb = this.Request["matb"];
            string maphong = this.Request["maphong"];
            string tentb = this.Request["tentb"];
            int tttbi = int.Parse(this.Request["tttbi"]);

            lib_db.DB db = get_db();
            string json = db.update_tb(matb, maphong, tentb, tttbi);
            this.Response.Write(json);
        }

        void add_phong()
        {
            string maphong = this.Request["maphong"];
            string tenphong = this.Request["tenphong"];
            int ttphong = int.Parse(this.Request["ttphong"]);

            lib_db.DB db = get_db();
            string json = db.add_phong(maphong, tenphong, ttphong);
            this.Response.Write(json);
        }

        void delete_phong()
        {
            string maphong = this.Request["maphong"];
            if (string.IsNullOrEmpty(maphong))
            {
                thong_bao_loi();
                return;
            }

            lib_db.DB db = get_db();
            string json = db.delete_phong(maphong);
            this.Response.Write(json);
        }


        void update_phong()
        {
            string maphong = this.Request["maphong"];
            string tenphong = this.Request["tenphong"];
            int ttphong = int.Parse(this.Request["ttphong"]);

            lib_db.DB db = get_db();
            string json = db.update_phong(maphong, tenphong, ttphong);
            this.Response.Write(json);
        }

        void thong_bao_loi()
        {
            string rep = "{\"ok\":false,\"msg\":\"Lỗi rồi nhé, ko có action này!\"}";
            this.Response.Write(rep);
        }
        lib_db.DB get_db()
        {
            lib_db.DB db = new lib_db.DB();
            db.cnstr = "Data Source=.;Initial Catalog=QL_TH_BTL;Integrated Security=True;";
            return db;
        }


        void get_status()
        {
            lib_db.DB db = get_db();
            string json = db.get_status();
            this.Response.Write(json);
        }
    }
}
