using System;
using System.Collections.Generic;
using Newtonsoft.Json;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using lib_db;
using System.Linq;
using Newtonsoft.Json.Linq;
using static lib_db.DB;

namespace Web
{
    public partial class API : System.Web.UI.Page
    {
        private static int loginAttempts = 0;
        Boolean IsLoggedIn = false;

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

                case "dangky":
                    dangky();
                    break;
                case "get_salt":
                    get_salt();
                    break;
                case "login":
                    login();
                    break;
                case "change_tt":
                    change_tt();
                    break;
                case "generate_captcha":
                    GenerateCaptcha();
                    break;
                case "validate_captcha":
                    ValidateCaptcha();
                    break;
                case "check_login":
                    check_login_status();
                    break;

                case "thietbi_hong":
                    thietbi_hong();
                    break;
                case "thietbi_dangdung":
                    thietbi_dangdung();
                    break;
                case "thietbi_khongdung":
                    thietbi_khongdung();
                    break;

                case "get_tkb":
                    get_tkb();
                    break;
                case "add_tkb":
                    add_tkb();
                    break;
                case "update_tkb":
                    update_tkb();
                    break;
                case "delete_tkb":
                    delete_tkb();
                    break;

                case "thongtin":
                    thongtin();
                    break;

                case "search":
                    search();
                    break;
                case "timkiem_tkb":
                    timkiem_tkb();
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

        void change_tt()
        {
            string uid = Request.Form["uid"];
            string passLogIn = Request.Form["passLogIn"];
            string passnew = Request.Form["passnew"];
            string name = Request.Form["name"];
            string maso = Request.Form["maso"];
            string gmail = Request.Form["gmail"];
            string dienthoai = Request.Form["dienthoai"];
            string diachi = Request.Form["diachi"];
            lib_db.baomat db = get_db_bm();
            string json = db.change_tt(uid, passLogIn, passnew, name, maso, gmail, dienthoai, diachi);
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

        lib_db.baomat get_db_bm()
        {
            lib_db.baomat db = new lib_db.baomat();
            db.cnstr = "Data Source=.;Initial Catalog=QL_TH_BTL;Integrated Security=True;";
            return db;
        }



        void get_status()
        {
            lib_db.DB db = get_db();
            string json = db.get_status();
            this.Response.Write(json);
        }
        void thongtin()
        {
            lib_db.DB db = get_db();
            string json = db.thongtin();
            this.Response.Write(json);
        }
        void dangky()
        {
            string user = Request.Form["user"];
            string pass = Request.Form["pass"];
            string name = Request.Form["name"];
            string maso = Request.Form["maso"];
            string gmail = Request.Form["gmail"];
            string dienthoai = Request.Form["dienthoai"];
            string diachi = Request.Form["diachi"];
            lib_db.baomat db = get_db_bm();
            string json = db.dangky(user, pass, name, maso, gmail, dienthoai, diachi);
            this.Response.Write(json);
        }


        void ValidateCaptcha()
        {
            string captchaInput = this.Request["captcha"];
            string captchaSession = Session["Captcha"] as string;

            if (string.IsNullOrEmpty(captchaInput) || captchaInput.Equals(captchaSession, StringComparison.OrdinalIgnoreCase) == false)
            {
                this.Response.Write("{\"ok\":0, \"msg\":\"CAPTCHA không đúng.\"}");
            }
            else
            {
                loginAttempts = 0;
                this.Response.Write("{\"ok\":1, \"msg\":\"CAPTCHA hợp lệ.\"}");
            }
        }
        void GenerateCaptcha()
        {
            CaptchaGenerator captcha = new CaptchaGenerator();
            Session["Captcha"] = captcha.CaptchaCode;
            byte[] imageBytes = captcha.GenerateCaptchaImage();

            Response.ContentType = "image/png";
            Response.BinaryWrite(imageBytes);
            Response.End();
        }
     
        void login()
        {
            string uid = this.Request["uid"];
            string pass = this.Request["passLogIn"];
            string salt = this.Request["salt"];

            if (loginAttempts >= 3)
            {
                string captchaInput = this.Request["captcha"];
                string captchaSession = Session["Captcha"] as string;

                if (captchaInput == null || !captchaInput.Equals(captchaSession, StringComparison.OrdinalIgnoreCase))
                {
                    this.Response.Write("{\"ok\":0, \"msg\":\"CAPTCHA không đúng.\"}");
                    return;
                }
            }

            lib_db.baomat db = get_db_bm();
            string json = db.login(uid, pass, salt);
            this.Response.Write(json);

            if (json.Contains("\"ok\":0"))
            {
                loginAttempts++;
            }
            else
            {
                IsLoggedIn = true;
                Session["IsLoggedIn"] = IsLoggedIn;
                Session["username"] = uid;
                loginAttempts = 0;
                Session.Remove("Captcha");

                var userInfo = JObject.Parse(json);
                Session["name"] = userInfo["name"].ToString();
                Session["maso"] = userInfo["maso"].ToString();
                Session["level"] = (int)userInfo["level"];
                Session["gmail"] = userInfo["gmail"].ToString();
                Session["dienthoai"] = userInfo["dienthoai"].ToString();
                Session["diachi"] = userInfo["diachi"].ToString();
                Session["lastLogin"] = userInfo["lastLogin"].ToString();
            }
        }

        void get_salt()
        {
            string uid = this.Request["uid"];
            lib_db.baomat db = get_db_bm();
            string json = db.salt(uid);
            this.Response.Write(json);
        }
        void Logout()
        {
            IsLoggedIn = false;
            Session.Abandon();
            Response.Write("{\"ok\":1, \"msg\":\"Đăng xuất thành công.\"}");
        }
        void check_login_status()
        {
            if (Session["username"] != null)
            {
                string username = Session["username"].ToString();
                string name = Session["name"] != null ? Session["name"].ToString() : "Không có tên";
                string maso = Session["maso"] != null ? Session["maso"].ToString() : "Không có mã số";
                string level = Session["level"] != null ? Session["level"].ToString() : "Không có cấp độ";
                string gmail = Session["gmail"] != null ? Session["gmail"].ToString() : "Không có gmail";
                string dienthoai = Session["dienthoai"] != null ? Session["dienthoai"].ToString() : "Không có điện thoại";
                string diachi = Session["diachi"] != null ? Session["diachi"].ToString() : "Không có địa chỉ";
                string lastLogin = Session["lastLogin"] != null ? Session["lastLogin"].ToString() : "Chưa có đăng nhập trước";

                this.Response.Write($"{{\"ok\":1, \"username\":\"{username}\", \"name\":\"{name}\", \"maso\":\"{maso}\", \"level\":\"{level}\", \"gmail\":\"{gmail}\", \"dienthoai\":\"{dienthoai}\", \"diachi\":\"{diachi}\", \"lastLogin\":\"{lastLogin}\"}}");
            }
            else
            {
                this.Response.Write("{\"ok\":0, \"msg\":\"Chưa đăng nhập\"}");
            }
        }

        void thietbi_hong()
        {
            lib_db.DB db = get_db();
            string json = db.thietbi_hong();
            this.Response.Write(json);
        }
        void thietbi_khongdung()
        {
            lib_db.DB db = get_db();
            string json = db.thietbi_khongdung();
            this.Response.Write(json);
        }
        void thietbi_dangdung()
        {
            lib_db.DB db = get_db();
            string json = db.thietbi_dangdung();
            this.Response.Write(json);
        }

        void get_tkb()
        {
            lib_db.DB db = get_db();
            string json = db.get_tkb();
            this.Response.Write(json);
        }

        void add_tkb()
        {
            string id = this.Request["id"];
            DateTime date = DateTime.Parse(this.Request["date"]);
            TimeSpan time = TimeSpan.Parse(this.Request["time"]);
            string maphong = this.Request["maphong"];
            string magv = this.Request["magv"];
            string malop = this.Request["malop"];

            lib_db.DB db = get_db();
            string json = db.add_tkb(id, date, time, maphong, magv, malop);
            this.Response.Write(json);
        }

        void update_tkb()
        {
            string id = this.Request["id"];
            DateTime date = DateTime.Parse(this.Request["date"]);
            TimeSpan time = TimeSpan.Parse(this.Request["time"]);
            string maphong = this.Request["maphong"];
            string magv = this.Request["magv"];
            string malop = this.Request["malop"];

            lib_db.DB db = get_db();
            string json = db.update_tkb(id, date, time, maphong, magv, malop);
            this.Response.Write(json);
        }

        void delete_tkb()
        {
            string id = this.Request["id"];
            if (string.IsNullOrEmpty(id))
            {
                thong_bao_loi();
                return;
            }

            lib_db.DB db = get_db();
            string json = db.delete_tkb(id);
            this.Response.Write(json);
        }
        void search()
        {
            string timkiem = this.Request["timkiem"];
            lib_db.DB db = get_db();
            string json = db.search(timkiem);
            this.Response.Write(json);
        }
         void timkiem_tkb()
        {
            string timkiem = this.Request["timkiem"];
            lib_db.DB db = get_db();
            string json = db.timkiem_tkb(timkiem);
            this.Response.Write(json);
        }

    }
}
